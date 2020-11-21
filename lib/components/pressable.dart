import 'package:baseflutter/assets/app_theme.dart';
import 'package:flutter/material.dart';

class Pressable extends StatefulWidget {
  Function onPress = () => {};
  String label = "";
  bool loading = false;

  Pressable({this.onPress, this.label, this.loading});

  @override
  State<StatefulWidget> createState() => _Pressable();
}

class _Pressable extends State<Pressable> {
  AppColor colors = AppTheme().colors;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.loading,
      child: FlatButton(
        color: widget.loading ? colors.disable : colors.primary,
        textColor: widget.loading ? colors.textDisable : colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: widget.loading,
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(widget.label),
            ),
          ],
        ),
        onPressed: () => widget.loading ? null : widget.onPress.call(),
      ),
    );
  }
}
