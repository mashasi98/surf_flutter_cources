import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/presentation/tabs_screen.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/theme/app_theme.dart';

import 'data/repository/shopping_list_repository.dart';

void main() {
  initializeDateFormatting('ru_RU', null).then((_) => runApp(const MyApp()));
}

final shoppingListRepository = ShoppingListRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список покупок',
      theme:  AppTheme.theme,
      home: const TabsScreen(),
    );
  }
}
