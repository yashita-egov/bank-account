import 'package:json_annotation/json_annotation.dart';
import 'BankAccountDetails.dart';

part 'BankAccount.g.dart';

@JsonSerializable()
class BankAccount{
  @JsonKey(name: 'tenantId')
  final String tenantId;
  @JsonKey(name: 'serviceCode')
  final String serviceCode;
  @JsonKey(name: 'referenceId')
  final String referenceId;
  @JsonKey(name: 'bankAccountDetails')
  List<BankAccountDetails> bankAccountDetail=[];
  // @JsonKey(name: 'additionalFields')
  // final additionalFields;


  BankAccount({
    required this.tenantId, 
    required this.serviceCode,
    required this.referenceId,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) => _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);

  void addBankAccountDetails(BankAccountDetails bankAccountDetail){
    this.bankAccountDetail.add(bankAccountDetail);
  }
}