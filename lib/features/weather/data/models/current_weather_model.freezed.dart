// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentWeatherModel {

 String get name; int get dt; int get timezone; WeatherMainModel get main; WindModel get wind; List<WeatherConditionModel> get weather; CurrentWeatherSysModel get sys;
/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWeatherModelCopyWith<CurrentWeatherModel> get copyWith => _$CurrentWeatherModelCopyWithImpl<CurrentWeatherModel>(this as CurrentWeatherModel, _$identity);

  /// Serializes this CurrentWeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CurrentWeatherModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWeatherModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.dt, _this.dt) || other.dt == _this.dt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.main, _this.main) || other.main == _this.main)&&(identical(other.wind, _this.wind) || other.wind == _this.wind)&&const DeepCollectionEquality().equals(other.weather, _this.weather)&&(identical(other.sys, _this.sys) || other.sys == _this.sys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CurrentWeatherModel;
  return Object.hash(runtimeType,_this.name,_this.dt,_this.timezone,_this.main,_this.wind,const DeepCollectionEquality().hash(_this.weather),_this.sys);
}

@override
String toString() {
  final _this = this as CurrentWeatherModel;
  return 'CurrentWeatherModel(name: ${_this.name}, dt: ${_this.dt}, timezone: ${_this.timezone}, main: ${_this.main}, wind: ${_this.wind}, weather: ${_this.weather}, sys: ${_this.sys})';
}


}

/// @nodoc
abstract mixin class $CurrentWeatherModelCopyWith<$Res>  {
  factory $CurrentWeatherModelCopyWith(CurrentWeatherModel value, $Res Function(CurrentWeatherModel) _then) = _$CurrentWeatherModelCopyWithImpl;
@useResult
$Res call({
 String name, int dt, int timezone, WeatherMainModel main, WindModel wind, List<WeatherConditionModel> weather, CurrentWeatherSysModel sys
});


$WeatherMainModelCopyWith<$Res> get main;$WindModelCopyWith<$Res> get wind;$CurrentWeatherSysModelCopyWith<$Res> get sys;

}
/// @nodoc
class _$CurrentWeatherModelCopyWithImpl<$Res>
    implements $CurrentWeatherModelCopyWith<$Res> {
  _$CurrentWeatherModelCopyWithImpl(this._self, this._then);

  final CurrentWeatherModel _self;
  final $Res Function(CurrentWeatherModel) _then;

/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? dt = null,Object? timezone = null,Object? main = null,Object? wind = null,Object? weather = null,Object? sys = null,}) {
  return _then(CurrentWeatherModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as WeatherMainModel,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WindModel,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherConditionModel>,sys: null == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as CurrentWeatherSysModel,
  ));
}
/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherMainModelCopyWith<$Res> get main {
  
  return $WeatherMainModelCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindModelCopyWith<$Res> get wind {
  
  return $WindModelCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWeatherSysModelCopyWith<$Res> get sys {
  
  return $CurrentWeatherSysModelCopyWith<$Res>(_self.sys, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// Adds pattern-matching-related methods to [CurrentWeatherModel].
extension CurrentWeatherModelPatterns on CurrentWeatherModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWeatherModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int dt,  int timezone,  WeatherMainModel main,  WindModel wind,  List<WeatherConditionModel> weather,  CurrentWeatherSysModel sys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWeatherModel() when $default != null:
return $default(_that.name,_that.dt,_that.timezone,_that.main,_that.wind,_that.weather,_that.sys);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int dt,  int timezone,  WeatherMainModel main,  WindModel wind,  List<WeatherConditionModel> weather,  CurrentWeatherSysModel sys)  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherModel():
return $default(_that.name,_that.dt,_that.timezone,_that.main,_that.wind,_that.weather,_that.sys);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int dt,  int timezone,  WeatherMainModel main,  WindModel wind,  List<WeatherConditionModel> weather,  CurrentWeatherSysModel sys)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherModel() when $default != null:
return $default(_that.name,_that.dt,_that.timezone,_that.main,_that.wind,_that.weather,_that.sys);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentWeatherModel extends CurrentWeatherModel {
  const _CurrentWeatherModel({required this.name, required this.dt, this.timezone = 0, required this.main, this.wind = const WindModel(),  List<WeatherConditionModel> weather = const <WeatherConditionModel>[], this.sys = const CurrentWeatherSysModel()}): _weather = weather,super._();
  factory _CurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherModelFromJson(json);

@override final  String name;
@override final  int dt;
@override@JsonKey() final  int timezone;
@override final  WeatherMainModel main;
@override@JsonKey() final  WindModel wind;
 final  List<WeatherConditionModel> _weather;
@override@JsonKey() List<WeatherConditionModel> get weather {
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weather);
}

@override@JsonKey() final  CurrentWeatherSysModel sys;

/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWeatherModelCopyWith<_CurrentWeatherModel> get copyWith => __$CurrentWeatherModelCopyWithImpl<_CurrentWeatherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentWeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWeatherModel&&(identical(other.name, name) || other.name == name)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.main, main) || other.main == main)&&(identical(other.wind, wind) || other.wind == wind)&&const DeepCollectionEquality().equals(other.weather, _weather)&&(identical(other.sys, sys) || other.sys == sys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,dt,timezone,main,wind,const DeepCollectionEquality().hash(_weather),sys);
}

@override
String toString() {
    return 'CurrentWeatherModel(name: $name, dt: $dt, timezone: $timezone, main: $main, wind: $wind, weather: $weather, sys: $sys)';
}


}

