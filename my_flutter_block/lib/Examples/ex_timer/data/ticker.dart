class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    print('hi there $ticks');
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}