import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final glitchTimerProvider = Provider(
  (ref) => Stopwatch(),
);
