import 'package:chatgpt_clone/controller/helpers/dio_helper.dart';
import 'package:chatgpt_clone/core/constants/constants.dart';
import 'package:chatgpt_clone/model/chatModel.dart';

class ApiServices{
  Future<ChatModel> getChat(String message)async{
    var data={
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": message
        }
      ]
    };
    return await DioHelper.postDataAPI(url: '',data: data,token: apiKey,).then((value) async {
      final response = ChatModel.fromJson(value.data['choices'][0]);
      return response;
    }).catchError((error) {
      throw error.response.data['error']['message'];
    });
  }
}