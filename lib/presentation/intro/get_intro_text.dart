import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lung_ai/shared/intro_pages_data.dart';
import 'package:lung_ai/shared/theme_colors.dart';

class GetIntroText extends StatefulWidget {
  final int index;
  const GetIntroText({super.key, this.index = 0});

  @override
  State<GetIntroText> createState() => _GetIntroTextState();
}

class _GetIntroTextState extends State<GetIntroText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          introPagesText[widget.index]?["title"] ?? "Title Here",
          style: const TextStyle(
              color: whiteBG,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic),
        ),

        //
        const SizedBox(height: 10),
        AutoSizeText(
          introPagesText[widget.index]?['description'] ?? "Description Here!",
          textAlign: TextAlign.center,
          style: const TextStyle(color: whiteBG, fontSize: 12),
        )
      ],
    );
  }
}
