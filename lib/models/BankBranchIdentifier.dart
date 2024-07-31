import 'package:json_annotation/json_annotation.dart';

part 'BankBranchIdentifier.g.dart';

@JsonSerializable()
class BankBranchIdentifier{
  final String type;
  final String code;
  final bool? isActive;

  BankBranchIdentifier({
    required this.type,
    required this.code,
    this.isActive
  });

  factory BankBranchIdentifier.fromJson(Map<String, dynamic> json) => _$BankBranchIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$BankBranchIdentifierToJson(this);
}