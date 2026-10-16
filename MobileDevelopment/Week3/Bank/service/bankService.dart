import '../model/bankAccount.dart';

class BankService {
  final List<BankAccount> _account = [];

  List<BankAccount> get account => List.unmodifiable(_account);
  
  BankAccount createAccount(int accountId) {
    // Check that the account does exist
    BankAccount? existingAccount = _findByNumber(accountId);
    if (existingAccount != null) {
      throw Exception("Account with ID $accountId already exists!");
    }

    BankAccount newBankAccount = BankAccount(accountId: accountId);
    _account.add(newBankAccount);

    return newBankAccount;
  }

  BankAccount? _findByNumber(int accountId) {
    return _account.where((a) => a.accountId == accountId).firstOrNull;
  }
}
