import 'package:easy_localization/easy_localization.dart' as localized;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormTextFieldCopy extends StatefulWidget {
  FormTextFieldCopy({
    super.key,
    required this.title,
    required this.isNumber,
    this.controller,
    this.validator,
    this.isActive,
  }) : super();
  final bool? isActive;
  final String title;
  final bool isNumber;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<FormTextFieldCopy> createState() => _FormTextFieldCopyState();
}

class _FormTextFieldCopyState extends State<FormTextFieldCopy> {
  TextEditingController valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      // valueController.text = valueController.text.tr();
      valueController = widget.controller!;
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0.w,
        vertical: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.title.tr(),
            ),
          ),
          Expanded(
            child: TextFormField(
              enabled: widget.isActive ?? true,
              // smartDashesType: SmartDashesType.enabled,
              showCursor: true,
              cursorOpacityAnimates: true,
              mouseCursor: MouseCursor.uncontrolled,
              validator: widget.validator,
              autofocus: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // maxLines: 1,
              controller: valueController,
              textAlignVertical: TextAlignVertical.center,
            
              textAlign: TextAlign.end,
              style: TextStyle(
                // color: widget.isActive?? true?    Colors.grey,
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
              ),
              scrollPadding: EdgeInsets.all(0),
              keyboardType:
                  widget.isNumber ? TextInputType.number : TextInputType.text,
              maxLength: 15,
              // selectionHeightStyle: BoxHeightStyle.max,
              // textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: widget.isActive ?? true ? 'enter_values'.tr() : '',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                counterText: '',
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
