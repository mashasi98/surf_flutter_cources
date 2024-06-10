import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/category_entity.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/sorting_type.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/presentation/empty_screen.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/theme/custom_theme.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/utils/extension/category_list_x.dart';
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
    CustomAppTheme.customTextTheme(Theme.of(context).textTheme);
    return FutureBuilder<ChequeEntity>(
      future: _data,
      builder: (_, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }else if  (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const _ErrorWidget();
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            return data != null
                ? _ContentWidget(chequeData: data)
                : const EmptyScreen();
          }
        }
        return const _LoadWidget();
      },
    );
  }
}

class _ContentWidget extends StatefulWidget {
  final ChequeEntity chequeData;

  const _ContentWidget({required this.chequeData});

  @override
  State<StatefulWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<_ContentWidget> {
  SortingType _currentFilter = SortingType.none;
  bool _isCategorySelected = false;

  @override
  Widget build(BuildContext context) {
    var theme = CustomAppTheme.customTextTheme(Theme.of(context).textTheme);
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
          title: _ChequeAppBarWidget(
            chequeData: widget.chequeData,
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
                      style: theme.displayLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _onPressedFilter();
                    },
                    icon: _isCategorySelected
                        ? SvgPicture.asset(
                            'assets/images/shopping_list/sort_selected.svg',
                          )
                        : SvgPicture.asset(
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
        child: _ProductsViewWidget(
          currentFilter: _currentFilter,
          chequeData: widget.chequeData,
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
          _isCategorySelected = !_isCategorySelected;
        },
      );
    }
  }
}

class _ChequeAppBarWidget extends StatelessWidget {
  final ChequeEntity chequeData;

  const _ChequeAppBarWidget({
    required this.chequeData,
  });

  @override
  Widget build(BuildContext context) {
    var theme = CustomAppTheme.customTextTheme(Theme.of(context).textTheme);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Чек № ${chequeData.id}",
          style: theme.displayLarge,
        ),
        Text(
          chequeData.date.toStringDateAndTime(),
          style: theme.labelSmall,
        )
      ],
    );
  }
}

class _ProductsViewWidget extends StatelessWidget {
  final SortingType currentFilter;
  final ChequeEntity chequeData;

