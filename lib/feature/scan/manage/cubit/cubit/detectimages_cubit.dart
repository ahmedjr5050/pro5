// detectimages_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pro5/feature/scan/manage/model/models.dart';
import 'package:pro5/feature/scan/manage/web/web_services.dart';

part 'detectimages_state.dart';

class DetectimagesCubit extends Cubit<DetectimagesState> {
  DetectimagesCubit() : super(DetectimagesInitial());

  void getimagesai(String images) async {
    emit(DetectimagesLoading());
    try {
      final response = await DetectRepo().getaiData(images);
      final data = AiModels.fromJson(response);
      emit(DetectimagesLoaded(aiModels: data));
    } catch (e) {
      emit(DetectimagesError(error: e.toString()));
    }
  }
}
