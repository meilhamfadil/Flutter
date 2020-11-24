import 'package:baseflutter/assets/app_theme.dart';
import 'package:flutter/material.dart';

class Pressable extends StatefulWidget {
  final Function onPress;
  final String label;
  final bool loading;
  final EdgeInsetsGeometry margin;

  Pressable({this.onPress, this.label, this.loading = false, this.margin = EdgeInsets.zero});

  @override
  State<StatefulWidget> createState() => _Pressable();
}

class _Pressable extends State<Pressable> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.loading,
      child: Container(
        margin: widget.margin,
        child: FlatButton(
          color: widget.loading ? AppColor.disable : AppColor.primary,
          textColor: widget.loading ? AppColor.textDisable : AppColor.white,
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
                    valueColor: AlwaysStoppedAnimation(AppColor.white),
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
      ),
    );
  }
}
