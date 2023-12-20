part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChatLoadingState extends AppState {}

class ChatSuccessState extends AppState {}

class ChatErrorState extends AppState {
  final String error;
  ChatErrorState(this.error);
}


class GetLastChatHistorySuccessState extends AppState {}

class SaveLastChatHistorySuccessState extends AppState {}
class ClearChatHistorySuccessState extends AppState {}