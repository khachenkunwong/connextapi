import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job/screan/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter flow/flutter_flow_theme.dart';
import '../mobel/mobel_book.dart';
import '../pubilc_/pubilc_.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController? name;
  TextEditingController? nick_name;
  late User user = User();
  final List<User> books = [];

  updateFristName() async {
    final token = await getToken();
    final update_frist_name = await http.patch(
      Uri.parse("$url/api/me/profile"),
      headers: {'content-type': 'application/json', "x-access-token": "$token"},
      body: convert.jsonEncode({
        "frist_name": name!.text,
      }),
    );
    print('update_frist_name.body: ${update_frist_name.body}');
  }

  updateLastName() async {
    final token = await getToken();
    await http.patch(
      Uri.parse("$url/api/me/profile"),
      headers: {'content-type': 'application/json', "x-access-token": "$token"},
      body: convert.jsonEncode({
        "last_name": nick_name!.text,
      }),
    );
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");
    return token;
  }

  getProfile() async {
    final token = await getToken();
    final res = await http.get(
      Uri.parse("$url/api/me/profile"),
      headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*",
        "x-access-token": "${token}"
      },
    );
    print('res.statusCode: ${res.statusCode}');
    print('res.headers: ${res.headers}');
    print('body = ${res.body}');
    final data = convert.jsonDecode(res.body) as Map<String, dynamic>;
    print("getProfile: ${data}");
    setState(() {
      user = User.fromJSON(data);
    });
  }

  createTable() async {
    final token = await getToken();
    final create_table = await http.post(
      Uri.parse("$url/api/schedule/create"),
      headers: {
        'content-type': 'application/json',
        // "x-access-token": "${token}"
      },
    );
    print('create_table: ${create_table.body}');
  }

  getSchedule() async {
    await createTable();
    final token = await getToken();
    final get_table = await http.get(
      Uri.parse("$url/api/schedule/me/all"),
      headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*",
        "x-access-token": "${token}"
      },
    );
    print('get_table: ${get_table.body}');
  }

  logout() async {
    final token = await getToken();
    final logout1 = await http.delete(
      Uri.parse("$url/api/auth/logout"),
      headers: {
        'content-type': 'application/json',
        "x-access-token": "${token}"
      },
    );
    print('logout1.statusCode: ${logout1.statusCode}');
    print('logout1.body: ${logout1.body}');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("auth_token");

    print("token end = $token");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  withOutMe() async {
    // final token = await getToken();
    final res = await http.get(
      Uri.parse("$url/api/me/profile"),
      headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*",
        "x-access-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjp7InN1YiI6IjYyY2QzNTMwMTZlYWFmMjY2NzA2YTVjMSIsInYiOjF9LCJpYXQiOjE2NTg1Mzg3MDYsImV4cCI6MTY1OTE0MzUwNn0.R0M-UJ8MGYFuLGfZF8i5nH4LBl9q9SuroKdh8e6WD_E"
      },
    );
    print('res.statusCode: ${res.statusCode}');
    print('res.headers: ${res.headers}');
    print('body = ${res.body}');
    final data = convert.jsonDecode(res.body) as Map<String, dynamic>;
    print("getProfile: ${data}");
    setState(() {
      user = User.fromJSON(data);
    });
  }

  @override
  void initState() {
    super.initState();
    // getSchedule();
    withOutMe();

    // getProfile();
    name = TextEditingController(text: "432");
    nick_name = TextEditingController(text: "500");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
            child: Hero(
              tag: 'profile',
              transitionOnUserGestures: true,
              child: Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://picsum.photos/seed/180/600',
                ),
              ),
            ),
          ),
          TextFormField(
            controller: name,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'ชื่อ',
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
          TextFormField(
            controller: nick_name,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'นามสกุล',
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
          ElevatedButton(
              onPressed: () {
                updateFristName();
                updateLastName();
              },
              child: Text('อัพเดทข้อมูล')),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              'นาย Jonh liam',
              style: FlutterFlowTheme.title3,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Text(
              'คณะแพทยศาสตร์ มหาวิทยาลัยพะเยา',
              style: FlutterFlowTheme.title3,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Text(
              'สาขา วิชาเวชกิจฉุกเฉิน',
              style: FlutterFlowTheme.title3,
            ),
          ),
        ],
      )),
    );
  }
}
