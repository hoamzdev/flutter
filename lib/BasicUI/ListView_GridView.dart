// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ui_flutter/common/Logger.dart';

class ListviewGridview extends StatefulWidget {
  const ListviewGridview({super.key});
  @override
  State<ListviewGridview> createState() => _ListviewGridviewState();
}

class _ListviewGridviewState extends State<ListviewGridview> {
  List<String> fruits = ['Orange', 'Apple', 'Mango', 'Banana'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'List and Grid view',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 10),
          width: double.infinity,
          child: GridView.builder(
            itemCount: fruits.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              // childAspectRatio: 3 / 2, //rong / cao
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Center(child: Text(fruits[index])),
              );
            },
          ),
        ),
      ),
    );
  }

  Card cardItem({required String title, required String subtitle}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.star, color: Colors.pinkAccent),
        onTap: () {
          Logger.logTest(tag: "CARD", msg: "on tap card");
        },
        //tat ripple
        // splashColor: Colors.transparent,
        // hoverColor: Colors.transparent,
      ),
    );
  }
}

/*
ListView binh thuong
          child: ListView(
            children: [
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
              cardItem(title: 'Hello world', subtitle: 'hoamz'),
            ],
          ),


ListView.builder()
          child: ListView.builder(
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              return cardItem(title: fruits[index], subtitle: 'hoamz');
            },
          ),    


GridView binh thuong
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // mainAxisSpacing: 10,huong ngang
              // crossAxisSpacing: 50,huong thang dung
              childAspectRatio: 3 / 2, //ty le item cao 2 rong 3
            ),
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Center(child: Text('Hello world')),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Center(child: Text('Hello world')),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Center(child: Text('Hello world')),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Center(child: Text('Hello world')),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Center(child: Text('Hello world')),
              ),
            ],
          ),                
*/
