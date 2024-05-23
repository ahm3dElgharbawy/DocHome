import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/chat/data/models/chat.dart';
import 'package:dochome/patient/features/chat/data/models/message.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:http/http.dart';

abstract class CaregiverChatRepo {
  Future<Either<Failure, Unit>> newChat(
      {required int patientId, required int caregiverId});
  Future<Either<Failure, List<Chat>>> allChats(); // : List<ChatModel>
  Future<Either<Failure, MessageModel>> addMessage(
      {required String message,
      required String chatId,
      required String caregiverId});
  Future<Either<Failure, List<MessageModel>>> allMessage(
      {required int chatId, required int page}); // : List<Message>
}

class CaregiverChatRepoImpl implements CaregiverChatRepo {
  final NetworkInfo networkInfo;
  const CaregiverChatRepoImpl({required this.networkInfo});

  @override
  Future<Either<Failure, MessageModel>> addMessage(
      {required message, required chatId, required caregiverId}) async {
    Either<Failure, Response> result = await ResponseHandler.handle(
      () => ApiCalls.postData(EndPoints.addChatMessage, {
        "message": message,
        "chat_id": chatId,
        "caregiver_id": caregiverId,
        "created_by": "c",
      }),
    );

    return result.fold((failure) => left(failure), (response) {
      MessageModel message =
          MessageModel.fromJson(jsonDecode(response.body)['data']);
      return right(message);
    });
  }

  @override
  Future<Either<Failure, List<Chat>>> allChats() async {
    Either<Failure, Response> result = await ResponseHandler.handle(
      () => ApiCalls.getData(EndPoints.getAllChats),
    );

    return result.fold((failure) => left(failure), (response) {
      final List allChats = jsonDecode(response.body)['data'];
      List<Chat> chats = allChats.map((chat) => Chat.fromJson(chat)).toList();
      return right(chats);
    });
  }

  @override
  Future<Either<Failure, List<MessageModel>>> allMessage(
      // todo add message model
      {required int chatId,
      required int page}) async {
    Either<Failure, Response> result = await ResponseHandler.handle(
      () => ApiCalls.getData(
          '${EndPoints.getChatMessages}?chat_id=$chatId&page=$page'),
    );

    return result.fold((failure) => left(failure), (response) {
      List messages = jsonDecode(response.body)['data'];
      List<MessageModel> all =
          messages.map((message) => MessageModel.fromJson(message)).toList();
      return right(all);
    });
  }

  @override
  Future<Either<Failure, Unit>> newChat(
      {required int patientId, required int caregiverId}) async {
    Either<Failure, Response> result = await ResponseHandler.handle(
      () => ApiCalls.postData(EndPoints.createNewChat,
          {'patient_id': patientId, 'caregiver_id': caregiverId}),
    );

    return result.fold((failure) => left(failure), (response) {
      return right(unit);
    });
  }
}
