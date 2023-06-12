class CurrentCommandService {

  String? lastError;

  Function? _complete;

  void start(Function? complete) {
    _complete = complete;
  }

  Future<void> executeCurrent() async {
    await _complete!();
    _complete = null;
  }

  pushLastError(String? error) {
    lastError = error;
  }

  String? popLastError() {
    String? result = lastError;

    lastError = null;

    return result;
  }
}