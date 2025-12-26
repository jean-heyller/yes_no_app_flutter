import 'package:flutter/material.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';

class HerMessageBuble extends StatelessWidget {
  final Message message;

  const HerMessageBuble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(urlImage: message.imageUrl!),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String urlImage;

  const _ImageBubble({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        urlImage,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width + 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: const Text('Se esta enviando un mensaje'),
          );
        },
      ),
    );
  }
}
