import 'package:sync_once/sync_once.dart';

void main() async {
  final once = SyncOnce();

  Future<void> onceBody() async {
    await once(() async {
      print("Only once");
    });
  }

  // call 3 times
  await Future.wait([
    onceBody(),
    onceBody(),
    onceBody(),
  ]);
}

// => Only once
