import 'dart:async';

Future<void> main() async {
  final StreamController<int> controller = StreamController<int>();
  final StreamSubscription<int> subscription = controller.stream.listen((data) {
    print(data);
  });

  controller.sink.add(1);
  controller.sink.add(2);

  subscription.pause();

  controller.sink.add(3); // This will not be printed yet

  // Resume the stream
  subscription.resume();

  controller.sink.add(4);

  await Future.delayed(Duration(microseconds: 1));

  subscription.cancel(); // Cancel the subscription
  controller.close();
}
