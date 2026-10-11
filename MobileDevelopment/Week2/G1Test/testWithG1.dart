
// your function
double calculateBonus({
  required int salary,
  required int sales,
  int bonusRate = 5,
}) {
  if (sales >= 5000) {
    return salary * bonusRate / 100;
  } else {
    return 0;
  }
}

void main() {
  List<int> salaries = [1000, 1500, 1200, 2000];
  List<int> sales = [6000, 3000, 7000, 4500];

  int bonusRate = 10;

  for (int i = 0; i < salaries.length; i++) {
    double bonus = calculateBonus(
      salary: salaries[i],
      sales: sales[i],
      bonusRate: bonusRate,
    );
  // For each employee, calculate the bonus and print it.
    print('Employee ${i + 1}: ${bonus.toInt()}');
  }
}
