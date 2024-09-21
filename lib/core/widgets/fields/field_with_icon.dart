import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiedWithIcon extends StatelessWidget {
  const FiedWithIcon({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
    this.isActive
  });
  final bool? isActive;
  final String title;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w,),
      child: Container(
        constraints: BoxConstraints(maxHeight: 40.h, minHeight: 40.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                title.tr(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium,
                
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              excludeFromSemantics: true,
              focusNode: FocusNode(),
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    value == '' ? "nothing".tr() : value.tr(),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      // color: value == '' ? Colors.grey : Colors.black,
                    ),
                  ),
                  SizedBox(width: 5,),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 20),
                    child: Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                     
                    ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
