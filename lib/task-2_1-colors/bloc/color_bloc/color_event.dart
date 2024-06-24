part of 'color_bloc.dart';

sealed class ColorEvent extends Equatable {
  const ColorEvent();

  @override
  List<Object?> get props => [];
}

class LoadColorEvent extends ColorEvent {}

class ColorCopyEvent extends ColorEvent {
  final String colorValue;

  const ColorCopyEvent(this.colorValue);

  @override
  List<Object> get props => [colorValue];
}
