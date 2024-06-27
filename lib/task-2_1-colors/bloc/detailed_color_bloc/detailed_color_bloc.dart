import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detailed_color_event.dart';
part 'detailed_color_state.dart';

class DetailedColorBloc extends Bloc<DetailedColorEvent, DetailedColorState> {
  DetailedColorBloc() : super(DetailedColorInitialState()) {
    on<DetailedColorCopyEvent>(
          (event, emit) {
        emit(DetailedColorCopyState(colorValue: event.colorValue));
      },
    );
  }
}
