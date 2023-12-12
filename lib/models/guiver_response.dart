import 'package:json_annotation/json_annotation.dart';

part 'guiver_response.g.dart';

@JsonSerializable()
class GuiverResponse {
  @JsonKey(name: 'guiver_id')
  final String type;
  final String command;
  final Map<String, dynamic> payload;

  GuiverResponse(this.type, this.command, this.payload);

  factory GuiverResponse.fromJson(Map<String, dynamic> json){
      return _$GuiverResponseFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$GuiverResponseToJson(this);
  } 
    
}
