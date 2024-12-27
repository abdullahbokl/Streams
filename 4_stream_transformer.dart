import 'dart:async';

// stream generator
Stream<int> numberStream() async* {
  yield 1;
  yield 2;
  yield 3;
}

void main() {
  final Stream<double> transformedStream = numberStream().transform(
    // (int) is the input type, (double) is the output type
    //                               <input, output>
    StreamTransformer<int, double>.fromHandlers(
      handleData: (value, sink) => sink.add(value + 1.5),
    ),
  );

  transformedStream.listen((data) {
    print(data); // Prints 2.5, 3.5, 4.5
  });
}
