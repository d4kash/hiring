import 'package:flutter/material.dart';
import 'package:hiring/Constants/constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Constant.height / 7);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(widget.text,
          style: TextStyle(
            fontSize: Constant.height / 25,
          )),
      toolbarHeight: Constant.height / 7,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
              colors: [Colors.pink, Colors.yellow.shade200],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
      ),
    );
  }
}
