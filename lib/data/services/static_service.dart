import 'package:notfiguured/data/api/api.dart';
import 'package:notfiguured/data/repository/static_repository.dart';

class StaticService {
  StaticService(this._staticRepository, this._api);

  final StaticRepository _staticRepository;
  final Api _api;

  Future loadTimezones() async {
    try {
      final res = await _api.api.v1CommonGetTimezonesPost(body: null);
      if (res.body != null) {
        _staticRepository.timezones.val = Map<String, String>.from(res.body);
      }
    } finally {}
  }

  Future init() async {
    if (_staticRepository.timezones.val == null) await loadTimezones();
  }
}
