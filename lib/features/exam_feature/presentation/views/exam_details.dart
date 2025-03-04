import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class ExamDetails extends StatelessWidget {
  const ExamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as List<String>;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Exam details")),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 16, right: 16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: arguments[3],
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    height: 70,

                    placeholder:
                        (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: Constants.primaryColor,
                          ),
                        ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  arguments[1],
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  "${arguments[2]} Minutes",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    fontFamily: Constants.fontFamily,
                    color: Color(0xFF02369C),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey),
            SizedBox(height: 20),
            Text("Instructions", style: theme.textTheme.titleLarge),
            SizedBox(height: 20),
            Text(
              '''Lorem ipsum dolor sit amet consectetur
              
Lorem ipsum dolor sit amet consectetur

Lorem ipsum dolor sit amet consectetur.''',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Color(0xFF535353),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.primaryColor,

              ),
              child: Text(
                "Start",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
