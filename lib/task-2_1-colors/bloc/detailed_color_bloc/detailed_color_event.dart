part of 'detailed_color_bloc.dart';

sealed class DetailedColorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailedColorInitialEvent extends DetailedColorEvent {}

class DetailedColorCopyEvent extends DetailedColorEvent {
  final String colorValue;

  DetailedColorCopyEvent({required this.colorValue});

  @override
  List<Object?> get props => [colorValue];
}
