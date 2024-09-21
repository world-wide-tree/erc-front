import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ActionsButton extends StatefulWidget {
  final String text;
  final SvgPicture icon;
  final VoidCallback? onTap;
  const ActionsButton(
      {super.key, required this.text, required this.icon, required this.onTap});
  @override
  State<ActionsButton> createState() => _ActionsButtonState();
}

class _ActionsButtonState extends State<ActionsButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 48),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                  elevation: 0,
                  // surfaceTintColor: Colors.white,
                  // backgroundColor: Colors.white,
                  fixedSize: Size.fromHeight(60.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: widget.onTap,
              child: Row(
                children: [
                  widget.icon,
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    style: Theme.of(context).textTheme.bodyMedium,
                    widget.text.tr(),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
