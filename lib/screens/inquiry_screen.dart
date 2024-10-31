import 'package:emergencyorder/screens/request_and_wait_screen.dart';
import 'package:flutter/material.dart';

class InquiryScreen extends StatefulWidget {
  @override
  _InquiryScreenState createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  String? patientType;
  String? patientCondition;
  String? leftEyeCondition;
  String? rightEyeCondition;
  String? woundType;
  String? additionalInfo;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('설문지')),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('  환자 발생 유형', style: TextStyle(fontSize: 18)),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          PatientTypeButton('질병', 'disease'),
                          PatientTypeButton('교통사고', 'car accident')
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        children: [
                          PatientTypeButton('사고부상', 'accident'),
                          PatientTypeButton('비외상성 손상', 'atrumatic')
                        ],
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('환자의 의식 상태', style: TextStyle(fontSize: 18)),
                      Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: RadioListTile(
                                  title: Text('A'),
                                  value: 'A',
                                  groupValue: patientCondition,
                                  onChanged: (value) {
                                    setState(() {
                                      patientCondition = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: RadioListTile(
                                  title: Text('V'),
                                  value: 'V',
                                  groupValue: patientCondition,
                                  onChanged: (value) {
                                    setState(() {
                                      patientCondition = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: RadioListTile(
                                  title: Text('P'),
                                  value: 'P',
                                  groupValue: patientCondition,
                                  onChanged: (value) {
                                    setState(() {
                                      patientCondition = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: RadioListTile(
                                  title: Text('U'),
                                  value: 'U',
                                  groupValue: patientCondition,
                                  onChanged: (value) {
                                    setState(() {
                                      patientCondition = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('동공반응 ?', style: TextStyle(fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(' 좌안', style: TextStyle(fontSize: 14)),
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: Text('정상'),
                            value: 'normal',
                            groupValue: leftEyeCondition,
                            onChanged: (value) {
                              setState(() {
                                leftEyeCondition = value;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RadioListTile(
                            title: Text('축동'),
                            value: 'miosys',
                            groupValue: leftEyeCondition,
                            onChanged: (value) {
                              setState(() {
                                leftEyeCondition = value;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RadioListTile(
                            title: Text('산동'),
                            value: 'mydriasis',
                            groupValue: leftEyeCondition,
                            onChanged: (value) {
                              setState(() {
                                leftEyeCondition = value;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RadioListTile(
                            title: Text('무반응/측정불가'),
                            value: 'unavailable',
                            groupValue: leftEyeCondition,
                            onChanged: (value) {
                              setState(() {
                                leftEyeCondition = value;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(' 우안', style: TextStyle(fontSize: 14)),
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: Text('정상'),
                            value: 'normal',
                            groupValue: rightEyeCondition,
                            onChanged: (value) {
                              setState(() {
                                rightEyeCondition = value;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RadioListTile(
                            title: Text('축동'),
                            value: 'miosys',
                            groupValue: rightEyeCondition,
                            onChanged: (value) {
                              setState(() {
                                rightEyeCondition = value;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RadioListTile(
                            title: Text('산동'),
                            value: 'mydriasis',
                            groupValue: rightEyeCondition,
                            onChanged: (value) {
                              setState(() {
                                rightEyeCondition = value;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RadioListTile(
                            title: Text('무반응/측정불가'),
                            value: 'unavailable',
                            groupValue: rightEyeCondition,
                            onChanged: (value) {
                              setState(() {
                                rightEyeCondition = value;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text('활력징후', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Text(' 혈압', style: TextStyle(fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'ex) 120',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('/'),
                          ),
                          SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '80',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('mmhg'),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(' 맥박', style: TextStyle(fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'ex) 180',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('회/min'),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(' 호흡', style: TextStyle(fontSize: 14)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'ex) 180',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 1.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('회/min'),
                          )
                        ],
                      ),
                      // Text('어떤 상처인가요?', style: TextStyle(fontSize: 18)),
                      // Column(
                      //   children: [
                      //     RadioListTile(
                      //       title: Text('타박상'),
                      //       value: 'bruise',
                      //       groupValue: woundType,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           woundType = value;
                      //         });
                      //       },
                      //       activeColor: Colors.blue,
                      //     ),
                      //     RadioListTile(
                      //       title: Text('열상'),
                      //       value: 'laceration',
                      //       groupValue: woundType,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           woundType = value;
                      //         });
                      //       },
                      //       activeColor: Colors.blue,
                      //     ),
                      //     RadioListTile(
                      //       title: Text('창상'),
                      //       value: 'wound',
                      //       groupValue: woundType,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           woundType = value;
                      //         });
                      //       },
                      //       activeColor: Colors.blue,
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 15),
                      Text('기타 사항:', style: TextStyle(fontSize: 18)),
                      TextField(
                        onChanged: (value) {
                          additionalInfo = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
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
                        context, _createRouteToRequestAndWaitScreen());
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered))
                          return Colors.blueAccent;
                        if (states.contains(WidgetState.focused) ||
                            states.contains(WidgetState.pressed))
                          return Colors.blue.withOpacity(0.12);
                        return null; // Defer to the widget's default.
                      },
                    ),
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                  ),
                  child: Text('요청 보내기')))
        ],
      ),
    );
  }
  
  Widget PatientTypeButton(String? label, String? value) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: patientType == value ? Colors.blue : Colors
                    .transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                side: BorderSide(
                    color: Colors.blue, width: 3)),
            onPressed: () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.linear);
              setState(() {
                patientType = value;
              });
            },
            child: Container(
                alignment: Alignment.center,
                height: double.maxFinite,
                child: Text(label??'', style: TextStyle(
                  color: patientType == value ? Colors.white : Colors
                      .blue,),))),
      ),
    );
  }
  

  Route _createRouteToRequestAndWaitScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          RequestAndWaitScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
