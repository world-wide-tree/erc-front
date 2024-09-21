import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseField extends StatefulWidget {
  const ChooseField(
      {super.key, required this.count, required this.selectedItems});
  final int count;
  final List<int> selectedItems;
  final bool value = false;

  @override
  State<ChooseField> createState() => _ChooseFieldState();
}

class _ChooseFieldState extends State<ChooseField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: 20.h,
          child: Container(
            constraints: BoxConstraints(maxHeight: 20.h),
              child: Row(
            children: [
              Text(widget.selectedItems[index].toString()).tr(),
              Spacer(),
              Checkbox(
                  value: widget.value,
                  onChanged: (value) {
                    value = !value!;
                  })
            ],
          )),
        ),
      ),
    );
  }
}
