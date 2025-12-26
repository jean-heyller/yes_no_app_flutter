import 'package:flutter/material.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answert.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswert getYesNoAnswert = GetYesNoAnswert();

  List<Message> messages = [
    Message(text: 'Hola mi Amor', fromWho: FromWho.mine),
    Message(text: 'Ya regresaste del trabajjo', fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.mine);

    messages.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }


    notifyListeners();
    moveScrollToBottom();

  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswert.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();

  }

  Future<void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));

    final double scrollPosition = chatScrollController.position.maxScrollExtent;

    chatScrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut
    );

  }
}