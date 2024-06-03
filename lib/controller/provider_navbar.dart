
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popupProvider = StateProvider<bool>((ref) => false);
final selectedIconProvider = StateProvider<int>((ref) => -1);
