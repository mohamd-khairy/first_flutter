
import 'package:flutter/material.dart';
import 'package:flutter_with_laravel/Services/api.dart';
import 'package:flutter_with_laravel/Views/dashboard.dart';
import 'package:flutter_with_laravel/Views/register.dart';

class ShowDataPage extends StatefulWidget {

  List list;
  int index;

  ShowDataPage({this.index , this.list });

  @override
  ShowDataPageState createState() => ShowDataPageState();
}
  
class ShowDataPageState extends  State<ShowDataPage> {

  Api api = new Api();
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: widget.list[widget.index]['nameAr'],
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.list[widget.index]['nameAr']),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed:()=> Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => new DashboardPage(title: "dashboard",))
              ),
            )
          ],
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top:62,left:12.0,right:12.0,bottom:12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: Text(widget.list[widget.index]['nameAr'], textAlign: TextAlign.center,overflow: TextOverflow.ellipsis, style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)
              ),
              Padding(padding:  EdgeInsets.only(top:10.0),),
              Container(
                height: 50,
                child: Text(widget.list[widget.index]['nameEn'], textAlign: TextAlign.center,overflow: TextOverflow.ellipsis, style: TextStyle(
                  fontWeight: FontWeight.bold
                ),)
              ),
              Padding(padding:  EdgeInsets.only(top:10.0),),
              Container(
                height: 50,
                child:  FlatButton(
                  onPressed: ()=> Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => new DashboardPage(title:"Dashboard"))
                  ),
                  color: Colors.blue,
                  child:  Text('dashboard' , style:  TextStyle(color: Colors.white , backgroundColor: Colors.blue),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
