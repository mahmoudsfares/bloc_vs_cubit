class MyRepo {
  /// mimicking a network api call
  Future<bool> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
