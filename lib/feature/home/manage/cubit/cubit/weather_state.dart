part of 'weather_cubit.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModels weatherModels;
  WeatherLoaded(this.weatherModels);
}

class WeatherError extends WeatherState {
  final String error;
  WeatherError(this.error);
}
