part 'loan.g.dart';

class Contract {
  double interest = 0.05;

  double amount = 0;

  int waitingTurns;

  bool countToCap;

  double fee;

  String id = "";

  String get fullId => id + ":$waitingTurns:$amount";

  Contract(
      {this.interest,
      this.amount,
      this.waitingTurns,
      this.id,
      this.fee: 0,
      this.countToCap: true});
  @override
  bool operator ==(o) => o is Contract && o.fullId == fullId;

  Contract.copy(Contract contract) {
    interest = contract.interest;
    amount = contract.amount;
    waitingTurns = contract.waitingTurns;
    id = contract.id;
    fee = contract.fee ?? 0;
    countToCap = contract.countToCap ?? true;
  }

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);
  Map<String, dynamic> toJson() => _$ContractToJson(this);
}
