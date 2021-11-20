import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final jpegRepairProvider =
    StateNotifierProvider<JpegRepairController, JpegRepairState>(
  (ref) => JpegRepairController(),
  dependencies: [],
);

class JpegRepairController extends StateNotifier<JpegRepairState> {
  final rnd = Random();
  JpegRepairController() : super(JpegRepairState());

  void generatePass() {
    state = state.copyWith(password: rnd.nextInt(9) + 1);
  }

  void glitch(Uint8List imageData, List<int> entropies) {
    final modifiedBlob = imageData;

    for (final entropy in entropies) {
      // JPEG ヘッダ部分（先頭）は改変しない
      // 630 ~ size
      final pos = rnd.nextInt(modifiedBlob.length - 1 - 630) + 630;

      if (entropy != state.password) {
        modifiedBlob[pos] = (rnd.nextInt(1 << 8) + entropy).toUnsigned(8);
      }
    }

    state = state.copyWith(image: AsyncValue.data(modifiedBlob));
  }
}
