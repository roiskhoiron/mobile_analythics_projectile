class ObjectTrackerRecorder {
  final String activityName;
  DateTime? _startTime;
  Function(int duration)? _onStopCallback;

  ObjectTrackerRecorder(this.activityName);

  void start() {
    _startTime = DateTime.now();
  }

  void stop() {
    if (_startTime == null) {
      throw Exception('Activity has not started yet');
    }

    final duration = DateTime.now().difference(_startTime!).inSeconds;
    _onStopCallback?.call(duration);
  }

  ObjectTrackerRecorder onStop(Function(int duration) callback) {
    _onStopCallback = callback;
    return this;
  }
}