import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_cources/task-2_1-colors/api/service/color_api_assets.dart';
import 'package:surf_flutter_cources/task-2_1-colors/bloc/detailed_color_bloc/detailed_color_bloc.dart';
import 'package:surf_flutter_cources/task-2_1-colors/presentation/colors_screen.dart';

import 'assets/data/mapper/color_mapper.dart';
import 'assets/data/repository/color_repository.dart';
import 'assets/theme/custom_app_theme.dart';
import 'bloc/color_bloc/color_bloc.dart';


void main() {
  runApp(const MyApp());
}

final colorRepository = ColorRepository(
  colorApi: ColorApiAssets(),
  colorMapper: ColorMapper(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ColorBloc(repository: colorRepository)
            ..add(LoadColorEvent()),
        ),
        BlocProvider(
          create: (context) => DetailedColorBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        home: const ColorsScreen(),
      ),
    );
  }
}
