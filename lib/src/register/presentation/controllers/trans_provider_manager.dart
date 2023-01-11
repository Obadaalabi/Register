

import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageProvider = StateProvider.autoDispose<int>((ref) {
  return 1;
});

final currentTabProvider = StateProvider.autoDispose<int>((ref) {
  return 4;
});






