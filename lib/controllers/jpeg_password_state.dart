import 'package:freezed_annotation/freezed_annotation.dart';
part 'jpeg_password_state.freezed.dart';

@freezed
class JpegPasswordState with _$JpegPasswordState {
  factory JpegPasswordState({
    @Default([]) List<int> password,
    @Default(false) bool correctPassword,
  }) = _JpegPasswordState;
}
