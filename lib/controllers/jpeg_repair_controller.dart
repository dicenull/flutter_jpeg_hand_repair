// 参考: https://gist.github.com/Reputeless/0f646895892df57ad3042d6ab3abc053
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_jpeg_hand_repair/controllers/jpeg_password_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final jpegRepairProvider = StateNotifierProvider.autoDispose
    .family<JpegRepairController, AsyncValue<Uint8List>, String>(
  (ref, str) => JpegRepairController(ref.read),
);

class JpegRepairController extends StateNotifier<AsyncValue<Uint8List>> {
  Reader _reader;
  final int _seed;

  JpegRepairController(this._reader)
      : _seed = Random().nextInt(1 << 30),
        super(AsyncValue.loading());

  JpegPasswordController get _passCtrl =>
      _reader(jpegPasswordProvider.notifier);

  void glitch(Uint8List imageData, List<int> inputs) {
    assert(inputs.length == _passCtrl.state.password.length);

    final modifiedBlob = imageData.toList();

    final length = inputs.length;
    List<int> entropies = [];
    final rnd = Random(_seed);
    for (var i = 0; i < length; i++) {
      final e = inputs[i] ^ _passCtrl.state.password[i];
      var d = (inputs[i] - _passCtrl.state.password[i]).abs();
      if (5 > d) d = 10 - d;

      for (var k = 0; k < (d); k++) {
        entropies.add(e);
      }
    }

    for (final entropy in entropies) {
      // JPEG ヘッダ部分（先頭）は改変しない
      // 630 ~ size
      final headerBand = 630 + 10;
      final pos =
          rnd.nextInt(modifiedBlob.length - 1 - headerBand) + headerBand;

      if (entropy != 0) {
        modifiedBlob[pos] = (rnd.nextInt(1 << 8) + entropy).toUnsigned(8);
      }
    }

    state = AsyncValue.data(Uint8List.fromList(modifiedBlob));
  }
}
