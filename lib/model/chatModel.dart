class ChatModel{
  bool? isUser;
  String? message;
  ChatModel({this.isUser,this.message});
  ChatModel.fromJson(json){
    isUser=false;
    message=json['message']['content'];
  }
  ChatModel.fromJson2(json){
    isUser=json['isUser'];
    message=json['message'];
  }
  Map<String, dynamic> toJson(ChatModel model) {
    return {
      'isUser': model.isUser,
      'message': model.message,
    };
  }
}