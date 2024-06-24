part of 'detailed_color_bloc.dart';

sealed class DetailedColorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailedColorInitialState extends DetailedColorState {}

class DetailedColorCopyState extends DetailedColorState {
  final String colorValue;

  DetailedColorCopyState({required this.colorValue});

  @override
  List<Object?> get props => [colorValue];
}
