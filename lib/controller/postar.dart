import 'dart:async';

import 'package:eventa_project/view/widgets/home%20page/custom_veiw_poster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentIndexNotifier extends StateNotifier<int> {
  final Ref ref;
  late Timer _timer;

  CurrentIndexNotifier(this.ref) : super(0) {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (state == ref.read(adsProvider).length - 1) {
        state = 0;
      } else {
        state++;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final currentIndexProvider = StateNotifierProvider<CurrentIndexNotifier, int>((ref) {
  return CurrentIndexNotifier(ref);
});
