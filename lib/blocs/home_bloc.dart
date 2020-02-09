import 'dart:async';

class HomeBloc {
  int total = 0;

  final StreamController<bool> _numberOfTapsController = StreamController<bool>();
  Sink<bool> get addTap => _numberOfTapsController.sink;
  Stream<bool> get tap => _numberOfTapsController.stream;

  final StreamController<int> _counterDisplayController = StreamController<int>();
  Sink<int> get incrementCount => _counterDisplayController.sink;
  Stream<int> get currentCount => _counterDisplayController.stream;

  HomeBloc() {
    _startListeners();
  }

  void dispose() {
    _numberOfTapsController.close();
    _counterDisplayController.close();
  }

  void _startListeners() {
    tap.listen((tap) => _increment());
  }

  void _increment() {
    total++;
    incrementCount.add(total);
  }

}