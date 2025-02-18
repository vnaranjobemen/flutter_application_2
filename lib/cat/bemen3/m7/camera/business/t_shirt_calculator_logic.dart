class TShirtCalculatorLogic {
  static const Map<String, double> prices = {
    'small': 7.9,
    'medium': 8.3,
    'large': 12.7,
  };

  static double calculatePrice(String size, int quantity) {
    final pricePerUnit = prices[size] ?? 0.0;
    final totalPrice = pricePerUnit * quantity;
    return double.parse(totalPrice.toStringAsFixed(2));
  }

  static double calculatePriceWithDiscount(
      String size, int quantity, String discount) {
    final totalPrice = calculatePrice(size, quantity);
    double discountedPrice;
    if (discount == '10%') {
      discountedPrice = totalPrice * 0.9;
    } else if (discount == '20€' && totalPrice > 100) {
      discountedPrice = totalPrice - 20;
    } else {
      discountedPrice = totalPrice;
    }
    return double.parse(discountedPrice.toStringAsFixed(2));
  }
}
