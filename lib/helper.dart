import 'dart:io';

List<String> lines(String fpath) => File(fpath).readAsLinesSync();

class EnumeratedValue<T> {
  const EnumeratedValue._(this.val, this.i);
  final T val;
  final int i;
}

extension ListExtensions<T> on List<T> {
  Iterable<EnumeratedValue<T>> enumerate() sync* {
    for (var i = 0; i < length; i++) {
      yield EnumeratedValue._(this[i], i);
    }
  }
}

void printTimedWithHeader<T>(T Function() fn, String header) {
  final start = DateTime.now();
  final res = fn();
  final timestr =
      '[ ${DateTime.now().difference(start).inMilliseconds}ms elapsed ]';
  print('\n[ $header ]\n$res\n$timestr');
}
