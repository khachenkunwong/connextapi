

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter flow/flutter_flow_theme.dart';
import '../flutter flow/flutter_flow_widgets.dart';

class VerifyemailWidget extends StatefulWidget {
  const VerifyemailWidget({Key? key}) : super(key: key);

  @override
  _VerifyemailWidgetState createState() => _VerifyemailWidgetState();
}

class _VerifyemailWidgetState extends State<VerifyemailWidget> {
  TextEditingController? textController;
  final riveAnimationAnimationsList = [
    'Animation 1',
  ];
  
  

  @override
  void initState() {
    super.initState();
    

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.primaryBackground,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Mask_Group.png',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 550,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'ยืนยันอีเมลของคุณ',
                          style: FlutterFlowTheme.title2,
                        ),
                      ),
                      Text(
                        'รหัสส่งไปยังอีเมล : \njohn.liam@gmail.com',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.bodyText1,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                        child: TextFormField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'code',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ยังไม่ได้รับรหัส?',
                              style: FlutterFlowTheme
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Mitr',
                                    color: FlutterFlowTheme
                                        .tertiaryColor,
                                  ),
                            ),
                            Text(
                              'ส่งซ้ำ',
                              style: FlutterFlowTheme
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Mitr',
                                    color: Color(0xFF00A2FD),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            // await Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => CheckingwaitWidget(),
                            //   ),
                            // );
                          },
                          text: 'ตรวจสอบ',
                          options: FFButtonOptions(
                            width: 285,
                            height: 40,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.subtitle1,
                            elevation: 10,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