/// @nodoc
abstract mixin class _$CurrentWeatherModelCopyWith<$Res> implements $CurrentWeatherModelCopyWith<$Res> {
  factory _$CurrentWeatherModelCopyWith(_CurrentWeatherModel value, $Res Function(_CurrentWeatherModel) _then) = __$CurrentWeatherModelCopyWithImpl;
@override @useResult
$Res call({
 String name, int dt, int timezone, WeatherMainModel main, WindModel wind, List<WeatherConditionModel> weather, CurrentWeatherSysModel sys
});


@override $WeatherMainModelCopyWith<$Res> get main;@override $WindModelCopyWith<$Res> get wind;@override $CurrentWeatherSysModelCopyWith<$Res> get sys;

}
/// @nodoc
class __$CurrentWeatherModelCopyWithImpl<$Res>
    implements _$CurrentWeatherModelCopyWith<$Res> {
  __$CurrentWeatherModelCopyWithImpl(this._self, this._then);

  final _CurrentWeatherModel _self;
  final $Res Function(_CurrentWeatherModel) _then;

/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? dt = null,Object? timezone = null,Object? main = null,Object? wind = null,Object? weather = null,Object? sys = null,}) {
  return _then(_CurrentWeatherModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as WeatherMainModel,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WindModel,weather: null == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherConditionModel>,sys: null == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as CurrentWeatherSysModel,
  ));
}

/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherMainModelCopyWith<$Res> get main {
  
  return $WeatherMainModelCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindModelCopyWith<$Res> get wind {
  
  return $WindModelCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}/// Create a copy of CurrentWeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWeatherSysModelCopyWith<$Res> get sys {
  
  return $CurrentWeatherSysModelCopyWith<$Res>(_self.sys, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// @nodoc
mixin _$CurrentWeatherSysModel {

 String? get country;
/// Create a copy of CurrentWeatherSysModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWeatherSysModelCopyWith<CurrentWeatherSysModel> get copyWith => _$CurrentWeatherSysModelCopyWithImpl<CurrentWeatherSysModel>(this as CurrentWeatherSysModel, _$identity);

  /// Serializes this CurrentWeatherSysModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CurrentWeatherSysModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWeatherSysModel&&(identical(other.country, _this.country) || other.country == _this.country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CurrentWeatherSysModel;
  return Object.hash(runtimeType,_this.country);
}

@override
String toString() {
  final _this = this as CurrentWeatherSysModel;
  return 'CurrentWeatherSysModel(country: ${_this.country})';
}


}

/// @nodoc
abstract mixin class $CurrentWeatherSysModelCopyWith<$Res>  {
  factory $CurrentWeatherSysModelCopyWith(CurrentWeatherSysModel value, $Res Function(CurrentWeatherSysModel) _then) = _$CurrentWeatherSysModelCopyWithImpl;
@useResult
$Res call({
 String? country
});




}
/// @nodoc
class _$CurrentWeatherSysModelCopyWithImpl<$Res>
    implements $CurrentWeatherSysModelCopyWith<$Res> {
  _$CurrentWeatherSysModelCopyWithImpl(this._self, this._then);

  final CurrentWeatherSysModel _self;
  final $Res Function(CurrentWeatherSysModel) _then;

/// Create a copy of CurrentWeatherSysModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = freezed,}) {
  return _then(CurrentWeatherSysModel(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentWeatherSysModel].
extension CurrentWeatherSysModelPatterns on CurrentWeatherSysModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWeatherSysModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWeatherSysModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWeatherSysModel value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherSysModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWeatherSysModel value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherSysModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWeatherSysModel() when $default != null:
return $default(_that.country);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? country)  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherSysModel():
return $default(_that.country);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? country)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherSysModel() when $default != null:
return $default(_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentWeatherSysModel implements CurrentWeatherSysModel {
  const _CurrentWeatherSysModel({this.country});
  factory _CurrentWeatherSysModel.fromJson(Map<String, dynamic> json) => _$CurrentWeatherSysModelFromJson(json);

@override final  String? country;

/// Create a copy of CurrentWeatherSysModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWeatherSysModelCopyWith<_CurrentWeatherSysModel> get copyWith => __$CurrentWeatherSysModelCopyWithImpl<_CurrentWeatherSysModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentWeatherSysModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWeatherSysModel&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,country);
}

@override
String toString() {
    return 'CurrentWeatherSysModel(country: $country)';
}


}

/// @nodoc
abstract mixin class _$CurrentWeatherSysModelCopyWith<$Res> implements $CurrentWeatherSysModelCopyWith<$Res> {
  factory _$CurrentWeatherSysModelCopyWith(_CurrentWeatherSysModel value, $Res Function(_CurrentWeatherSysModel) _then) = __$CurrentWeatherSysModelCopyWithImpl;
@override @useResult
$Res call({
 String? country
});




}
/// @nodoc
class __$CurrentWeatherSysModelCopyWithImpl<$Res>
    implements _$CurrentWeatherSysModelCopyWith<$Res> {
  __$CurrentWeatherSysModelCopyWithImpl(this._self, this._then);

  final _CurrentWeatherSysModel _self;
  final $Res Function(_CurrentWeatherSysModel) _then;

/// Create a copy of CurrentWeatherSysModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = freezed,}) {
  return _then(_CurrentWeatherSysModel(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
