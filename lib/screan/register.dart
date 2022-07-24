// create page statafull widget with scaffold and appbar with textfield and button
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter flow/flutter_flow_theme.dart';
import '../flutter flow/flutter_flow_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../pubilc_/pubilc_.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController? name;
  TextEditingController? nick_name;
  TextEditingController? email;
  TextEditingController? password;
  late bool passwordVisibility1;
  TextEditingController? password2;
  late bool passwordVisibility2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Color password_color;
  submit() async {
    final res = await http.post(
      Uri.parse("$url/api/auth/register"),
      headers: {
        "Accept": "application/json",
        'content-type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      },
      body: convert.jsonEncode({
        "frist_name": name!.text,
        "last_name": nick_name!.text,
        "email": email!.text,
        "password": password!.text,

      }),
    );

    if (res.statusCode != 200) {
      FlutterToastr.show("กรุณากรอกข้อมูลให้ครบ", context,
          duration: 2,
          position: FlutterToastr.bottom,
          backgroundColor: Colors.red,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ));
    } else {
      FlutterToastr.show("สมัครเสร็จสิ้น", context,
          duration: 2,
          position: FlutterToastr.bottom,
          backgroundColor: Colors.green,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ));
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text:'khachen');
    nick_name = TextEditingController(text: 'arm');
    email = TextEditingController(text: 'email');
    password = TextEditingController(text: "password");
    passwordVisibility1 = false;
    password2 = TextEditingController(text: "password");
    passwordVisibility2 = false;
    password_color = FlutterFlowTheme.secondaryText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Text(
                  'สมัครสมาชิก',
                  style: FlutterFlowTheme.title2,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'ชื่อ',
                        style: FlutterFlowTheme.title3,
                      ),
                    ),
                    TextFormField(
                      controller: name,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'กรอกชื่อผู้ใช้ตรงนี้',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.bodyText1,
                    ),
                    Text(
                      'นามสกุล',
                      style: FlutterFlowTheme.title3,
                    ),
                    TextFormField(
                      controller: nick_name,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'กรอกนามสกุลตรงนี้',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.bodyText1,
                    ),
                    Text(
                      'อีเมล',
                      style: FlutterFlowTheme.title3,
                    ),
                    TextFormField(
                      controller: email,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'กรอกอีเมลตรงนี้',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: FlutterFlowTheme.bodyText1,
                    ),
                    Text(
                      'รหัสผ่าน',
                      style: FlutterFlowTheme.title3,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: !passwordVisibility1,
                      decoration: InputDecoration(
                        hintText: 'กรอกรหัสผ่านตรงนี้',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: password_color,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility1 = !passwordVisibility1,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility1
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'รหัสผ่านอีกครั้ง',
                        style: FlutterFlowTheme.title3,
                      ),
                    ),
                    TextFormField(
                      controller: password2,
                      obscureText: !passwordVisibility2,
                      onChanged: (value) {
                        if (password!.text != value) {
                          setState(() {
                            password_color = Colors.red;
                          });
                        } else {
                          setState(() {
                            password_color = FlutterFlowTheme.secondaryText;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'กรอกรหัสผ่านตรงนี้',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: password_color,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility2 = !passwordVisibility2,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility2
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (name!.text.length > 0 &&
                        nick_name!.text.length > 0 &&
                        email!.text.length > 0 &&
                        password!.text.length > 0 &&
                        password2!.text.length > 0) {
                      submit();
                    } else {
                      FlutterToastr.show("กรุณากรอกข้อมูลให้ครบถ้วน", context,
                          duration: 2,
                          position: FlutterToastr.bottom,
                          backgroundColor: Colors.red,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ));
                    }
                  },
                  text: 'สมัครสมาชิก',
                  options: FFButtonOptions(
                    width: 285,
                    height: 40,
                    color: FlutterFlowTheme.primaryColor,
                    textStyle: FlutterFlowTheme.subtitle1,
                    elevation: 5,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'มีบัญชี?',
                      style: FlutterFlowTheme.bodyText2,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: GoogleFonts.getFont(
                          'Mitr',
                          color: Color(0xFF00A2FD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
