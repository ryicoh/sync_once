import 'package:sync_once/sync_once.dart';
import 'package:test/test.dart';

void main() {
  test("without SyncOnce", () async {
    var counter = 0;
    increment() async {
      counter++;
    }

    for (int i = 0; i < 10; i++) {
      await increment();
    }

    expect(counter, equals(10));
  });

  test("with SyncOnce", () async {
    var counter = 0;
    final once = SyncOnce();
    increment() async {
      await once(() async {
        counter++;
      });
    }

    await Future.wait(List.generate(10, (i) => increment()));

    expect(counter, equals(1));
  });
}
