// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankBranchIdentifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankBranchIdentifier _$BankBranchIdentifierFromJson(
        Map<String, dynamic> json) =>
    BankBranchIdentifier(
      type: json['type'] as String,
      code: json['code'] as String,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$BankBranchIdentifierToJson(
        BankBranchIdentifier instance) =>
    <String, dynamic>{
      'type': instance.type,
      'code': instance.code,
      'isActive': instance.isActive,
    };
