int calculateDelivery({
  required int orderPrice,
  int? deliveryFee,
  required int freeDeliveryLimit,
}) {
  if (orderPrice >= freeDeliveryLimit) {
    return 0;
  }
  if (deliveryFee != null) {
    return deliveryFee;
  }
  return 0;
}

void main() {
  Map<String, int> orders = {
    "OR1": 40,
    "OR2": 60,
    "OR3": 25,
    "OR4": 80,
    "OR5": 82,
  };
  int? deliveryFee = 1;
  int freeDeliveryLimit = 50;

  for (var entry in orders.entries) {
    final text = calculateDelivery(
      orderPrice: entry.value,
      freeDeliveryLimit: freeDeliveryLimit,
      deliveryFee: deliveryFee,
    );
    print("${entry.key} = $text");
  }
}
