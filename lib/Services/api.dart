import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {

  String baseUrl = "https://reqres.in/api/";

  var status;
  var token;

  login(String email ,String password) async {

    final res = await http.post(baseUrl + "login",
    headers: {
      "Accept" : "application/json",
    },
    body: {
      "email":"$email",
      "password":"$password",
    });

    status = res.body.contains('error');

    var data = json.decode(res.body);

   // if(status){
   // }else{
      print(data['token']);
      _save(data['token']);
   // }
  }


  register(String email , String password) async {

    final res = await http.post(baseUrl + 'register' ,
    headers: {
      "Accept":"application/json",
    },
    body: {
      "email":"$email",
      "password":"$password"
    });
    status = res.body.contains('error');

    var data = json.decode(res.body);

    _save(data['token']);
    
  }





Future<List> getData() async {

    http.Response res = await http.get('http://apps.orchtech.com:81/law5/api/section');
     return json.decode(res.body);

}



  _save(String token) async{
    final prefs = await SharedPreferences.getInstance();
    final key = "token";
    final value = token;
    prefs.setString(key, value);
  }

   read() async{
    final prefs = await SharedPreferences.getInstance();
    final key = "token";
    final value = prefs.get(key) ?? 0;
    print('token: $value');

  }

}
