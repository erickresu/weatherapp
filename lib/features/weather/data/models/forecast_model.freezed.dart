// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForecastResponseModel {

 List<ForecastItemModel> get list; ForecastCityModel get city;
/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastResponseModelCopyWith<ForecastResponseModel> get copyWith => _$ForecastResponseModelCopyWithImpl<ForecastResponseModel>(this as ForecastResponseModel, _$identity);

  /// Serializes this ForecastResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastResponseModel&&const DeepCollectionEquality().equals(other.list, _this.list)&&(identical(other.city, _this.city) || other.city == _this.city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastResponseModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.list),_this.city);
}

@override
String toString() {
  final _this = this as ForecastResponseModel;
  return 'ForecastResponseModel(list: ${_this.list}, city: ${_this.city})';
}


}

/// @nodoc
abstract mixin class $ForecastResponseModelCopyWith<$Res>  {
  factory $ForecastResponseModelCopyWith(ForecastResponseModel value, $Res Function(ForecastResponseModel) _then) = _$ForecastResponseModelCopyWithImpl;
@useResult
$Res call({
 List<ForecastItemModel> list, ForecastCityModel city
});


$ForecastCityModelCopyWith<$Res> get city;

}
/// @nodoc
class _$ForecastResponseModelCopyWithImpl<$Res>
    implements $ForecastResponseModelCopyWith<$Res> {
  _$ForecastResponseModelCopyWithImpl(this._self, this._then);

  final ForecastResponseModel _self;
  final $Res Function(ForecastResponseModel) _then;

/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,Object? city = null,}) {
  return _then(ForecastResponseModel(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<ForecastItemModel>,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as ForecastCityModel,
  ));
}
/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForecastCityModelCopyWith<$Res> get city {
  
  return $ForecastCityModelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastResponseModel].
extension ForecastResponseModelPatterns on ForecastResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ForecastResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ForecastItemModel> list,  ForecastCityModel city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastResponseModel() when $default != null:
return $default(_that.list,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ForecastItemModel> list,  ForecastCityModel city)  $default,) {final _that = this;
switch (_that) {
case _ForecastResponseModel():
return $default(_that.list,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ForecastItemModel> list,  ForecastCityModel city)?  $default,) {final _that = this;
switch (_that) {
case _ForecastResponseModel() when $default != null:
return $default(_that.list,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastResponseModel extends ForecastResponseModel {
  const _ForecastResponseModel({ List<ForecastItemModel> list = const <ForecastItemModel>[], this.city = const ForecastCityModel()}): _list = list,super._();
  factory _ForecastResponseModel.fromJson(Map<String, dynamic> json) => _$ForecastResponseModelFromJson(json);

 final  List<ForecastItemModel> _list;
@override@JsonKey() List<ForecastItemModel> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

@override@JsonKey() final  ForecastCityModel city;

/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastResponseModelCopyWith<_ForecastResponseModel> get copyWith => __$ForecastResponseModelCopyWithImpl<_ForecastResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastResponseModel&&const DeepCollectionEquality().equals(other.list, _list)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),city);
}

@override
String toString() {
    return 'ForecastResponseModel(list: $list, city: $city)';
}


}

/// @nodoc
abstract mixin class _$ForecastResponseModelCopyWith<$Res> implements $ForecastResponseModelCopyWith<$Res> {
  factory _$ForecastResponseModelCopyWith(_ForecastResponseModel value, $Res Function(_ForecastResponseModel) _then) = __$ForecastResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<ForecastItemModel> list, ForecastCityModel city
});


@override $ForecastCityModelCopyWith<$Res> get city;

}
/// @nodoc
class __$ForecastResponseModelCopyWithImpl<$Res>
    implements _$ForecastResponseModelCopyWith<$Res> {
  __$ForecastResponseModelCopyWithImpl(this._self, this._then);

  final _ForecastResponseModel _self;
  final $Res Function(_ForecastResponseModel) _then;

/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,Object? city = null,}) {
  return _then(_ForecastResponseModel(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<ForecastItemModel>,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as ForecastCityModel,
  ));
}

