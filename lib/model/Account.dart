enum ACCOUNT_TYPES {
  DEBIT,
  CREDIT,
  CREDIT_CARD,
  CHEQUE,
  OTHER
}

const EXTERNAL_ACCOUNT = Account.external();

/// Account class defining a bank account
class Account {

  final bool external;
  final String _alias;
  final String number;
  final ACCOUNT_TYPES type;
  final String owner;

  Account(this._alias, {
    this.number = "0",
    this.type = ACCOUNT_TYPES.OTHER,
    this.owner = "Unknown",
    this.external = false
  });

  const Account.external() : this._alias = "EXTERNAL", this.number = '0',
      this.type = ACCOUNT_TYPES.OTHER, this.owner = "Unknown", this.external = true;

  String get alias => _alias;

  bool _isSame(Account other) => this.alias == other.alias;

  bool operator ==(other) => _isSame(other);

  @override
  int get hashCode => 37 * 17 * this.alias.hashCode;
}
