import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/theme/custom_filter_screen_theme.dart';

import '../domain/entity/sorting_type.dart';

class FilterScreen extends StatefulWidget {
  final SortingType filter;

  const FilterScreen({super.key, required this.filter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  SortingType _selectedFilter = SortingType.none;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.filter;
  }

  void _onChanged(SortingType? value) {
    final changedFilter = value;
    if (changedFilter == null || (changedFilter == _selectedFilter)) return;

    setState(() {
      _selectedFilter = changedFilter;
    });
  }

  Future<void> _onPressDone() async {
    setState(() {
      _isProcessing = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isProcessing = false;
      });

      Navigator.of(context).pop(_selectedFilter);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = CustomFilterScreenTheme.customFilterScreenTheme(
        Theme.of(context).textTheme);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Сортировка',
                    style: theme.displayLarge,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    itemCount: FilterType.values.length,
                    itemBuilder: (_, i) {
                      final type = FilterType.values[i];
                      final sortingList =
                      SortingType.values.where((e) => e.type == type).toList();
                      final isLastType = i == FilterType.values.length - 1;

                      return sortingList.isNotEmpty
                          ? _FilterTypeWidget(
                        type: type,
                        sortingList: sortingList,
                        selectedFilter: _selectedFilter,
                        isLastType: isLastType,
                        onChanged: _onChanged,
                        onDone: _onPressDone,
                        isProcessing: _isProcessing,
                      )
                          : const SizedBox();
                    },
                  ),
                ),
              ],
            ),
            if (_isProcessing)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}

class _FilterTypeWidget extends StatelessWidget {
  final FilterType type;
  final List<SortingType> sortingList;
  final SortingType selectedFilter;
  final bool isLastType;
  final ValueChanged<SortingType?> onChanged;
  final VoidCallback onDone;
  final bool isProcessing;

  const _FilterTypeWidget({
    required this.type,
    required this.sortingList,
    required this.selectedFilter,
    required this.isLastType,
    required this.onChanged,
    required this.onDone,
    required this.isProcessing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = CustomFilterScreenTheme.customFilterScreenTheme(
        Theme.of(context).textTheme);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (type != FilterType.none)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              type.name,
              style: theme.bodySmall,
            ),
          ),
        ...sortingList.map(
              (e) => RadioListTile<SortingType>(
            activeColor: const Color(0xFF67CD00),
            title: Text(
              e.name,
              style: theme.bodyMedium,
            ),
            value: e,
            groupValue: selectedFilter,
            onChanged: onChanged,
          ),
        ),
        if (!isLastType)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              color: Color(0xFFF1F1F1),
            ),
          ),
        if (isLastType) ...[
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: FilledButton(
              onPressed: onDone,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF67CD00),
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Готово',
                  style: theme.bodyLarge?.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ],
    );
  }
}
