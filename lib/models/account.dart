class Account {
  int? user_id;
  int? balance;

  Account(account) {
    user_id = account['user_id'];
    balance = account['balance'];
  }
}
