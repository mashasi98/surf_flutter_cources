import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/sorting_type.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/presentation/empty_screen.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/utils/extension/DateTimeX.dart';

import '../domain/entity/cheque_entity.dart';
import '../main.dart';

class ChequeScreen extends StatefulWidget {
  final int id;

  const ChequeScreen({super.key, required this.id});

  @override
  _ChequeScreenState createState() => _ChequeScreenState();
}

class _ChequeScreenState extends State<ChequeScreen> {
  Future<ChequeEntity>? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _data = shoppingListRepository.getCheque(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChequeEntity>(
      future: _data,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const _ErrorWidget();
          }else if(snapshot.hasData){
            final data = snapshot.data;
            return data != null ? _ContentWidget(data: data) : const EmptyScreen();
          }
        }
        return const _LoadWidget();
      },
    );
  }
}

class _ContentWidget extends StatefulWidget {
  final ChequeEntity data;

  const _ContentWidget({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<_ContentWidget> {
  // SortingType _currentString = SortingType.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text("Чек № ${widget.data.id}"),
            Text(
              widget.data.date.toStringDateAndTime(),
              style: Theme
                  .of(context)
                  .textTheme
                  .labelSmall,
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Список покупок',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineMedium,
                  ),
                ),
                FilledButton.icon(
                  onPressed: () {
                    _onPressedFilter();
                  },
                  icon: const Icon(Icons.sort),
                  label: const Text("sort"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <void> _onPressedFilter() async {
    final SortingType? filter = await showFlexibleBottomSheet(
        initHeight: 0.8,
        bottomSheetColor: Colors.transparent,
        context: context,
        builder: (_, __, ___,) => FilterScreen(filter: _currentFilter),
        isExpand: true,
    );
    if(filter == null)return;
    if(filter!=  _currentFilter){
      setState(() {
        _currentFilter = filter;
      },
      );
    }
  }
}

class _LoadWidget extends StatelessWidget {
  const _LoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Произошла  ошибкка"),
    );
  }
}
