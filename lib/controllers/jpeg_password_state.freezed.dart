// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jpeg_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$JpegPasswordStateTearOff {
  const _$JpegPasswordStateTearOff();

  _JpegPasswordState call(
      {List<int> password = const [], bool correctPassword = false}) {
    return _JpegPasswordState(
      password: password,
      correctPassword: correctPassword,
    );
  }
}

/// @nodoc
const $JpegPasswordState = _$JpegPasswordStateTearOff();

/// @nodoc
mixin _$JpegPasswordState {
  List<int> get password => throw _privateConstructorUsedError;
  bool get correctPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JpegPasswordStateCopyWith<JpegPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JpegPasswordStateCopyWith<$Res> {
  factory $JpegPasswordStateCopyWith(
          JpegPasswordState value, $Res Function(JpegPasswordState) then) =
      _$JpegPasswordStateCopyWithImpl<$Res>;
  $Res call({List<int> password, bool correctPassword});
}

/// @nodoc
class _$JpegPasswordStateCopyWithImpl<$Res>
    implements $JpegPasswordStateCopyWith<$Res> {
  _$JpegPasswordStateCopyWithImpl(this._value, this._then);

  final JpegPasswordState _value;
  // ignore: unused_field
  final $Res Function(JpegPasswordState) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? correctPassword = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as List<int>,
      correctPassword: correctPassword == freezed
          ? _value.correctPassword
          : correctPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$JpegPasswordStateCopyWith<$Res>
    implements $JpegPasswordStateCopyWith<$Res> {
  factory _$JpegPasswordStateCopyWith(
          _JpegPasswordState value, $Res Function(_JpegPasswordState) then) =
      __$JpegPasswordStateCopyWithImpl<$Res>;
  @override
  $Res call({List<int> password, bool correctPassword});
}

/// @nodoc
class __$JpegPasswordStateCopyWithImpl<$Res>
    extends _$JpegPasswordStateCopyWithImpl<$Res>
    implements _$JpegPasswordStateCopyWith<$Res> {
  __$JpegPasswordStateCopyWithImpl(
      _JpegPasswordState _value, $Res Function(_JpegPasswordState) _then)
      : super(_value, (v) => _then(v as _JpegPasswordState));

  @override
  _JpegPasswordState get _value => super._value as _JpegPasswordState;

  @override
  $Res call({
    Object? password = freezed,
    Object? correctPassword = freezed,
  }) {
    return _then(_JpegPasswordState(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as List<int>,
      correctPassword: correctPassword == freezed
          ? _value.correctPassword
          : correctPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_JpegPasswordState implements _JpegPasswordState {
  _$_JpegPasswordState(
      {this.password = const [], this.correctPassword = false});

  @JsonKey(defaultValue: const [])
  @override
  final List<int> password;
  @JsonKey(defaultValue: false)
  @override
  final bool correctPassword;

  @override
  String toString() {
    return 'JpegPasswordState(password: $password, correctPassword: $correctPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JpegPasswordState &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.correctPassword, correctPassword) ||
                const DeepCollectionEquality()
                    .equals(other.correctPassword, correctPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(correctPassword);

  @JsonKey(ignore: true)
  @override
  _$JpegPasswordStateCopyWith<_JpegPasswordState> get copyWith =>
      __$JpegPasswordStateCopyWithImpl<_JpegPasswordState>(this, _$identity);
}

abstract class _JpegPasswordState implements JpegPasswordState {
  factory _JpegPasswordState({List<int> password, bool correctPassword}) =
      _$_JpegPasswordState;

  @override
  List<int> get password => throw _privateConstructorUsedError;
  @override
  bool get correctPassword => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JpegPasswordStateCopyWith<_JpegPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
