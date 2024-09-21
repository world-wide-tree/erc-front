import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String title;
  final String date;
  final String text;
  const TextWidget(
      {super.key, required this.text, required this.date, required this.title});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.date,
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue[200]!.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.text,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
