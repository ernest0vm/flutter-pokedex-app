import 'package:rxdart/subjects.dart';

class StreamManager {
  StreamManager._internal();
  static final StreamManager _instance = StreamManager._internal();
  static StreamManager get instance => _instance;

  final BehaviorSubject<bool> _appIsBusy = BehaviorSubject<bool>();

  void appIsBusy(bool state) {
    _appIsBusy.sink.add(state);
  }

  Stream<bool> get appIsBusyStream => _appIsBusy.stream;
}
