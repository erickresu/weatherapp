// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_parts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherConditionModel {

 String get main; String get description; String get icon;
/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherConditionModelCopyWith<WeatherConditionModel> get copyWith => _$WeatherConditionModelCopyWithImpl<WeatherConditionModel>(this as WeatherConditionModel, _$identity);

  /// Serializes this WeatherConditionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeatherConditionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherConditionModel&&(identical(other.main, _this.main) || other.main == _this.main)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.icon, _this.icon) || other.icon == _this.icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeatherConditionModel;
  return Object.hash(runtimeType,_this.main,_this.description,_this.icon);
}

@override
String toString() {
  final _this = this as WeatherConditionModel;
  return 'WeatherConditionModel(main: ${_this.main}, description: ${_this.description}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $WeatherConditionModelCopyWith<$Res>  {
  factory $WeatherConditionModelCopyWith(WeatherConditionModel value, $Res Function(WeatherConditionModel) _then) = _$WeatherConditionModelCopyWithImpl;
@useResult
$Res call({
 String main, String description, String icon
});




}
/// @nodoc
class _$WeatherConditionModelCopyWithImpl<$Res>
    implements $WeatherConditionModelCopyWith<$Res> {
  _$WeatherConditionModelCopyWithImpl(this._self, this._then);

  final WeatherConditionModel _self;
  final $Res Function(WeatherConditionModel) _then;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? main = null,Object? description = null,Object? icon = null,}) {
  return _then(WeatherConditionModel(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherConditionModel].
extension WeatherConditionModelPatterns on WeatherConditionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherConditionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherConditionModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherConditionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherConditionModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String main,  String description,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
return $default(_that.main,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String main,  String description,  String icon)  $default,) {final _that = this;
switch (_that) {
case _WeatherConditionModel():
return $default(_that.main,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String main,  String description,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _WeatherConditionModel() when $default != null:
return $default(_that.main,_that.description,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherConditionModel implements WeatherConditionModel {
  const _WeatherConditionModel({this.main = '', this.description = '', this.icon = '01d'});
  factory _WeatherConditionModel.fromJson(Map<String, dynamic> json) => _$WeatherConditionModelFromJson(json);

@override@JsonKey() final  String main;
@override@JsonKey() final  String description;
@override@JsonKey() final  String icon;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherConditionModelCopyWith<_WeatherConditionModel> get copyWith => __$WeatherConditionModelCopyWithImpl<_WeatherConditionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherConditionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherConditionModel&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,main,description,icon);
}

@override
String toString() {
    return 'WeatherConditionModel(main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$WeatherConditionModelCopyWith<$Res> implements $WeatherConditionModelCopyWith<$Res> {
  factory _$WeatherConditionModelCopyWith(_WeatherConditionModel value, $Res Function(_WeatherConditionModel) _then) = __$WeatherConditionModelCopyWithImpl;
@override @useResult
$Res call({
 String main, String description, String icon
});




}
/// @nodoc
class __$WeatherConditionModelCopyWithImpl<$Res>
    implements _$WeatherConditionModelCopyWith<$Res> {
  __$WeatherConditionModelCopyWithImpl(this._self, this._then);

  final _WeatherConditionModel _self;
  final $Res Function(_WeatherConditionModel) _then;

/// Create a copy of WeatherConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? main = null,Object? description = null,Object? icon = null,}) {
  return _then(_WeatherConditionModel(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WeatherMainModel {

 double get temp;@JsonKey(name: 'feels_like') double get feelsLike;@JsonKey(name: 'temp_min') double get tempMin;@JsonKey(name: 'temp_max') double get tempMax; int get humidity; int get pressure;
/// Create a copy of WeatherMainModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherMainModelCopyWith<WeatherMainModel> get copyWith => _$WeatherMainModelCopyWithImpl<WeatherMainModel>(this as WeatherMainModel, _$identity);

  /// Serializes this WeatherMainModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeatherMainModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherMainModel&&(identical(other.temp, _this.temp) || other.temp == _this.temp)&&(identical(other.feelsLike, _this.feelsLike) || other.feelsLike == _this.feelsLike)&&(identical(other.tempMin, _this.tempMin) || other.tempMin == _this.tempMin)&&(identical(other.tempMax, _this.tempMax) || other.tempMax == _this.tempMax)&&(identical(other.humidity, _this.humidity) || other.humidity == _this.humidity)&&(identical(other.pressure, _this.pressure) || other.pressure == _this.pressure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeatherMainModel;
  return Object.hash(runtimeType,_this.temp,_this.feelsLike,_this.tempMin,_this.tempMax,_this.humidity,_this.pressure);
}

@override
String toString() {
  final _this = this as WeatherMainModel;
  return 'WeatherMainModel(temp: ${_this.temp}, feelsLike: ${_this.feelsLike}, tempMin: ${_this.tempMin}, tempMax: ${_this.tempMax}, humidity: ${_this.humidity}, pressure: ${_this.pressure})';
}


}

/// @nodoc
abstract mixin class $WeatherMainModelCopyWith<$Res>  {
  factory $WeatherMainModelCopyWith(WeatherMainModel value, $Res Function(WeatherMainModel) _then) = _$WeatherMainModelCopyWithImpl;
@useResult
$Res call({
 double temp,@JsonKey(name: 'feels_like') double feelsLike,@JsonKey(name: 'temp_min') double tempMin,@JsonKey(name: 'temp_max') double tempMax, int humidity, int pressure
});




}
/// @nodoc
class _$WeatherMainModelCopyWithImpl<$Res>
    implements $WeatherMainModelCopyWith<$Res> {
  _$WeatherMainModelCopyWithImpl(this._self, this._then);

  final WeatherMainModel _self;
  final $Res Function(WeatherMainModel) _then;

/// Create a copy of WeatherMainModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temp = null,Object? feelsLike = null,Object? tempMin = null,Object? tempMax = null,Object? humidity = null,Object? pressure = null,}) {
  return _then(WeatherMainModel(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherMainModel].
extension WeatherMainModelPatterns on WeatherMainModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherMainModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherMainModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherMainModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherMainModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherMainModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherMainModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'temp_min')  double tempMin, @JsonKey(name: 'temp_max')  double tempMax,  int humidity,  int pressure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherMainModel() when $default != null:
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.humidity,_that.pressure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'temp_min')  double tempMin, @JsonKey(name: 'temp_max')  double tempMax,  int humidity,  int pressure)  $default,) {final _that = this;
switch (_that) {
case _WeatherMainModel():
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.humidity,_that.pressure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike, @JsonKey(name: 'temp_min')  double tempMin, @JsonKey(name: 'temp_max')  double tempMax,  int humidity,  int pressure)?  $default,) {final _that = this;
switch (_that) {
case _WeatherMainModel() when $default != null:
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.humidity,_that.pressure);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherMainModel implements WeatherMainModel {
  const _WeatherMainModel({required this.temp, @JsonKey(name: 'feels_like') required this.feelsLike, @JsonKey(name: 'temp_min') required this.tempMin, @JsonKey(name: 'temp_max') required this.tempMax, this.humidity = 0, this.pressure = 0});
  factory _WeatherMainModel.fromJson(Map<String, dynamic> json) => _$WeatherMainModelFromJson(json);

@override final  double temp;
@override@JsonKey(name: 'feels_like') final  double feelsLike;
@override@JsonKey(name: 'temp_min') final  double tempMin;
@override@JsonKey(name: 'temp_max') final  double tempMax;
@override@JsonKey() final  int humidity;
@override@JsonKey() final  int pressure;

/// Create a copy of WeatherMainModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherMainModelCopyWith<_WeatherMainModel> get copyWith => __$WeatherMainModelCopyWithImpl<_WeatherMainModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherMainModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherMainModel&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,temp,feelsLike,tempMin,tempMax,humidity,pressure);
}

@override
String toString() {
    return 'WeatherMainModel(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, humidity: $humidity, pressure: $pressure)';
}


}

/// @nodoc
abstract mixin class _$WeatherMainModelCopyWith<$Res> implements $WeatherMainModelCopyWith<$Res> {
  factory _$WeatherMainModelCopyWith(_WeatherMainModel value, $Res Function(_WeatherMainModel) _then) = __$WeatherMainModelCopyWithImpl;
@override @useResult
$Res call({
 double temp,@JsonKey(name: 'feels_like') double feelsLike,@JsonKey(name: 'temp_min') double tempMin,@JsonKey(name: 'temp_max') double tempMax, int humidity, int pressure
});




}
/// @nodoc
class __$WeatherMainModelCopyWithImpl<$Res>
    implements _$WeatherMainModelCopyWith<$Res> {
  __$WeatherMainModelCopyWithImpl(this._self, this._then);

  final _WeatherMainModel _self;
  final $Res Function(_WeatherMainModel) _then;

/// Create a copy of WeatherMainModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temp = null,Object? feelsLike = null,Object? tempMin = null,Object? tempMax = null,Object? humidity = null,Object? pressure = null,}) {
  return _then(_WeatherMainModel(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WindModel {

 double get speed;
/// Create a copy of WindModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WindModelCopyWith<WindModel> get copyWith => _$WindModelCopyWithImpl<WindModel>(this as WindModel, _$identity);

  /// Serializes this WindModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WindModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WindModel&&(identical(other.speed, _this.speed) || other.speed == _this.speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WindModel;
  return Object.hash(runtimeType,_this.speed);
}

@override
String toString() {
  final _this = this as WindModel;
  return 'WindModel(speed: ${_this.speed})';
}


}

/// @nodoc
abstract mixin class $WindModelCopyWith<$Res>  {
  factory $WindModelCopyWith(WindModel value, $Res Function(WindModel) _then) = _$WindModelCopyWithImpl;
@useResult
$Res call({
 double speed
});




}
/// @nodoc
class _$WindModelCopyWithImpl<$Res>
    implements $WindModelCopyWith<$Res> {
  _$WindModelCopyWithImpl(this._self, this._then);

  final WindModel _self;
  final $Res Function(WindModel) _then;

/// Create a copy of WindModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speed = null,}) {
  return _then(WindModel(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WindModel].
extension WindModelPatterns on WindModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WindModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WindModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WindModel value)  $default,){
final _that = this;
switch (_that) {
case _WindModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WindModel value)?  $default,){
final _that = this;
switch (_that) {
case _WindModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double speed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WindModel() when $default != null:
return $default(_that.speed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double speed)  $default,) {final _that = this;
switch (_that) {
case _WindModel():
return $default(_that.speed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double speed)?  $default,) {final _that = this;
switch (_that) {
case _WindModel() when $default != null:
return $default(_that.speed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WindModel implements WindModel {
  const _WindModel({this.speed = 0});
  factory _WindModel.fromJson(Map<String, dynamic> json) => _$WindModelFromJson(json);

@override@JsonKey() final  double speed;

/// Create a copy of WindModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WindModelCopyWith<_WindModel> get copyWith => __$WindModelCopyWithImpl<_WindModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WindModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WindModel&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,speed);
}

@override
String toString() {
    return 'WindModel(speed: $speed)';
}


}

/// @nodoc
abstract mixin class _$WindModelCopyWith<$Res> implements $WindModelCopyWith<$Res> {
  factory _$WindModelCopyWith(_WindModel value, $Res Function(_WindModel) _then) = __$WindModelCopyWithImpl;
@override @useResult
$Res call({
 double speed
});




}
/// @nodoc
class __$WindModelCopyWithImpl<$Res>
    implements _$WindModelCopyWith<$Res> {
  __$WindModelCopyWithImpl(this._self, this._then);

  final _WindModel _self;
  final $Res Function(_WindModel) _then;

/// Create a copy of WindModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speed = null,}) {
  return _then(_WindModel(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
