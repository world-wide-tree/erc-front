import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MedicinTextWidget extends StatefulWidget {
  final String date;
  final String text;
  const MedicinTextWidget({super.key, required this.text, required this.date});

  @override
  State<MedicinTextWidget> createState() => _MedicinTextWidgetState();
}

class _MedicinTextWidgetState extends State<MedicinTextWidget> {
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
                Text('recept'.tr()),
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
