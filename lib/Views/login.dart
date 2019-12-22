
import 'package:flutter/material.dart';
import 'package:flutter_with_laravel/Services/api.dart';
import 'package:flutter_with_laravel/Views/register.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key key , this.title }) : super(key : key);
  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}
  
class LoginPageState extends  State<LoginPage> {

  Api api = new Api();
  String msgStatus = " ";

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty && _passwordController.text.trim().isNotEmpty){
        api.login(_emailController.text.trim().toLowerCase(),  _passwordController.text.trim()).whenComplete((){
          if(api.status){
            _showDialog();
            msgStatus = "email or password is wrong";
          }else{
            Navigator.pushReplacementNamed(context, '/dashboard');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top:62,left:12.0,right:12.0,bottom:12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'email',
                    hintText: 'place your email',
                    icon:  Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                height: 50,
                child:  TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'place your password',
                    icon:  Icon(Icons.vpn_key),
                  ),
                ),
              ),
              Padding(padding:  EdgeInsets.only(top:44.0),),
              Container(
                height: 50,
                child:  RaisedButton(
                  onPressed: _onPressed,
                  color: Colors.blue,
                  child:  Text('Login' , style:  TextStyle(color: Colors.white , backgroundColor: Colors.blue),),
                ),
              ),
              Padding(padding:  EdgeInsets.only(top:44.0),),
              Container(
                height: 50,
                child: Text("$msgStatus", textAlign: TextAlign.center,overflow: TextOverflow.ellipsis, style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)
              ),
              Padding(padding:  EdgeInsets.only(top:10.0),),
              Container(
                height: 50,
                child:  FlatButton(
                  onPressed: ()=> Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => new RegisterPage(title:"flutter app"))
                  ),
                  color: Colors.blue,
                  child:  Text('reqister' , style:  TextStyle(color: Colors.white , backgroundColor: Colors.blue),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _showDialog(){
    showDialog(){
      context : context;
      builder:(BuildContext context){
        return AlertDialog(
          title: Text('Failed'),
          content: Text('check your email or password'),
          actions: <Widget>[
            RaisedButton(
              child: Text('closed'),
              onPressed: (){Navigator.of(context).pop();},
            )
          ],
        );
      };
    }
  }

}
