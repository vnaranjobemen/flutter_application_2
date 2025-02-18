class TShirtCalculatorLogic {
  static const Map<String, double> prices = {
    'small': 7.9,
    'medium': 8.3,
    'large': 12.7,
  };

  static double calculatePrice(String size, int quantity) {
    final pricePerUnit = prices[size] ?? 0.0;
    return pricePerUnit * quantity;
  }

  static double calculatePriceWithDiscount(
      String size, int quantity, String discount) {
    final totalPrice = calculatePrice(size, quantity);
    if (discount == '10%') {
      return totalPrice * 0.9;
    } else if (discount == '20€' && totalPrice > 100) {
      return totalPrice - 20;
    }
    return totalPrice;
  }
}
