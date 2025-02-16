import 'package:flutter/cupertino.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child:
          Text("result",style: TextStyle(fontSize: 50
          ),),
        )
      ],
    );
  }
}
