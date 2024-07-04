import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class OTPCubit extends Cubit<int> {
  OTPCubit() : super(90); // Initial state is 1 minute 30 seconds

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state == 0) {
        timer.cancel();
      } else {
        emit(state - 1);
      }
    });
  }

  void resetTimer() {
    emit(90);
    startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
