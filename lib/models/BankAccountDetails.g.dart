// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankAccountDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountDetails _$BankAccountDetailsFromJson(Map<String, dynamic> json) =>
    BankAccountDetails(
      tenantId: json['tenantId'] as String,
      accountHolderName: json['accountHolderName'] as String,
      accountNumber: json['accountNumber'] as String,
      accountType: json['accountType'] as String,
      isActive: json['isActive'] as bool,
      isPrimary: json['isPrimary'] as bool,
      bankBranchIdentifier: BankBranchIdentifier.fromJson(
          json['bankBranchIdentifier'] as Map<String, dynamic>),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BankAccountDetailsToJson(BankAccountDetails instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'accountHolderName': instance.accountHolderName,
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'isPrimary': instance.isPrimary,
      'bankBranchIdentifier': instance.bankBranchIdentifier,
      'isActive': instance.isActive,
      'documents': instance.documents,
    };
