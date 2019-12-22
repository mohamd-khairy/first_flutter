import 'package:flutter/material.dart';
import 'package:flutter_with_laravel/Services/api.dart';
import 'package:flutter_with_laravel/Views/login.dart';
import 'package:flutter_with_laravel/Views/showdata.dart';

class DashboardPage extends StatefulWidget {

  DashboardPage({Key key , this.title }) : super(key : key);
  final String title;

  @override
  DashboardPageState createState() => DashboardPageState();
}
  
class DashboardPageState extends  State<DashboardPage> {

  Api api = new Api();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=> Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => new DashboardPage(title:"dashboard"))
          ),
        ),
        body: FutureBuilder<List>(builder: (context,snapshot){
          if(snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData? ItemList(list:snapshot.data):
                    Center( child: CircularProgressIndicator(),);
                  },
          future: api.getData(),
        )
      ),
    );
  }
}
          
class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null? 0 : list.length,
      itemBuilder: (context ,i){
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap:  ()=> Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => new ShowDataPage(list:list , index:i))
            ),
            child: Card(child: ListTile(
              title: Text(list[i]['nameEn']),
              leading: Icon(Icons.apps),
              subtitle:  Text("price : ${list[i]['nameAr']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