/// Create a copy of ForecastResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForecastCityModelCopyWith<$Res> get city {
  
  return $ForecastCityModelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// @nodoc
mixin _$ForecastCityModel {

 String get name; int get timezone;
/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastCityModelCopyWith<ForecastCityModel> get copyWith => _$ForecastCityModelCopyWithImpl<ForecastCityModel>(this as ForecastCityModel, _$identity);

  /// Serializes this ForecastCityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastCityModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastCityModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastCityModel;
  return Object.hash(runtimeType,_this.name,_this.timezone);
}

@override
String toString() {
  final _this = this as ForecastCityModel;
  return 'ForecastCityModel(name: ${_this.name}, timezone: ${_this.timezone})';
}


}

/// @nodoc
abstract mixin class $ForecastCityModelCopyWith<$Res>  {
  factory $ForecastCityModelCopyWith(ForecastCityModel value, $Res Function(ForecastCityModel) _then) = _$ForecastCityModelCopyWithImpl;
@useResult
$Res call({
 String name, int timezone
});




}
/// @nodoc
class _$ForecastCityModelCopyWithImpl<$Res>
    implements $ForecastCityModelCopyWith<$Res> {
  _$ForecastCityModelCopyWithImpl(this._self, this._then);

  final ForecastCityModel _self;
  final $Res Function(ForecastCityModel) _then;

/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? timezone = null,}) {
  return _then(ForecastCityModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ForecastCityModel].
extension ForecastCityModelPatterns on ForecastCityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastCityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastCityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastCityModel value)  $default,){
final _that = this;
switch (_that) {
case _ForecastCityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastCityModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastCityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int timezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastCityModel() when $default != null:
return $default(_that.name,_that.timezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int timezone)  $default,) {final _that = this;
switch (_that) {
case _ForecastCityModel():
return $default(_that.name,_that.timezone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int timezone)?  $default,) {final _that = this;
switch (_that) {
case _ForecastCityModel() when $default != null:
return $default(_that.name,_that.timezone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastCityModel implements ForecastCityModel {
  const _ForecastCityModel({this.name = '', this.timezone = 0});
  factory _ForecastCityModel.fromJson(Map<String, dynamic> json) => _$ForecastCityModelFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  int timezone;

/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastCityModelCopyWith<_ForecastCityModel> get copyWith => __$ForecastCityModelCopyWithImpl<_ForecastCityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastCityModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastCityModel&&(identical(other.name, name) || other.name == name)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,timezone);
}

@override
String toString() {
    return 'ForecastCityModel(name: $name, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$ForecastCityModelCopyWith<$Res> implements $ForecastCityModelCopyWith<$Res> {
  factory _$ForecastCityModelCopyWith(_ForecastCityModel value, $Res Function(_ForecastCityModel) _then) = __$ForecastCityModelCopyWithImpl;
@override @useResult
$Res call({
 String name, int timezone
});




}
/// @nodoc
class __$ForecastCityModelCopyWithImpl<$Res>
    implements _$ForecastCityModelCopyWith<$Res> {
  __$ForecastCityModelCopyWithImpl(this._self, this._then);

  final _ForecastCityModel _self;
  final $Res Function(_ForecastCityModel) _then;

/// Create a copy of ForecastCityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? timezone = null,}) {
  return _then(_ForecastCityModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ForecastItemModel {

 int get dt; WeatherMainModel get main; List<WeatherConditionModel> get weather; double get pop;
/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastItemModelCopyWith<ForecastItemModel> get copyWith => _$ForecastItemModelCopyWithImpl<ForecastItemModel>(this as ForecastItemModel, _$identity);

  /// Serializes this ForecastItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastItemModel&&(identical(other.dt, _this.dt) || other.dt == _this.dt)&&(identical(other.main, _this.main) || other.main == _this.main)&&const DeepCollectionEquality().equals(other.weather, _this.weather)&&(identical(other.pop, _this.pop) || other.pop == _this.pop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastItemModel;
  return Object.hash(runtimeType,_this.dt,_this.main,const DeepCollectionEquality().hash(_this.weather),_this.pop);
}

@override
String toString() {
  final _this = this as ForecastItemModel;
  return 'ForecastItemModel(dt: ${_this.dt}, main: ${_this.main}, weather: ${_this.weather}, pop: ${_this.pop})';
}


}

/// @nodoc
abstract mixin class $ForecastItemModelCopyWith<$Res>  {
  factory $ForecastItemModelCopyWith(ForecastItemModel value, $Res Function(ForecastItemModel) _then) = _$ForecastItemModelCopyWithImpl;
@useResult
$Res call({
 int dt, WeatherMainModel main, List<WeatherConditionModel> weather, double pop
});


$WeatherMainModelCopyWith<$Res> get main;

}
/// @nodoc
class _$ForecastItemModelCopyWithImpl<$Res>
    implements $ForecastItemModelCopyWith<$Res> {
  _$ForecastItemModelCopyWithImpl(this._self, this._then);

  final ForecastItemModel _self;
  final $Res Function(ForecastItemModel) _then;

/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dt = null,Object? main = null,Object? weather = null,Object? pop = null,}) {
  return _then(ForecastItemModel(
dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as WeatherMainModel,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherConditionModel>,pop: null == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherMainModelCopyWith<$Res> get main {
  
  return $WeatherMainModelCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastItemModel].
extension ForecastItemModelPatterns on ForecastItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ForecastItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dt,  WeatherMainModel main,  List<WeatherConditionModel> weather,  double pop)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastItemModel() when $default != null:
return $default(_that.dt,_that.main,_that.weather,_that.pop);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dt,  WeatherMainModel main,  List<WeatherConditionModel> weather,  double pop)  $default,) {final _that = this;
switch (_that) {
case _ForecastItemModel():
return $default(_that.dt,_that.main,_that.weather,_that.pop);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dt,  WeatherMainModel main,  List<WeatherConditionModel> weather,  double pop)?  $default,) {final _that = this;
switch (_that) {
case _ForecastItemModel() when $default != null:
return $default(_that.dt,_that.main,_that.weather,_that.pop);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastItemModel extends ForecastItemModel {
  const _ForecastItemModel({required this.dt, required this.main,  List<WeatherConditionModel> weather = const <WeatherConditionModel>[], this.pop = 0}): _weather = weather,super._();
  factory _ForecastItemModel.fromJson(Map<String, dynamic> json) => _$ForecastItemModelFromJson(json);

@override final  int dt;
@override final  WeatherMainModel main;
 final  List<WeatherConditionModel> _weather;
@override@JsonKey() List<WeatherConditionModel> get weather {
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weather);
}

@override@JsonKey() final  double pop;

/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastItemModelCopyWith<_ForecastItemModel> get copyWith => __$ForecastItemModelCopyWithImpl<_ForecastItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastItemModel&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other.weather, _weather)&&(identical(other.pop, pop) || other.pop == pop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,dt,main,const DeepCollectionEquality().hash(_weather),pop);
}

@override
String toString() {
    return 'ForecastItemModel(dt: $dt, main: $main, weather: $weather, pop: $pop)';
}


}

/// @nodoc
abstract mixin class _$ForecastItemModelCopyWith<$Res> implements $ForecastItemModelCopyWith<$Res> {
  factory _$ForecastItemModelCopyWith(_ForecastItemModel value, $Res Function(_ForecastItemModel) _then) = __$ForecastItemModelCopyWithImpl;
@override @useResult
$Res call({
 int dt, WeatherMainModel main, List<WeatherConditionModel> weather, double pop
});


@override $WeatherMainModelCopyWith<$Res> get main;

}
/// @nodoc
class __$ForecastItemModelCopyWithImpl<$Res>
    implements _$ForecastItemModelCopyWith<$Res> {
  __$ForecastItemModelCopyWithImpl(this._self, this._then);

  final _ForecastItemModel _self;
  final $Res Function(_ForecastItemModel) _then;

/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dt = null,Object? main = null,Object? weather = null,Object? pop = null,}) {
  return _then(_ForecastItemModel(
dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as WeatherMainModel,weather: null == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherConditionModel>,pop: null == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of ForecastItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherMainModelCopyWith<$Res> get main {
  
  return $WeatherMainModelCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}
}

// dart format on
