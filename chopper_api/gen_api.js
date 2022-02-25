const fs = require('fs');
const got = require('got');
const { spawn } = require("child_process");

const urls = [
    'https://api.some.ru/swagger/AccountV1/swagger.json',
    'https://api.some.ru/swagger/UserProfileV1/swagger.json',
    'https://api.some.ru/swagger/SettingsV1/swagger.json',
]

const single = {
    "openapi": "3.0.1",
    "info": {
        "title": "Some Account API v1.0",
        "description": "Web API",
        "version": "v1"
    },
    "security": [
        { "jwt_auth": [] }
    ],
    "paths": {},
    "components": {
        "schemas": {},
        "securitySchemes": {
            "jwt_auth": {
                "type": "http",
                "description": "Specify the authorization token.",
                "scheme": "bearer",
                "bearerFormat": "JWT"
            }
        },
    },
};
async function main() {
    for (const url of urls) {
        const { body: json } = await got(url, {
            responseType: 'json'
        });
        for (const path in json['paths']) {
            single['paths'][path] = json['paths'][path];
        }
        for (const schema in json['components']['schemas']) {
            single['components']['schemas'][schema] = json['components']['schemas'][schema];
        }
    }

    if (!fs.existsSync('./lib/.swagger/'))
        fs.mkdirSync('./lib/.swagger/');
    fs.writeFileSync('./lib/.swagger/swagger_api.swagger', JSON.stringify(single));
    const stream = spawn("flutter", ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'], { shell: true });

    stream.on("close", _ => {
        fs.rmSync('./lib/.swagger/', { recursive: true, force: true });
        let sw_dart = fs.readFileSync('./lib/api/swagger_api.swagger.dart');
        sw_dart = sw_dart.toString().replace(/Bool/g, 'dynamic');
        fs.writeFileSync('./lib/api/swagger_api.swagger.dart', sw_dart);
    });
}

main();