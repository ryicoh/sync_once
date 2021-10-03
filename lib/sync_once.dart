import 'package:synchronized/synchronized.dart';

class SyncOnce {
  bool done = false;
  final Lock l = Lock();

  Future<void> call(Future<void> Function() f) async {
    await l.synchronized(() async {
      if (done) {
        return;
      }
      await f();
      done = true;
    });
  }
}
