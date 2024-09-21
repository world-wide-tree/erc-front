import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PhotoTextWidget extends StatefulWidget {
  final String title;
  final String urlPhoto;
  final String date;
  final String text;
  const PhotoTextWidget({
    super.key,
    required this.text,
    required this.date,
    required this.title,
    required this.urlPhoto,
  });

  @override
  State<PhotoTextWidget> createState() => _PhotoTextWidgetState();
}

class _PhotoTextWidgetState extends State<PhotoTextWidget> {
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
                Text(widget.title),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.network(
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.warning);
                      },
                      widget.urlPhoto,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
