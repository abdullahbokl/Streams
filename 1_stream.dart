// stream generator
Stream<int> counter() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Yield values one at a time
  }
}

void main() {
  final Stream<int> stream = counter();
  stream.listen((data) {
    print(data); // Prints numbers from 1 to 5, one per second
  });
}
