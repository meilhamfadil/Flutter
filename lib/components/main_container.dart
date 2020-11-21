import 'package:flutter/cupertino.dart';

class MainContainer extends StatelessWidget {
  Widget child;

  MainContainer({@required this.child});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(24),
        child: child,
      );
}
