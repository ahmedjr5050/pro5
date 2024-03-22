import 'package:bloc/bloc.dart';
import 'package:pro5/feature/home/manage/models/modelweather.dart';
import 'package:pro5/feature/home/manage/repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
 void getWeather() async {
    emit(WeatherLoading());
    try {
      final response = await HomeRepo().getHomeData(
      );
      final data = WeatherModels.fromJson(response);
      emit(WeatherLoaded(data));
    } catch (e) {
      emit(WeatherError(e.toString())); 
    }
  }
}
