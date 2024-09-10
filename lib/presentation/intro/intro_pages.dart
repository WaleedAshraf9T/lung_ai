import 'package:flutter/material.dart';

class IntroPagesOne extends StatelessWidget {
  const IntroPagesOne({super.key});
  static const String route = '/intro';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF180C21),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: null,
                  icon: Container(
                    height: 26,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
