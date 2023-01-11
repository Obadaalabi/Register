import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final clockProvider = StateNotifierProvider<Clock, int>((ref) {
  return Clock();
});
int counter = 5;
class Clock extends StateNotifier<int> {
  late final Timer _timer;
  Clock() : super(counter) {

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {

      if (counter > 0) {
        counter = counter - 1;
      }
      else{
        dispose();
      }
      state = counter ;
    });
  }

  // 4. cancel the timer when finished
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
