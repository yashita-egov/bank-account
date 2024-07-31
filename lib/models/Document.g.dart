// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document()
  ..id = json['id'] as String?
  ..documentType = json['documentType'] as String?
  ..fileStore = json['fileStore'] as String?
  ..documentUid = json['documentUid'] as String?;

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'documentType': instance.documentType,
      'fileStore': instance.fileStore,
      'documentUid': instance.documentUid,
    };
