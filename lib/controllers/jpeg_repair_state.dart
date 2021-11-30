import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart';
part 'jpeg_repair_state.freezed.dart';

@freezed
class JpegRepairState with _$JpegRepairState {
  factory JpegRepairState({
    @Default(AsyncValue.loading()) AsyncValue<Uint8List> image,
    @Default([]) List<int> password,
    @Default(false) bool correctPassword,
  }) = _JpegRepairState;
}
