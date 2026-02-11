// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ui_flutter/BasicUI/TextButton_ElevatedButton.dart';
import 'package:ui_flutter/common/Logger.dart';

class DismissibleMy extends StatefulWidget {
  const DismissibleMy({super.key});

  @override
  State<DismissibleMy> createState() => _DismissibleMyState();
}

class _DismissibleMyState extends State<DismissibleMy> {
  List<String> fruits = ['hoa', 'hoa hoa', 'dinh van hoa', 'dinh hoa'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dismissible',
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
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                //view giua cac item
                return SizedBox(height: 10);
              },
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                final fruit = fruits[index];
                return Slidable(
                  key: Key(fruit), //text muon hien thi nen item
                  //vuot sang ben phai se thay view nay
                  startActionPane: ActionPane(
                    extentRatio: 0.18,
                    motion: DrawerMotion(),
                    children: [
                      //cac view item ben trong
                      CustomSlidableAction(
                        onPressed: (context) {
                          Logger.logError(tag: "CLICKED", msg: 'slide');
                        },
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  //end action
                  //view khi vuot sang trai
                  endActionPane: ActionPane(
                    extentRatio: 0.18,
                    motion: DrawerMotion(),
                    children: [
                      CustomSlidableAction(
                        onPressed: (context) {
                          Logger.logError(tag: "CLICKED", msg: 'slide');
                        },
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    //view hien thi ban dau
                    width: double.infinity,
                    height: 40,
                    color: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    // margin: EdgeInsets.only(top: 10),
                    child: Text(
                      fruits[index],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Dismissible dismissible_test(String fruit, int index) {
    return Dismissible(
      key: Key(fruit),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          appSnackbar(
            text: 'Left to right',
            snackbarAction: SnackBarAction(
              backgroundColor: Colors.deepPurple,
              label: 'Dismissible',
              onPressed: () {
                Logger.logTest(tag: "Click", msg: 'line 54');
              },
            ),
          );
        } else {
          appSnackbar(
            text: 'Left to right',
            snackbarAction: SnackBarAction(
              backgroundColor: Colors.cyanAccent,
              label: 'Dismissible',
              onPressed: () {
                Logger.logTest(tag: "Click", msg: 'line 54');
              },
            ),
          );
        }
        return false;
      },
      //left
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        child: Icon(Icons.favorite, color: Colors.white),
      ),
      //right
      secondaryBackground: Container(
        color: Colors.greenAccent,
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: Colors.red),
      ),
      child: Card(child: ListTile(title: Text(fruits[index]))),
    );
  }
}
