
import '../service/bankService.dart';

void main() {
  // 1- Create the service
  BankService service = BankService();
  service.createAccount(123);


  print(service.account.length);  // should be 1
}
