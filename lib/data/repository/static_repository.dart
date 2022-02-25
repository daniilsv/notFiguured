import 'package:get_storage/get_storage.dart';

class StaticRepository {
  final timezones = ReadWriteValue<Map<String, String>>(
    'timezones',
    null,
    encoder: (model) => model,
    decoder: (json) => json == null ? null : Map<String, String>.from(json),
  );
}
