// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contract _$ContractFromJson(Map<String, dynamic> json) {
  return Contract(
    interest: (json['interest'] as num)?.toDouble(),
    amount: (json['amount'] as num)?.toDouble(),
    waitingTurns: json['waitingTurns'] as int,
    id: json['id'] as String,
    fee: (json['fee'] as num)?.toDouble(),
    countToCap: json['countToCap'] as bool,
  );
}

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'interest': instance.interest,
      'amount': instance.amount,
      'waitingTurns': instance.waitingTurns,
      'countToCap': instance.countToCap,
      'fee': instance.fee,
      'id': instance.id,
    };
