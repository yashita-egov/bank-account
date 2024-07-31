import 'package:bank_accounts/models/BankBranchIdentifier.dart';
import 'package:json_annotation/json_annotation.dart';
import 'Document.dart';

part 'BankAccountDetails.g.dart';

@JsonSerializable()
class BankAccountDetails{
  @JsonKey(name: 'tenantId')
  final String tenantId;

  @JsonKey(name: 'accountHolderName')
  final String accountHolderName;

  @JsonKey(name: 'accountNumber')
  final String accountNumber;

  @JsonKey(name: 'accountType')
  final String accountType;

  @JsonKey(name: 'isPrimary')
  final bool isPrimary;

  @JsonKey(name: 'bankBranchIdentifier')
  final BankBranchIdentifier bankBranchIdentifier;

  @JsonKey(name: 'isActive')
  final bool isActive;

  @JsonKey(name: 'documents')
  List<Document>? documents;

  BankAccountDetails({
    required this.tenantId,
    required this.accountHolderName,
    required this.accountNumber,
    required this.accountType,
    required this.isActive,
    required this.isPrimary,
    required this.bankBranchIdentifier,
    this.documents
  });

  factory BankAccountDetails.fromJson(Map<String, dynamic> json) => _$BankAccountDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountDetailsToJson(this);
}