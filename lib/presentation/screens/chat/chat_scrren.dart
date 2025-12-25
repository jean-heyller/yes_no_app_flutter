import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_buble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScrren extends StatelessWidget {
  const ChatScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://eu-images.contentstack.com/v3/assets/blt7dcd2cfbc90d45de/bltc4489d54c6064646/60dbb614cbc6070f5c3c9e5c/7-1_207.jpg?format=pjpg&auto=webp&quality=75%2C90&width=256',
            ),
          ),
        ),
        title: Text('Amor'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,

                itemBuilder: (context, index) {
                  return ( index % 2 == 0) ?
                  const HerMessageBuble() : const MyMessageBuble();
                },
              ),
            ),

            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
