// import 'package:flutter/cupertino.dart';

// class AppDialog extends StatelessWidget {
//   final String title;
//   final String content;
//   final Widget contentWidget;
//   final List<Widget> actions;

//   const AppDialog({
//     this.title,
//     this.actions,
//     this.content,
//     this.contentWidget,
//   });

//   AppDialog.choice({
//     @required VoidCallback onTapYes,
//     VoidCallback onTapNo,
//     String title,
//     String content,
//     Widget contentWidget,
//   }) : this(
//           title: title,
//           content: content,
//           contentWidget: contentWidget,
//           actions: [
//             CupertinoDialogAction(
//               onPressed: onTapNo ?? Get.back,
//               child: const Text('Нет', style: AppTextStyles.largeBlueW600),
//             ),
//             CupertinoDialogAction(
//               onPressed: onTapYes,
//               child: const Text('Да', style: AppTextStyles.largeGreyDarkW400),
//             ),
//           ],
//         );

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoAlertDialog(
//       title: title != null ? Text(title, style: AppTextStyles.bigBlackW500) : Container(),
//       content: Padding(
//         padding: const EdgeInsets.only(top: 12),
//         child: contentWidget ?? Text(content, style: AppTextStyles.regularGreyDarkW400),
//       ),
//       actions: actions ??
//           [
//             CupertinoDialogAction(
//               onPressed: Get.back,
//               child: Text(Strings.of(Get.context).ok),
//             )
//           ],
//     );
//   }
// }
