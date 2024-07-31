// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankAccount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) => BankAccount(
      tenantId: json['tenantId'] as String,
      serviceCode: json['serviceCode'] as String,
      referenceId: json['referenceId'] as String,
    )..bankAccountDetail = (json['bankAccountDetails'] as List<dynamic>)
        .map((e) => BankAccountDetails.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'serviceCode': instance.serviceCode,
      'referenceId': instance.referenceId,
      'bankAccountDetails': instance.bankAccountDetail,
    };
