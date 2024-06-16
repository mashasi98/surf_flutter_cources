sealed class Amount {
  int get value;

  String showAmount() {
    return '0';
  }
}

class Grams implements Amount {
  @override
  final int value;

  Grams(this.value);

  @override
  String showAmount() {
    var reducedValue = value / 1000;
    return reducedValue < 1 ? '$reducedValue г' : '$reducedValue кг';
  }
}

class Quantity implements Amount {
  @override
  final int value;

  Quantity(this.value);

  @override
  String showAmount() {
    return '$value шт';
  }
}
