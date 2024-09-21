import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar(
      {super.key,
      required this.title,
      required this.listTabs,
      required this.onSend,
      required this.onBack,
      this.sendTitle,
      this.isBack});
  final String title;
  final List<Widget> listTabs;
  final VoidCallback? onSend;
  final VoidCallback? onBack;
  final String? sendTitle;
  final bool? isBack;
  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}

class _MainAppBarState extends State<MainAppBar> {
  bool isBack = false;
  String sendTitle = 'send';
  void initState() {
    if (widget.sendTitle != null) {
      sendTitle = widget.sendTitle!;
    }
    widget.isBack != null ? isBack = widget.isBack! : isBack = true;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBack
          ? IconButton(
              onPressed: widget.onBack,
              icon: Icon(Icons.chevron_left),
            )
          : SizedBox(),
      centerTitle: true,
      title: Text(
        widget.title.tr(),
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: widget.onSend,
          child: Text(
            sendTitle.tr(),
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
      bottom: TabBar(
        isScrollable: false,
        physics: NeverScrollableScrollPhysics(),
        tabs: widget.listTabs,
      ),
    );
  }
}
