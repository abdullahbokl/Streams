import 'dart:async';

Future<void> main() async {
  final StreamController<int> controller = StreamController<int>();
  // Listening to the stream
  controller.stream.listen((data) {
    print(data); // Prints 1, 2, 3
  });

  // Adding data to the stream
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);

  await Future.delayed(Duration(microseconds: 1));

  controller.close(); // Don't forget to close the stream
}
