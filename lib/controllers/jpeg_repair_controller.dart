import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final jpegRepairProvider =
    StateNotifierProvider<JpegRepairController, JpegRepairState>(
  (ref) => JpegRepairController(),
  dependencies: [],
);

class JpegRepairController extends StateNotifier<JpegRepairState> {
  JpegRepairController() : super(JpegRepairState());

  void generatePass(int digits) {
    state = state.copyWith(
      password: List.generate(digits, (_) => Random().nextInt(9) + 1),
    );
  }

  void glitch(Uint8List imageData, List<int> inputs) {
    assert(inputs.length == state.password.length);

    final modifiedBlob = imageData.toList();

    final length = inputs.length;
    List<int> entropies = [];
    final rnd = Random(12345);
    for (var i = 0; i < length; i++) {
      final e = inputs[i] ^ state.password[i];
      var d = (inputs[i] - state.password[i]).abs();
      if (5 > d) d = 10 - d;

      for (var k = 0; k < (d * 3); k++) {
        entropies.add(e);
      }
    }

    for (final entropy in entropies) {
      // JPEG ヘッダ部分（先頭）は改変しない
      // 630 ~ size
      final pos = rnd.nextInt(modifiedBlob.length - 1 - 630) + 630;

      if (entropy != 0) {
        modifiedBlob[pos] = (rnd.nextInt(1 << 8) + entropy).toUnsigned(8);
      }
    }

    state = state.copyWith(
      image: AsyncValue.data(Uint8List.fromList(modifiedBlob)),
      correctPassword: listEquals(inputs, state.password),
    );
  }
}
