import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class IndicatorsButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  const IndicatorsButton({super.key, required this.text, required this.onTap});
  @override
  State<IndicatorsButton> createState() => _IndicatorsButtonState();
}

class _IndicatorsButtonState extends State<IndicatorsButton> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.text.tr(), style: Theme.of(context).textTheme.bodyMedium,),
                  Icon(Icons.chevron_right, size: 16.h,)
                ],
              )),
        ),
      ],
    );
  }
}
