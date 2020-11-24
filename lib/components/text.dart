import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextComponent {
  static Widget left(String text, {TextStyle style, EdgeInsetsGeometry padding = EdgeInsets.zero}) => Padding(
        padding: padding,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(text, style: style),
        ),
      );

  static Widget defaultField(
    TextEditingController controller,
    FocusNode focusNode, {
    TextInputAction action = TextInputAction.none,
    Function onSubmit,
    int maxLines = 1,
    int minLines = 1,
  }) =>
      TextField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: action,
        maxLines: maxLines,
        minLines: minLines,
        onSubmitted: (text) => {if (onSubmit != null) onSubmit.call(text)},
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(12),
        ),
      );
}
