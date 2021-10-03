# sync_once

The function will be called only once.

The package inspired by [sync.Once](https://pkg.go.dev/sync#Once) in Go Language.

# Usage

A simple usage example:

```dart
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
```
