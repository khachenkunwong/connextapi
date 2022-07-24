import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:job/mobel/mobel_me_all.dart';
import 'package:job/mobel/model_duty.dart';
import 'package:job/screan/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter flow/flutter_flow_theme.dart';
import '../flutter flow/flutter_flow_widgets.dart';
import '../mobel/mobel_book.dart';
import '../pubilc_/pubilc_.dart';
import 'forgetemail.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? email;
  TextEditingController? password;
  late bool passwordVisibility;
  // late User user = User();
  late Profile duty = Profile();
  late MeAll meAll = MeAll();
  var aa;
  // var withoutme;
  List dutylists = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future notifica() async {
    // Add your function code here!
    FlutterToastr.show("เข้าสู่ระบบเสร็จสิ้น", context,
        duration: 2,
        position: FlutterToastr.bottom,
        backgroundColor: Colors.green,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ));
  }

  submit() async {
    final res = await http.post(
      Uri.parse("$url/api/auth/login"),
      headers: {
        "Accept": "application/json",
        'content-type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      },
      body: convert.jsonEncode({
        "email": email!.text,
        "password": password!.text,
      }),
    );
    print('res: ${res.body}');
    print(res.statusCode);
    if (res.statusCode != 200) {
      FlutterToastr.show("ชื่อผู้ใช้ หรือ รหัสผ่านไม่ถูกต้อง", context,
          duration: 2,
          position: FlutterToastr.bottom,
          backgroundColor: Colors.red,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ));
    } else {
      final data = convert.jsonDecode(res.body);
      print("data = $data");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = data["token"];
      print("token = $token");
      await prefs.setString("auth_token", token);
      FlutterToastr.show("เข้าสู่ระบบเสร็จสิ้น", context,
          duration: 2,
          position: FlutterToastr.bottom,
          backgroundColor: Colors.green,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ));

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
  }

  withOutMe<Profile>() async {
    print("arm");
    // final token = await getToken();
    final res = await http.get(
      Uri.parse("$url/api/group/schedule/without/me"),
      headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*",
        "x-access-token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjp7InN1YiI6IjYyY2QzNTMwMTZlYWFmMjY2NzA2YTVjMSIsInYiOjF9LCJpYXQiOjE2NTg1Mzg3MDYsImV4cCI6MTY1OTE0MzUwNn0.R0M-UJ8MGYFuLGfZF8i5nH4LBl9q9SuroKdh8e6WD_E"
      },
    );
    print('res.statusCode: ${res.statusCode}');
    // print('res.headers: ${res.headers}');
    // print('body = ${res.body}');
    final data = convert.jsonDecode(res.body) as Map<String, dynamic>;
    // print("getProfile: ${data["duty"].length}");
    // print("getProfile: ${data["duty"][1]["_duty"][0]["_user"]}");
    return data;
    // setState(() {
    //   duty = Profile.fromJson(data);
    // });
    // aa = duty.duty![0].duty![0];
    // print("duty: ${aa}");
  }

  scheduleMeAll() async {
    print("arm");
    // final token = await getToken();
    try {
      final res = await http.get(
        Uri.parse("$url/api/group/schedule/me/all"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          "x-access-token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjp7InN1YiI6IjYyY2JjNGU1NDIwYzllMWFmZjJkN2I4MCIsInYiOjF9LCJpYXQiOjE2NTg1NTQ3NDEsImV4cCI6MTY1OTE1OTU0MX0.mdQVZhbTJ7l9e9cI67C0fryKVOJ78D96e3QhuMvwgsI"
        },
      );
      print('res.statusCode: ${res.statusCode}');
      // print('res.headers: ${res.headers}');
      // print('body = ${res.body}');
      final data = convert.jsonDecode(res.body) as List<dynamic>;
      // print("getProfile: ${data["duty"].length}");
      // print("getProfile: ${data["duty"][1]["_duty"][0]["_user"]}");
      // print("data: $data");
      for (var dutylist in data) {
        // list ออกมาทั้ง index
        final _dutylist = MeAll.fromJson(dutylist as Map<String, dynamic>);
        // aa = _dutylist.duty!.first.day;
        // print("_dutylist ${aa}");
        setState(() {
          dutylists.add(_dutylist);
        });
      }
      print("${dutylists[0]}");
    } catch (e) {
      print(e);
    }
    // print("dutylists: $dutylists");
    // setState(() {
    //   meAll = MeAll.fromJson(data);
    // });
    // aa = duty.duty![0].duty![0];
    // print("duty: ${aa}");
  }

  // ทดสอบ
  // Future<List<MeAll>> getmell = getMeall();

  // static Future<List<MeAll>> getMeall() async {
  List data = [];
  late Future<List<dynamic>> getmell;
  late Future<String> getmellpubilc;
  late Future<List<dynamic>> getmellpubilcinclass;
  var _dutylist;
  Future<List<dynamic>> getMeall() async {
    data = [
      {
        "_id": "62d905867fc240f9c3c60a2e",
        "_group": "62d905867fc240f9c3c60a2c",
        "_user": {
          "_id": "62cbc4e5420c9e1aff2d7b80",
          "frist_name": "TEST1",
          "last_name": "TEST2",
          "email": "TEST1@gmail.com",
          "password": "ddddddd",
          "actor": "หัวหน้าพยาบาล",
          "location": "โรงพยาบาลบ้านม่วง",
          "tokenVersion": 1,
          "__v": 0
        },
        "_duty": [
          {
            "_id": "62d800ef9578058f0b2dda08",
            "_user": "62cbc4e5420c9e1aff2d7b80",
            "year": "2022",
            "month": "6",
            "day": "1",
            "group": "AAA-โรงพยาบาลบ้านม่วง",
            "morning": 1,
            "noon": 0,
            "night": 0,
            "count": 1,
            "__v": 0
          }
        ],
        "__v": 0
      },
      {
        "_id": "62d905867fc240f9c3c60a30",
        "_group": "62d905867fc240f9c3c60a2c",
        "_user": {
          "_id": "62cbc4e5420c9e1aff2d7b80",
          "frist_name": "TEST1",
          "last_name": "TEST2",
          "email": "TEST1@gmail.com",
          "password": "ddddddd",
          "actor": "หัวหน้าพยาบาล",
          "location": "โรงพยาบาลบ้านม่วง",
          "tokenVersion": 1,
          "__v": 0
        },
        "_duty": [
          {
            "_id": "62d800f09578058f0b2dda0c",
            "_user": "62cbc4e5420c9e1aff2d7b80",
            "year": "2022",
            "month": "6",
            "day": "3",
            "group": "AAA-โรงพยาบาลบ้านม่วง",
            "morning": 0,
            "noon": 0,
            "night": 0,
            "count": 0,
            "__v": 0
          }
        ],
        "__v": 0
      }
    ];
    return data;
    // return data.map<MeAll>(MeAll.fromJson).toList();
  }

  Future<String> getMeallpubile() async {
    try {
      final res = await http.get(
        Uri.parse("$url/api/group/schedule/me/all"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          "x-access-token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjp7InN1YiI6IjYyY2JjNGU1NDIwYzllMWFmZjJkN2I4MCIsInYiOjF9LCJpYXQiOjE2NTg1NTQ3NDEsImV4cCI6MTY1OTE1OTU0MX0.mdQVZhbTJ7l9e9cI67C0fryKVOJ78D96e3QhuMvwgsI"
        },
      );
      print('res.statusCode: ${res.statusCode}');
      // print('res.headers: ${res.headers}');
      // print('body = ${res.body}');
      // final body = convert.json.decode(res.body);

      // print("getProfile: ${data["duty"].length}");
      // print("getProfile: ${data["duty"][1]["_duty"][0]["_user"]}");
      // print("data: $data");
      return res.body;
    } catch (e) {
      print(e);
    }
    return "";
    // return data.map<MeAll>(MeAll.fromJson).toList();
  }

  Future<List<dynamic>> getMeallpubileinClass() async {
    var test;
    try {
      final res = await http.get(
        Uri.parse("$url/api/group/schedule/me/all"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          "x-access-token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjp7InN1YiI6IjYyY2JjNGU1NDIwYzllMWFmZjJkN2I4MCIsInYiOjF9LCJpYXQiOjE2NTg1NTQ3NDEsImV4cCI6MTY1OTE1OTU0MX0.mdQVZhbTJ7l9e9cI67C0fryKVOJ78D96e3QhuMvwgsI"
        },
      );
      // print('res.statusCode: ${res.statusCode}');
      // print('res.headers: ${res.headers}');
      // print('body = ${res.body}');
      final body = convert.json.decode(res.body);
      // print("body.runtimeType ${body.runtimeType}"); // ตัวนี้เอาออกไปแล้วเอาไปคลาส
      // final body1 = meAllFromJson(res.body);
      // // print(body.first.id);
      // final body2 = meAllToJson(body1);
      // print(body1);
      // ต้องทำเป็น List<dynamic>

      // print("getProfile: ${data["duty"].length}");
      // print("getProfile: ${data["duty"][1]["_duty"][0]["_user"]}");
      // print("data: $data");
      // return body.map<MeAll>(MeAll.fromJson).toList();
      // print("body ${body2.runtimeType}");

      for (var dutylist in body) {
      //   // list ออกมาทั้ง index
        final _dutylist = MeAll.fromJson(dutylist);
      //   // Instance of 'MeAll'
        print(_dutylist);
      //   // aa = _dutylist.duty!.first.day;
      //   // print("_dutylist ${aa}");
      //   setState(() {
      //     dutylists.add(_dutylist);
      //   });
      }
      // _dutylist = MeAll.fromJson(body);
      // print(_dutylist.runtimeType);

      return body;
    } catch (e) {
      print(e);
    }
    return [];
    // return data.map<MeAll>(MeAll.fromJson).toList();
  }

  @override
  void initState() {
    super.initState();
    // withoutme = withOutMe();
    // getmellpubilc = getMeallpubile();
    getmellpubilcinclass = getMeallpubileinClass();
    // getMeallpubileinClass();

    email = TextEditingController(text: "email");
    password = TextEditingController(text: "password");
    passwordVisibility = false;
    // withOutMe();
  }

  @override
  Widget build(BuildContext context) {
    // Create page with scaffold and appbar with textfield and button
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scheduleMeAll();
          },
          child: Icon(Icons.add),
        ),
        body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Align(
              //   alignment: AlignmentDirectional(0, 0),
              //   child: Padding(
              //     padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              //     child: Hero(
              //       tag: 'HosApp',
              //       transitionOnUserGestures: true,
              //       child: Image.asset(
              //         'assets/images/274839699_1333130893857613_7481782092199286452_n_(1).png',
              //         width: 100,
              //         height: 100,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'อีเมล',
                      style: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Mitr',
                        fontSize: 18,
                      ),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'รหัสผ่าน',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Mitr',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: !passwordVisibility,
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
                            color: FlutterFlowTheme.secondaryText,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility
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
                    // ต้องเช็คกับฐานข้อมูล
                    if (email!.text.length > 0 && password!.text.length > 0) {
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
                  text: 'เข้าสู่ระบบ',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    // ต้องเช็คกับฐานข้อมูล
                    notifica();
                    // FlutterToastr.show("กรุณากรอกข้อมูลให้ครบถ้วน", context,
                    //     duration: 2,
                    //     position: FlutterToastr.bottom,
                    //     backgroundColor: Colors.red,
                    //     textStyle: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 16.0,
                    //     ));
                  },
                  text: 'ทดสอบ',
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
              Align(
                alignment: AlignmentDirectional(0.8, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetemailWidget(),
                        ),
                      );
                    },
                    child: Text(
                      'ลืมรหัสผ่าน?',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Mitr',
                        color: Color(0xFF00A2FD),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ยังไม่มีบัญชี?',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Mitr',
                        color: FlutterFlowTheme.secondaryText,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterWidget(),
                          ),
                        );
                      },
                      child: Text(
                        ' ลงทะเบียน',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Mitr',
                          color: Color(0xFF00A2FD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               
              //  ดึง json โดยใช้ .id ได้แล้วหรือก็คือเอาคลาสเข้า
              Container(
                width: 1000,
                height: 100,
                child: FutureBuilder<List<dynamic>>(
                    future: getmellpubilcinclass,
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        print("snapshot.data ${snapshot.data}");
                        print(snapshot.data.runtimeType);
                        // var newData =
                        //   convert.json.decode(snapshot.data.toString());
                        
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = snapshot.data![index];
                            // print("data $data");
                            //  final _dutylist = MeAll.fromJson(dutylist);
                            var data1 = MeAll.fromJson(data);
                            return Text("test ${data1.user!.email}");
                          },
                        );
                      }
                      return const CircularProgressIndicator();
                    })),
              )

              // วิธี การดึงมาใช้โดยไม่ผ่านคลาศ
              // Container(
              //   width: 1000,
              //   height: 100,
              //   child: FutureBuilder(
              //     future: getmellpubilc,
              //     builder: ((context, snapshot) {
              //       // มันเป็น type string ทั้งหมดเลยเอามาแปลง
              //       print(snapshot.data);
              //       var newData = convert.json.decode(snapshot.data.toString());
              //       print(newData);
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //           itemCount: newData.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             print('arm');
              //             return Text("test ${newData[index]["_user"]["frist_name"]}");
              //           },
              //         );
              //       }
              //       return Text("กำลังโหลด");
              //     }),
              //   ),
              // ),

              // for (var i in dutylists) Text("${i}")
              // ดึงได้แล้วแบบดึงจาก json ทีสมมุดขึ้นมาเอง type list dynamic
              // Container(
              //   width: 1000,
              //   height: 100,
              //   child: FutureBuilder<List<dynamic>>(
              //       future: getmell,
              //       builder: ((context, snapshot) {
              //         if (snapshot.hasData) {
              //           print(snapshot.data.runtimeType);
              //           // var newData =
              //           //   convert.json.decode(snapshot.data.toString());
              //           return ListView.builder(
              //             itemCount: snapshot.data!.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               return Text(
              //                   "test ${snapshot.data![index]["_user"]["frist_name"]}");
              //             },
              //           );
              //         }
              //         return const CircularProgressIndicator();
              //       })),
              // )

              // ตัวนี้ทำได้แล้ว แบบดึง ไฟล์ json
              // Container(
              //   width: 1000,
              //   height: 100,
              //   child: FutureBuilder(
              //     future: DefaultAssetBundle.of(context)
              //         .loadString('assets/loadjson/details.json'),
              //     builder: ((context, snapshot) {
              //     มันเป็น type string ทั้งหมดเลยเอามาแปลง
              //       var newData = convert.json.decode(snapshot.data.toString());
              //       print(newData);
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //           itemCount: newData.length,
              //           itemBuilder: (BuildContext context, int index) {
              //             print('arm');
              //             return Text("test ${newData[index]["title"]}");
              //           },
              //         );
              //       }
              //       return Text("กำลังโหลด");
              //     }),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
class Employee1 {
  Employee1(this.name, this.morning, this.afternoon, this.night);
  final String name;
  final String morning;
  final String afternoon;
  final String night;
}