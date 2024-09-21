import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadyField extends StatelessWidget {
  const ReadyField({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Container(
        constraints: BoxConstraints(maxHeight: 20.h, minHeight: 20.h),
        child: Row(
          children: [
            Text(
              title.tr(),
              style: TextStyle(fontSize: 14),
            ),
            Spacer(),
            Expanded(
              child: Text(
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                value.tr(),
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
