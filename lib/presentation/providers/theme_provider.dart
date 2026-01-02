import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

///Provider inmutable
final colorListProvider = Provider((ref) => colorsList);

final selectedIndexColorProvide = StateProvider((ref) => 0);
