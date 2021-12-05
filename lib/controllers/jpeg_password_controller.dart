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

  void generatePass(int digits, {int max = 9}) {
    state = state.copyWith(correctPassword: false);

    if (digits == 1 && max <= 0) {
      state = state.copyWith(password: [1]);
    } else {
      state = state.copyWith(
        password: List.generate(digits, (_) => Random().nextInt(max) + 1),
      );
    }
  }

  void checkPassword(List<int> inputs) {
    state = state.copyWith(
      correctPassword: listEquals(inputs, state.password),
    );
  }
}
