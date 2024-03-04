class PriceFormatterCompare {
  final double amount;
  PriceFormatterCompare({this.amount = 0.0});

  bool isLowerThan(double amount) => this.amount < amount;
  bool isGreaterThan(double amount) => this.amount > amount;
  bool isEqual(double amount) => this.amount == amount;
  bool isEqualOrLowerThan(double amount) => this.amount <= amount;
  bool isEqualOrGreaterThan(double amount) => this.amount >= amount;
}
