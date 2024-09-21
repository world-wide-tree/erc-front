import 'package:ERC/core/utils/path_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientMoreScreen extends StatefulWidget {
  const PatientMoreScreen({super.key});

  @override
  State<PatientMoreScreen> createState() => _PatientMoreScreenState();
}

class _PatientMoreScreenState extends State<PatientMoreScreen> {
  bool cardio = true;
  bool lor = false;
  bool glaza = false;
  bool hirurg = false;
  bool pediator = false;
  bool stomatolog = false;
  bool travmotolog = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'ERC',
                style: TextStyle(color: Color(0xff1C274C), fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  alignment: Alignment.centerLeft,
                  backgroundColor: cardio
                      ? MaterialStatePropertyAll(Colors.blue[200])
                      : MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(260),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    cardio = true;
                    glaza = false;
                    hirurg = false;
                    lor = false;
                    pediator = false;
                    stomatolog = false;
                    travmotolog = false;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      PathConstants.cardio,
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('cardio'.tr()),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  alignment: Alignment.centerLeft,
                  backgroundColor: lor
                      ? MaterialStatePropertyAll(Colors.blue[200])
                      : MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(260),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    cardio = false;
                    glaza = false;
                    hirurg = false;
                    lor = true;
                    pediator = false;
                    stomatolog = false;
                    travmotolog = false;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      PathConstants.lor,
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('lor'.tr()),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  alignment: Alignment.centerLeft,
                  backgroundColor: glaza
                      ? MaterialStatePropertyAll(Colors.blue[200])
                      : MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(260),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    cardio = false;
                    glaza = true;
                    hirurg = false;
                    lor = false;
                    pediator = false;
                    stomatolog = false;
                    travmotolog = false;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      PathConstants.oftalmolog,
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('oftalmolog'.tr()),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  alignment: Alignment.centerLeft,
                  backgroundColor: stomatolog
                      ? MaterialStatePropertyAll(Colors.blue[200])
                      : MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(260),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    cardio = false;
                    glaza = false;
                    hirurg = false;
                    lor = false;
                    pediator = false;
                    stomatolog = true;
                    travmotolog = false;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      PathConstants.tooth,
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('stomatolog'.tr()),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  alignment: Alignment.centerLeft,
                  backgroundColor: hirurg
                      ? MaterialStatePropertyAll(Colors.blue[200])
                      : MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(260),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    cardio = false;
                    glaza = false;
                    hirurg = true;
                    lor = false;
                    pediator = false;
                    stomatolog = false;
                    travmotolog = false;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      PathConstants.hirurg,
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('hirurg'.tr()),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  alignment: Alignment.centerLeft,
                  backgroundColor: travmotolog
                      ? MaterialStatePropertyAll(Colors.blue[200])
                      : MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(260),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    cardio = false;
                    glaza = false;
                    hirurg = false;
                    lor = false;
                    pediator = false;
                    stomatolog = false;
                    travmotolog = true;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      PathConstants.rentgen,
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('travmotolog'.tr()),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  alignment: Alignment.centerLeft,
                  backgroundColor: pediator
                      ? MaterialStatePropertyAll(Colors.blue[200])
                      : MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(260),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    cardio = false;
                    glaza = false;
                    hirurg = false;
                    lor = false;
                    pediator = true;
                    stomatolog = false;
                    travmotolog = false;
                  });
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      PathConstants.pediatr,
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('pediatr'.tr()),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
