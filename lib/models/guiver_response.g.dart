// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guiver_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuiverResponse _$GuiverResponseFromJson(Map<String, dynamic> json)
{
    var ret = GuiverResponse(
      json['type'] as String,
      json['command'] as String,
      json['payload'] as Map<String, dynamic>
    );
    return ret;
}

Map<String, dynamic> _$GuiverResponseToJson(GuiverResponse instance) 
{
    var ret = <String, dynamic>{
      'type': instance.type,
      'command': instance.command,
      'payload': instance.payload
    };
    return ret;
}
