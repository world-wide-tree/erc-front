import 'package:ERC/core/widgets/medicin_text.dart';
import 'package:ERC/core/widgets/photo_with_text.dart';
import 'package:flutter/material.dart';

class AboutPatientScreen extends StatefulWidget {
  const AboutPatientScreen({super.key});

  @override
  State<AboutPatientScreen> createState() => _AboutPatientScreenState();
}

class _AboutPatientScreenState extends State<AboutPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            MedicinTextWidget(
              date: '2024/01/12',
              text: 'Nujno lechitsya',
            ),
            SizedBox(
              height: 10,
            ),
            PhotoTextWidget(
                text: '',
                date: "2024/02/12",
                title: 'ekg',
                urlPhoto:
                    'https://thoracickey.com/wp-content/uploads/2016/12/image00970-1.jpeg')
          ],
        ),
      ),
    );
  }
}