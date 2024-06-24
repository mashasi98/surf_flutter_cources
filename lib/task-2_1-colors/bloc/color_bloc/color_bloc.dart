import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_cources/task-2_1-colors/constant/app_string.dart';
import 'package:surf_flutter_cources/task-2_1-colors/domain/entity/color_entity.dart';

import '../../assets/data/repository/color_repository.dart';

part 'color_event.dart';

part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  final ColorRepository repository;

  ColorBloc({required this.repository}) : super(ColorInitialState()) {
    on<LoadColorEvent>(
      (event, emit) async {
        await _onLoad(emit);
      },
    );

    on<ColorCopyEvent>(
      (event, emit) {
        _onCopy(event, emit);
      },
    );
  }

  void _onCopy(ColorCopyEvent event, Emitter<ColorState> emit) {
    final currentState = state;
    if (currentState is ColorLoadedState || currentState is ColorCopiedState) {
      final colors = (currentState is ColorLoadedState)
          ? currentState.colors
          : (currentState as ColorCopiedState).colors;

      emit(
          ColorCopiedState(colors: colors, copiedColorValue: event.colorValue));
    }
  }

  Future<void> _onLoad(Emitter<ColorState> emit) async {
    emit(ColorLoadingState());
    try {
      final colors = await repository.getColors();
      colors.isNotEmpty ? _onColorLoaded(emit, colors) : _onColorEmpty(emit);
    } catch (e) {
      emit(const ColorErrorState(message: AppString.errorStateColorsScreen));
    }
  }

  void _onColorEmpty(Emitter<ColorState> emit) {
    emit(ColorEmptyState());
  }

  void _onColorLoaded(Emitter<ColorState> emit, List<ColorEntity> colors) {
    emit(ColorLoadedState(colors: colors));
  }
}
