part of 'color_bloc.dart';

sealed class ColorState extends Equatable {
  const ColorState();

  @override
  List<Object> get props => [];
}

class ColorInitialState extends ColorState {}

class ColorLoadingState extends ColorState {}

class ColorLoadedState extends ColorState {
  final List<ColorEntity> colors;

  const ColorLoadedState({required this.colors});

  @override
  List<Object> get props => [colors];
}

class ColorErrorState extends ColorState {
  final String message;

  const ColorErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class ColorEmptyState extends ColorState {}

class ColorCopiedState extends ColorState {
  final List<ColorEntity> colors;
  final String copiedColorValue;

  const ColorCopiedState(
      {required this.colors, required this.copiedColorValue});

  @override
  List<Object> get props => [colors, copiedColorValue];
}
