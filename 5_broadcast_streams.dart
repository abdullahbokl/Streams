import 'dart:async';

void main() {
  final controller = StreamController<int>.broadcast();

  // Multiple listeners
  final sub1 = controller.stream.listen((data) {
    print('Listener 1: $data');
  });
  controller.stream.listen((data) {
    print('Listener 2: $data');
  });

  controller.sink.add(1);
  controller.sink.add(2);

  controller.close();
}