  const _ProductsViewWidget({
    required this.currentFilter,
    required this.chequeData,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (chequeData.products.isNotEmpty) {
      final bool isSortByCategory = currentFilter == SortingType.typeFromZ ||
          currentFilter == SortingType.typeFromA;
      final List<dynamic> sortedList = _getSortedList(isSortByCategory);
      final sortedLength = sortedList.length;
      return SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                itemCount: sortedLength,
                itemBuilder: (_, i) {
                  final bool isLastCategory = i == sortedLength - 1;
                  final categoryProducts = chequeData.products
                      .where((product) => sortedList[i] == product.category)
                      .toList();
                  if (sortedList.isEmpty) return const SizedBox();
                  if (isSortByCategory) {
                    if (categoryProducts.isEmpty) return const SizedBox();
                    final category = sortedList[i];
                    return _CategoryWidget(
                      category: category.name,
                      productsOfCategory: categoryProducts,
                      filter: currentFilter,
                      products: chequeData.products,
                      isLastElement: isLastCategory,
                    );
                  } else {
                    final product = sortedList[i];
                    return _ProductWidget(
                      product: product,
                      isLastElement: isLastCategory,
                      products: sortedList as List<ProductEntity>,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  List<dynamic> _getSortedList(bool isSortByCategory) {
    return isSortByCategory
        ? Category.values.sortByCategory(currentFilter)
        : chequeData.products.sortByFilter(currentFilter);
  }
}

class _ProductWidget extends StatelessWidget {
  final ProductEntity product;
  final bool isLastElement;
  final List<ProductEntity> products;

  const _ProductWidget({
    required this.product,
    required this.isLastElement,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _ItemInfoWidget(
            item: product,
            isLastItem: isLastElement,
            products: products,
          ),
          if (isLastElement) _FinanceWidget(products: products),
        ],
      ),
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  final String category;
  final List<ProductEntity> productsOfCategory;
  final List<ProductEntity> products;
  final SortingType filter;
  final bool isLastElement;

  const _CategoryWidget(
      {required this.category,
    required this.productsOfCategory,
    required this.filter,
    required this.products,
    required this.isLastElement,
  });

  @override
  Widget build(BuildContext context) {
    var theme = CustomAppTheme.customTextTheme(Theme.of(context).textTheme);
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: theme.bodyLarge),
          const SizedBox(
            height: 15,
          ),
          if (productsOfCategory.isNotEmpty)
          ...productsOfCategory.map(
            (productOfCategory) => _ItemInfoWidget(
              item: productOfCategory,
              isLastItem: productOfCategory == productsOfCategory.last,
              products: products,
            ),
          ),
          if (isLastElement) _FinanceWidget(products: products),
        ],
      ),
    );
  }
}

class _ItemInfoWidget extends StatelessWidget {
  final ProductEntity item;
  final bool isLastItem;
  final List<ProductEntity> products;

  const _ItemInfoWidget({
    required this.item,
    required this.isLastItem,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    var theme = CustomAppTheme.customTextTheme(Theme.of(context).textTheme);

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth,
        margin: const EdgeInsets.only(bottom: 20, right: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.network(
                      item.imageUrl,
                      height: 68,
                      width: 68,
                      fit: BoxFit.fill,
                      errorBuilder: (context, object, stackTrace) {
                        return SvgPicture.asset(
                            'assets/images/shopping_list/placeholder.svg');
                      },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Image.asset(
                            'assets/images/shopping_list/loader.gif',
                            height: 68,
                            width: 68,
                            fit: BoxFit.fill,
                          );
                        }
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 68,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(item.title, style: theme.bodyMedium),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    item.amount.showAmount(),
                                    style: theme.bodyMedium,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      if (item.sale > 0)
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            item.decimalPrice.toFormattedCurrency(),
                                            style: theme.bodyMedium?.copyWith(
                                              color: const Color(0xFFB5B5B5),
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  const Color(0xFFB5B5B5),
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          DecimalX.calculateDiscountForProduct(
                                            item.decimalPrice,
                                            item.sale.toString(),
                                          ).toFormattedCurrency(),
                                          style: item.sale > 0
                                              ? theme.bodyMedium?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xFFFF0000),
                                                )
                                              : theme.bodyMedium?.copyWith(
                                                  fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (isLastItem)
              const Padding(
                padding: EdgeInsets.only(top: 10 ),
                child: Divider(thickness: 0.5, height: 0.5),
              ),
          ],
        ),
      );
    });
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
    final discount = _getDiscount(widget.products);
    final total = fullTotal - discount;
    final theme = CustomAppTheme.customTextTheme(Theme.of(context).textTheme);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('В вашей покупке', style: theme.bodyLarge),
        const SizedBox(height: 10),
        _SumInfoWidget(
          description: _plural(widget.products.length),
          value: fullTotal.toFormattedCurrency(),
        ),
        const SizedBox(height: 10),
        _SumInfoWidget(
            description: 'Скидка', value: discount.toFormattedCurrency()),
        const SizedBox(height: 10),
        _SumInfoWidget(
            description: 'Итого',
            value: total.toFormattedCurrency(),
            isBoldTheme: true)
      ],
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

  Decimal _getDiscount(List<ProductEntity> products) {
    final discountedProducts =
        products.where((element) => element.sale > 0).toList();
    return discountedProducts.isEmpty
        ? Decimal.zero
        : discountedProducts.fold<Decimal>(
            Decimal.zero,
            (previousValue, element) =>
                previousValue +
                DecimalX.calculateDiscountForProduct(
                  element.decimalPrice,
                  element.sale.toString(),
                ),
          );
  }

}

class _SumInfoWidget extends StatelessWidget {
  final String description;
  final String value;
  final bool isBoldTheme;

  const _SumInfoWidget({
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
            style: (isBoldTheme) ? textTheme.labelLarge : textTheme.labelMedium,
          ),
        ),
        Text(value,
            style: (isBoldTheme)
                ? textTheme.bodyLarge
                : textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
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
