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
import 'filter_screen.dart';

class ChequeScreen extends StatefulWidget {
  final int id;

  const ChequeScreen({super.key, required this.id});

  @override
  // ignore: library_private_types_in_public_api
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
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/shopping_list/arrow_back.svg',
          ),
          onPressed: () {
            debugPrint('tap');
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Чек № ${widget.data.id}"),
                Text(
                  widget.data.date.toStringDateAndTime(),
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ],
        ),
        // ],
        // ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Список покупок',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _onPressedFilter();
                  },
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
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
                  filter: _currentFilter,
                )
              : const SizedBox();
        },
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
  final SortingType filter;

  const _CategoryWidget(
      {required this.category,
      required this.productOfCategory,
      required this.products,
      required this.isLastCategory,
      required this.filter});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(category),
        ...productOfCategory.sortByFilter(filter).map(
              (e) => ListTile(
                  leading: Image.network(
                    e.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Image.asset(
                          'assets/images/shopping_list/loader.gif',
                          width: 100,
                          height: 100,
                        );
                      }
                    },
                  ),
                  title: Text(e.title),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.amount.value.toString()),
                      Text(e.decimalPrice.toFormattedCurrency()),
                    ],
                  )),
            ),
        const Divider(),
        if (isLastCategory) _FinanceWidget(products: products),
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

    return Column(children: [
      const Text('В вашей покупке'),
      _RowWidget(
          description: _plural(widget.products.length),
          value: fullTotal.toFormattedCurrency()),
      _RowWidget(description: 'Скидка', value: discount.toFormattedCurrency()),
      _RowWidget(description: 'Итого', value: total.toFormattedCurrency())
    ]);
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

  const _RowWidget({required this.description, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(description, style: textTheme.bodyMedium),
        ),
        Text(value, style: textTheme.headlineSmall),
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
