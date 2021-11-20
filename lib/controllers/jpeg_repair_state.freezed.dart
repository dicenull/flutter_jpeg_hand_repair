// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jpeg_repair_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$JpegRepairStateTearOff {
  const _$JpegRepairStateTearOff();

  _JpegRepairState call(
      {AsyncValue<Uint8List> image = const AsyncValue.loading(),
      int password = 0}) {
    return _JpegRepairState(
      image: image,
      password: password,
    );
  }
}

/// @nodoc
const $JpegRepairState = _$JpegRepairStateTearOff();

/// @nodoc
mixin _$JpegRepairState {
  AsyncValue<Uint8List> get image => throw _privateConstructorUsedError;
  int get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JpegRepairStateCopyWith<JpegRepairState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JpegRepairStateCopyWith<$Res> {
  factory $JpegRepairStateCopyWith(
          JpegRepairState value, $Res Function(JpegRepairState) then) =
      _$JpegRepairStateCopyWithImpl<$Res>;
  $Res call({AsyncValue<Uint8List> image, int password});
}

/// @nodoc
class _$JpegRepairStateCopyWithImpl<$Res>
    implements $JpegRepairStateCopyWith<$Res> {
  _$JpegRepairStateCopyWithImpl(this._value, this._then);

  final JpegRepairState _value;
  // ignore: unused_field
  final $Res Function(JpegRepairState) _then;

  @override
  $Res call({
    Object? image = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Uint8List>,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$JpegRepairStateCopyWith<$Res>
    implements $JpegRepairStateCopyWith<$Res> {
  factory _$JpegRepairStateCopyWith(
          _JpegRepairState value, $Res Function(_JpegRepairState) then) =
      __$JpegRepairStateCopyWithImpl<$Res>;
  @override
  $Res call({AsyncValue<Uint8List> image, int password});
}

/// @nodoc
class __$JpegRepairStateCopyWithImpl<$Res>
    extends _$JpegRepairStateCopyWithImpl<$Res>
    implements _$JpegRepairStateCopyWith<$Res> {
  __$JpegRepairStateCopyWithImpl(
      _JpegRepairState _value, $Res Function(_JpegRepairState) _then)
      : super(_value, (v) => _then(v as _JpegRepairState));

  @override
  _JpegRepairState get _value => super._value as _JpegRepairState;

  @override
  $Res call({
    Object? image = freezed,
    Object? password = freezed,
  }) {
    return _then(_JpegRepairState(
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Uint8List>,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_JpegRepairState implements _JpegRepairState {
  _$_JpegRepairState(
      {this.image = const AsyncValue.loading(), this.password = 0});

  @JsonKey(defaultValue: const AsyncValue.loading())
  @override
  final AsyncValue<Uint8List> image;
  @JsonKey(defaultValue: 0)
  @override
  final int password;

  @override
  String toString() {
    return 'JpegRepairState(image: $image, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JpegRepairState &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$JpegRepairStateCopyWith<_JpegRepairState> get copyWith =>
      __$JpegRepairStateCopyWithImpl<_JpegRepairState>(this, _$identity);
}

abstract class _JpegRepairState implements JpegRepairState {
  factory _JpegRepairState({AsyncValue<Uint8List> image, int password}) =
      _$_JpegRepairState;

  @override
  AsyncValue<Uint8List> get image => throw _privateConstructorUsedError;
  @override
  int get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JpegRepairStateCopyWith<_JpegRepairState> get copyWith =>
      throw _privateConstructorUsedError;
}
