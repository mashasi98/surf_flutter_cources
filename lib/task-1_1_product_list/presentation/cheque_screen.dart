import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/category_entity.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/sorting_type.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/presentation/empty_screen.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/utils/extension/date_time_x.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/utils/extension/decimal_x.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/utils/extension/product_list_x.dart';

import '../domain/entity/cheque_entity.dart';
import '../domain/entity/product_entity.dart';
import '../main.dart';
import '../theme/finance_widget_theme.dart';
import 'filter_screen.dart';

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
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return data != null
                ? _ContentWidget(data: data)
                : const EmptyScreen();
          }
        }
        return const _LoadWidget();
      },
    );
  }
}

class _ContentWidget extends StatefulWidget {
  final ChequeEntity data;

  const _ContentWidget({required this.data});

  @override
  State<StatefulWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<_ContentWidget> {
  SortingType _currentFilter = SortingType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          toolbarOpacity: 1.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon:
                SvgPicture.asset('assets/images/shopping_list/arrow_back.svg'),
            onPressed: () {},
            iconSize: 24,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Чек № ${widget.data.id}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                widget.data.date.toStringDateAndTime(),
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Список покупок',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _onPressedFilter();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/shopping_list/sort.svg',
                    ),
                    iconSize: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemCount: Category.values.length,
          itemBuilder: (_, i) {
            final category = Category.values[i];
            final categoryProducts = widget.data.products
                .where((product) => product.category == category)
                .toList();
            final isLastCategory = i == Category.values.length - 1;

            return categoryProducts.isNotEmpty
                ? _CategoryWidget(
                    category: category.name,
                    productOfCategory: categoryProducts,
                    products: widget.data.products,
                    isLastCategory: isLastCategory,
                    sortingTypeFilter: _currentFilter,
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }

  Future<void> _onPressedFilter() async {
    final SortingType? filter = await showFlexibleBottomSheet(
      initHeight: 0.8,
      bottomSheetColor: Colors.transparent,
      context: context,
      builder: (_, __, ___) => FilterScreen(filter: _currentFilter),
      isExpand: true,
    );
    if (filter == null) return;
    if (filter != _currentFilter) {
      setState(
        () {
          _currentFilter = filter;
        },
      );
    }
  }
}

class _CategoryWidget extends StatelessWidget {
  final String category;
  final List<ProductEntity> productOfCategory;
  final List<ProductEntity> products;
  final bool isLastCategory;
  final SortingType sortingTypeFilter;

  const _CategoryWidget(
      {required this.category,
      required this.productOfCategory,
      required this.products,
      required this.isLastCategory,
      required this.sortingTypeFilter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (SortingType.typeFromZ.type == sortingTypeFilter.type ||
            SortingType.typeFromA.type == sortingTypeFilter.type)
          Text(category),
        ...productOfCategory.sortByFilter(sortingTypeFilter).map(
              (e) => ListTile(
                leading: SizedBox(
                  height: 68,
                  width: 68,
                  child: Image.network(
                    e.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Image.asset(
                          'assets/images/shopping_list/loader.gif',
                          fit: BoxFit.contain,
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SvgPicture.asset(
                        height: 68,
                        width: 68,
                        'assets/images/shopping_list/placeholder.svg',
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.amount.showAmount()),
                        Text(e.decimalPrice.toFormattedCurrency()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        const Divider(),
        if (isLastCategory)
          SizedBox(
            height: 118,
            child: _FinanceWidget(products: products),
          ),
      ],
    );
  }
}

class _FinanceWidget extends StatefulWidget {
  final List<ProductEntity> products;

  const _FinanceWidget({required this.products});

  @override
  State<_FinanceWidget> createState() => _FinanceWidgetState();
}

class _FinanceWidgetState extends State<_FinanceWidget> {
  @override
  Widget build(BuildContext context) {
    final fullTotal = _getFullTotal(widget.products);
    final discount = _getDisscount(widget.products);
    final total = fullTotal - discount;

    return Theme(
      data: FinanceWidgetTheme.themeData(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('В вашей покупке',
              style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 10),
          _RowWidget(
            description: _plural(widget.products.length),
            value: fullTotal.toFormattedCurrency(),
          ),
          const SizedBox(height: 10),
          _RowWidget(
              description: 'Скидка', value: discount.toFormattedCurrency()),
          const SizedBox(height: 10),
          _RowWidget(
              description: 'Итого',
              value: total.toFormattedCurrency(),
              isBoldTheme: true)
        ],
      ),
    );
  }

  String _plural(int count) {
    return Intl.plural(
      count,
      zero: 'нет товаров ',
      one: '$count товар',
      few: '$count товара',
      many: '$count товаров',
      other: '$count товаров',
      locale: 'ru',
    );
  }

  Decimal _getFullTotal(List<ProductEntity> products) {
    return products.fold<Decimal>(Decimal.zero,
        (previousValue, element) => previousValue + element.decimalPrice);
  }

  Decimal _getDisscount(List<ProductEntity> products) {
    final discount = products.where((element) => element.sale > 0).toList();
    return discount.isNotEmpty
        ? Decimal.zero
        : discount.fold<Decimal>(
            Decimal.zero,
            (previousValue, element) =>
                previousValue +
                _calculateDiscountForProduct(
                    element.decimalPrice, element.sale.toString()),
          );
  }

  Decimal _calculateDiscountForProduct(Decimal price, String discountPercent) {
    final discountAmount =
        (price * Decimal.parse(discountPercent) / Decimal.fromInt(100))
            .toDecimal();
    return price - discountAmount;
  }
}

class _RowWidget extends StatelessWidget {
  final String description;
  final String value;
  final bool isBoldTheme;

  const _RowWidget({
    required this.description,
    required this.value,
    this.isBoldTheme = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(description,
              style:
                  (isBoldTheme) ? textTheme.labelLarge : textTheme.labelMedium),
        ),
        Text('$value руб',
            style: (isBoldTheme) ? textTheme.bodyLarge : textTheme.bodyMedium),
      ],
    );
  }
}

class _LoadWidget extends StatelessWidget {
  const _LoadWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Произошла  ошибкка"),
    );
  }
}
