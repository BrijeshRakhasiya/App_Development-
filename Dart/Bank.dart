
void main() {
  Bank tran1 = new Bank(1000);
  print(tran1.amount);

  tran1.deposit(2500);
  tran1.getBalance();
  tran1.withdraw(3000);
  tran1.getBalance();
}

class Bank {
  dynamic amount = 0;

  Bank(amount) {
    this.amount = amount;
  }

  deposit(amount) {
    this.amount += amount;
  }

  withdraw(amount) {
    if (amount >= this.amount) {
      print('Not Sufficient Balance');
      print("Minimum 1000 is Required");
    } else
      this.amount -= amount;
  }

  getBalance() {
    print("Current Balance is  ${this.amount}");
  }
}
