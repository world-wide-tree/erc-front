import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SecondaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  SecondaryAppBar({
    super.key,
    this.backColor,
    required this.title,
    this.onSend,
    required this.onBack,
    required this.sendLabel,
    this.icon,
  });
  final String title;
  final String sendLabel;
  final VoidCallback? onSend;
  final VoidCallback? onBack;
  final IconData? icon;
  Color? backColor = Colors.white;
  @override
  State<SecondaryAppBar> createState() => _SecondaryAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SecondaryAppBarState extends State<SecondaryAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: widget.backColor,
      leading: IconButton(
        onPressed: widget.onBack,
        icon: Icon(
          Icons.chevron_left,
        ),
      ),
      centerTitle: true,
      title: Text(
        widget.title.tr(),
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: widget.onSend,
          child: Text(
            widget.sendLabel.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        if (widget.icon != null)
          IconButton(
            iconSize: 22,
            icon: Icon(widget.icon),
            onPressed: widget.onSend,
          )
      ],
    );
  }
}
