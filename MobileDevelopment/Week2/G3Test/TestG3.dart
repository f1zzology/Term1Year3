int caculateFinalPrize({required int price, int fee = 5}) {
  int finalPrice;
  finalPrice = price + fee;
  return finalPrice;
}

void main() {
  List<int> prices = [20, 35, 50, 80];
  List<int?> fees = [5, null, 10, null];

  for (int i = 0; i < prices.length; i++) {
    int price = caculateFinalPrize(price: prices[i], fee: fees[i] ?? 5);
    print(price);
  }

  // For each order, compute the final price with your function and print it
}
