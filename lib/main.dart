import 'dart:async';

import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/repository/auth_repository.dart';
import 'package:notfiguured/data/repository/measurements_repository.dart';
import 'package:notfiguured/data/services/measurements_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'app/logger.dart';
import 'data/repository/diary_repository.dart';
import 'data/repository/exercise_repository.dart';
import 'data/repository/food_repository.dart';
import 'data/repository/static_repository.dart';
import 'data/repository/user_repository.dart';
import 'data/services/auth_service.dart';
import 'data/services/diary_service.dart';
import 'data/services/exercise_service.dart';
import 'data/services/food_service.dart';
import 'data/services/static_service.dart';
import 'override.dart';
import 'ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await GetStorage.init('exercises');
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    logger.e(errorDetails.toString(), errorDetails.exception, errorDetails.stack);
    if (kDebugMode) return;
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  };
  runZonedGuarded(
    run,
    (error, stackTrace) {
      logger.e('Catched error', error, stackTrace);
      if (kDebugMode) return;
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}

void run() {
  runApp(_App());
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = App();
    final provided = MultiProvider(
      providers: [
        Provider(create: (ctx) => AuthRepository()),
        Provider(create: (ctx) => Api(ctx.read<AuthRepository>())),
        Provider(create: (ctx) => UserRepository()),
        Provider(
          lazy: false,
          create: (ctx) => AuthService(
            ctx.read<AuthRepository>(),
            ctx.read<UserRepository>(),
            ctx.read<Api>(),
          ),
        ),
        Provider(create: (ctx) => StaticRepository()),
        Provider(
          lazy: false,
          create: (ctx) => StaticService(
            ctx.read<StaticRepository>(),
            ctx.read<Api>(),
          ),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (ctx) => DiaryService(
            DiaryRepository(),
            ctx.read<AuthService>(),
            ctx.read<Api>(),
          ),
        ),
        Provider(
          lazy: false,
          create: (ctx) => MeasurementsService(
            MeasurementsRepository(),
            ctx.read<AuthService>(),
            ctx.read<Api>(),
          ),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (ctx) => FoodService(
            FoodRepository(),
            ctx.read<AuthService>(),
            ctx.read<Api>(),
          ),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (ctx) => ExerciseService(
            ExerciseRepository(),
            ctx.read<AuthService>(),
            ctx.read<Api>(),
          ),
        ),
      ],
      child: app,
    );
    return SizedApp(
      //// Artem
      // size: const Size(360, 640),
      // ratio: 2.0,
      //// DVS
      // size: const Size(412, 915),
      // ratio: 2.625,
      child: provided,
    );
  }
}
