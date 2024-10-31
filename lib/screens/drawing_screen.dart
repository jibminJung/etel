import 'dart:io';

import 'package:emergencyorder/screens/inquiry_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawingScreen extends StatefulWidget {
  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<Offset?> points = [];
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('환부 표시'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: null, //_saveToSVG,
          ),
        ],
      ),
      body: Column(
        children: [
          // SizedBox(height: 30,),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('터치하여 환부를 표시해주세요 !',style: TextStyle(fontSize: 17),),
                ),
                kIsWeb?
                Image.asset('human_image.png',width: double.maxFinite,height: double.maxFinite,):
                Image.asset('assets/human_image.png',width: double.maxFinite,height: double.maxFinite,),
                CustomPaint(
                  painter: MyPainter(points),
                  child: Container(),
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      points
                          .add(details.localPosition);
                    });
                  },
                  onPanEnd: (details) {
                    points.add(null);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
              width: double.maxFinite,
              height: 60,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        _createRouteToInquiryScreen());
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered))
                          return Colors.blue.withOpacity(0.04);
                        if (states.contains(WidgetState.focused) ||
                            states.contains(WidgetState.pressed))
                          return Colors.blue.withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  ),
                  child: Text('다음')))
        ],
      ),
    );
  }

// Future<void> _saveToSVG() async {
//   final svgString = _generateSVG();
//   final directory = await getApplicationDocumentsDirectory();
//   final svgFile = File('${directory.path}/markup_image.svg');
//   await svgFile.writeAsString(svgString);
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SVG saved to gallery!')));
// }
//
// String _generateSVG() {
//   final builder = XmlBuilder();
//
//   builder.element('svg', nest: () {
//     builder.attribute('xmlns', 'http://www.w3.org/2000/svg');
//     builder.attribute('width', '500');
//     builder.attribute('height', '500');
//
//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) {
//         builder.element('line', nest: () {
//           builder.attribute('x1', points[i]!.dx.toString());
//           builder.attribute('y1', points[i]!.dy.toString());
//           builder.attribute('x2', points[i + 1]!.dx.toString());
//           builder.attribute('y2', points[i + 1]!.dy.toString());
//           builder.attribute('stroke', 'red');
//           builder.attribute('stroke-width', '5');
//         });
//       }
//     }
//   });
//
//   return builder.buildDocument().toXmlString(pretty: true);
// }
  Route _createRouteToInquiryScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          InquiryScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Offset?> points;

  MyPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


