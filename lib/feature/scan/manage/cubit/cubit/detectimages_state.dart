// detectimages_state.dart
part of 'detectimages_cubit.dart';

abstract class DetectimagesState extends Equatable {
  const DetectimagesState();

  @override
  List<Object> get props => [];
}

class DetectimagesInitial extends DetectimagesState {}

class DetectimagesLoading extends DetectimagesState {}

class DetectimagesLoaded extends DetectimagesState {
  final AiModels aiModels;
  const DetectimagesLoaded({required this.aiModels});

  @override
  List<Object> get props => [aiModels];
}

class DetectimagesError extends DetectimagesState {
  final String error;
  const DetectimagesError({required this.error});

  @override
  List<Object> get props => [error];
}
