import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_password_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final jpegPasswordProvider =
    StateNotifierProvider<JpegPasswordController, JpegPasswordState>(
  (ref) => JpegPasswordController(),
  dependencies: [],
);

class JpegPasswordController extends StateNotifier<JpegPasswordState> {
  JpegPasswordController() : super(JpegPasswordState());

  void generatePass(int digits) {
    state = state.copyWith(
      password: List.generate(digits, (_) => Random().nextInt(9) + 1),
    );
  }

  void checkPassword(List<int> inputs) {
    state = state.copyWith(
      correctPassword: listEquals(inputs, state.password),
    );
  }
}
