import 'package:flutter/material.dart';

class DropDownLearn extends StatefulWidget {
  const DropDownLearn({super.key});

  @override
  State<DropDownLearn> createState() => _DropDownLearnState();
}

class _DropDownLearnState extends State<DropDownLearn> {
  String valSelected = 'A';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'DropDown',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              // height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.greenAccent),
              ),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: DropdownButton<String>(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(15),
                  // underline: SizedBox(),
                  icon: Icon(Icons.downhill_skiing),
                  // dropdownColor: Colors.transparent,
                  value: valSelected,
                  onChanged: (String? newVal) {
                    if (newVal != null) {
                      setState(() {
                        valSelected = newVal;
                      });
                    }
                  },
                  items: <String>['A', 'B', 'C', 'D']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text(value),
                          ),
                        );
                      })
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
