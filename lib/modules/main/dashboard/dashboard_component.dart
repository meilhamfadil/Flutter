// import 'package:baseflutter/base/base_component.dart';
// import 'package:baseflutter/base/base_screen.dart';
// import 'package:baseflutter/components/pressable.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../main_screen_argument.dart';
// import '../task/task_component.dart';
//
// class DashboardComponent extends BaseComponent {
//   DashboardComponent(ScreenContract screen) : super(screen);
//
//   @override
//   State<StatefulWidget> createState() => _DashboardComponent(screen);
// }
//
// class _DashboardComponent extends BaseComponentState<DashboardComponent> with RenderComponent {
//   _DashboardComponent(ScreenContract screen) : super(screen);
//
//   @override
//   Widget render() {
//     MainScreenArguments arguments = screen.arguments;
//
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("Welcome ${arguments.name}"),
//               Text("Phone Number : ${arguments.phone}"),
//               Text("Click Button to Change Current Screen"),
//               Container(height: 24),
//               Pressable(
//                 label: "Hello",
//                 onPress: () {
//                   widget.screen.openComponent(TaskComponent(widget.screen));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
