import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Color? color;
  

  const NextButton({
    Key? key,
    this.onTap,
    required this.title,
    this.color,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        splashColor: (Colors.white).withOpacity(0.5),
        onTap: () {
                HapticFeedback.mediumImpact();

                onTap?.call();
              },
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: 40.h,
          decoration: BoxDecoration(
            color: color ??
                ( AppColors.blue),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              title.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color:(Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
