// you function
int calculateticketPrice({
  required int age,
  required int ticketPrice,
  int? snack,
}) {
  int price;
  if (age < 12) {
    price = ticketPrice ~/ 2;
  } else {
    price = ticketPrice;
  }
  if (snack != null) {
    price += snack;
  }
  return price;

}

void main() {
  List<Map<String, dynamic>> tickets = [
    {"age": 10, "ticketPrice": 8, "snack": 3},
    {"age": 18, "ticketPrice": 10, "snack": null},
    {"age": 12, "ticketPrice": 8, "snack": 2},
    {"age": 25, "ticketPrice": 10, "snack": null},
  ];
  for (int i = 0; i < tickets.length; i++) {
    int age = tickets[i]["age"] as int;
    int ticketPrice = tickets[i]["ticketPrice"] as int;
    int? snack = tickets[i]["snack"] as int?;
    int finalPrice = calculateticketPrice(
      age: age,
      ticketPrice: ticketPrice,
      snack: snack,
    );
    print("tickets${i + 1} = $finalPrice");
  }

  // For each ticket, calculate the final price and print it.
}
