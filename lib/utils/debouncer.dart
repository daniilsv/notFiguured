import 'dart:async';

class Debouncer<T> {
  Debouncer(duration, onValue) {
    _duration = duration;
    _onValue = onValue;
  }
  Duration _duration;
  void Function(T value) _onValue;

  T _value;
  Timer _timer;
  T get value => _value;

  set value(T val) {
    _value = val;
    if (_timer?.isActive ?? false) return;
    _timer = Timer(
      _duration,
      () => _onValue(_value),
    );
  }
}
