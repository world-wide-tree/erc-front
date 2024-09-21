import 'package:ERC/core/utils/path_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.chevron_left),
        //     onPressed: () {},
        //   ),
        // ),
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PathConstants.login),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[200]!.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 200,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'who_are_you'.tr(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                          Colors.blue[200],
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
                        context.go('/doctorHomeScreen');
                      },
                      child: Text('doctor'.tr())),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/patientHomeScreen');
                    },
                    child: Text(
                      'patient'.tr(),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(
                        Colors.blue[200],
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
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffEFF1F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'ERC',
                    style: TextStyle(
                      color: Colors.blue[200],
                      fontSize: 40,
                    ),
                  ),
                ),
              )),
        ),
      ],
    ));
  }
}
