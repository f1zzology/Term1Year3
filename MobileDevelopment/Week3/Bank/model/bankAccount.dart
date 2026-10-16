class BankAccount {
  final int accountId;
  final double balance;

  BankAccount({required this.accountId,  this.balance=0});




  BankAccount withBalance(double newBalance) {
    return BankAccount(accountId: accountId, balance: newBalance);
  }
}
