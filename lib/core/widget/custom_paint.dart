// import 'package:flutter/material.dart';

// ////////////////////////////////////////////////////////////////////////////////////////
// class RPSCustomPainter extends CustomPainter {
//   final double? ratio;
//   final Color? color;
//   RPSCustomPainter({this.ratio, this.color});
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = (color != null) ? color! : MyColors.backgroundColor
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1.0;

//     Path path0 = Path();
//     path0.moveTo(0, 0);
//     path0.lineTo(size.width, 0);
//     path0.lineTo(size.width, (size.height - ratio!) * 0.2987200);
//     path0.quadraticBezierTo(
//         size.width * 0.9892875,
//         (size.height - ratio!) * 0.1956200,
//         size.width * 0.8131250,
//         (size.height - ratio!) * 0.2003000);
//     path0.cubicTo(
//         size.width * 0.6055500,
//         (size.height - ratio!) * 0.2029000,
//         size.width * 0.3071500,
//         (size.height - ratio!) * 0.2004600,
//         size.width * 0.0884000,
//         (size.height - ratio!) * 0.1959800);
//     path0.quadraticBezierTo(
//         size.width * 0.0163875,
//         (size.height - ratio!) * 0.1949000,
//         0,
//         (size.height - ratio!) * 0.0978400);

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
