import 'package:chatgpt_clone/controller/helpers/cache_helper.dart';
import 'package:chatgpt_clone/model/chatModel.dart';
import 'package:chatgpt_clone/services/apiServices.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  List<ChatModel> chatList = [];
  List<ChatModel> lastChatList = [];
  List<List<ChatModel>> allChatHistory = [];

  Future<void> sendMessage(String msg) async {
    emit(ChatLoadingState());
    try {
      final messages = await ApiServices().getChat(msg).then((value) {
        chatList.add(value);
      });

      emit(ChatSuccessState());
    } catch (e) {
      print(e);
      emit(ChatErrorState(e.toString()));
    }
  }

  Future<void> saveLastChatHistory() async {

    final List<String> chatListJson =
        chatList.map((chat) => jsonEncode(chat.toJson(chat))).toList();
    int currentChatIndex = await CacheHelper.getData(key: 'lastChatIndex') ?? 0;
    currentChatIndex++;
    await CacheHelper.saveData(
        key: 'lastChat$currentChatIndex', value: chatListJson);
    await CacheHelper.saveData(key: 'lastChatIndex', value: currentChatIndex);

    getLastChatHistory();
    emit(SaveLastChatHistorySuccessState());
  }

  Future<void> updateChatHistory() async {

    final List<String> chatListJson =
        chatList.map((chat) => jsonEncode(chat.toJson(chat))).toList();
    int currentChatIndex = await CacheHelper.getData(key: 'lastChatIndex') ?? 0;
    await CacheHelper.saveData(
        key: 'lastChat$currentChatIndex', value: chatListJson);
    await CacheHelper.saveData(key: 'lastChatIndex', value: currentChatIndex);

    getLastChatHistory();
    emit(SaveLastChatHistorySuccessState());
  }

  void getLastChatHistory() async {
    var lastChatIndex = await CacheHelper.getData(key: 'lastChatIndex') ?? 0;

    lastChatList = [];
    allChatHistory = [];

    for (var i = 1; i <= lastChatIndex; i++) {
      var chatListJson = await CacheHelper.getData(key: 'lastChat$i');
      List<String> chatListString = chatListJson.cast<String>();

      var historyChat = chatListString
          .map((json) => ChatModel.fromJson2(jsonDecode(json)))
          .toList();
      lastChatList = historyChat;
      allChatHistory.add(lastChatList);
    }
    allChatHistory;
    emit(GetLastChatHistorySuccessState());
  }

  void clearChatHistory() async {
    await CacheHelper.clearAllData();
    allChatHistory = [];
    emit(ClearChatHistorySuccessState());
  }
}
