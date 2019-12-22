import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_with_laravel/Views/dashboard.dart';
import 'package:flutter_with_laravel/Views/login.dart';
import 'package:flutter_with_laravel/Views/register.dart';
import 'package:http/http.dart' as http;

void main() async{ 
  List data = await getData();
  //  List data = await login();
   print(data); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Flutter App',),
      routes: <String,WidgetBuilder>{
        '/dashboard' : (BuildContext context) => new DashboardPage(title:"flutter App"),
        '/login' : (BuildContext context) => new LoginPage(title:"flutter App"),
        '/register' : (BuildContext context) => new RegisterPage(title:"flutter App"),
      },
    );
  }
}

Future<List> getData() async {

  
  String baseUrl = "http://apps.orchtech.com:81/law5/api/";

  http.Response res = await http.get(baseUrl + 'section');
  return json.decode(res.body);
}

Future<List> login() async {
  String baseUrl = "http://apps.orchtech.com:81/law5/api/";

  http.Response res = await http.post(baseUrl + 'login' , 
  headers: {
    "Accept":"application/json",
  },
  body: { 
    "email":"admin@example.com",
    "password":"password",
    "trustToken":null
  });
  return json.decode(res.body);
}