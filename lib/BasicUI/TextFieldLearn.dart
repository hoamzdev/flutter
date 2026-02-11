import 'package:flutter/material.dart';
import 'package:ui_flutter/common/Logger.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final TextEditingController _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TextField',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true, //cho phep column co dan
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: _myController,
                          keyboardType: TextInputType.emailAddress,
                          textAlignVertical: TextAlignVertical.center,
                          textInputAction:
                              TextInputAction.done, //nut oke tren ban phim ao
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.pink),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _myController.clear(); //clear all text
                              },
                              icon: Icon(Icons.clear, color: Colors.grey),
                            ),
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              //vien luc binh thuong
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        Logger.logTest(tag: 'pressed', msg: 'clicked');
                        String text = _myController.text.toString();
                        Logger.logTest(tag: 'Clicked', msg: text);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.pinkAccent,
                        ),
                        padding: WidgetStatePropertyAll(
                          const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 15,
                          ),
                        ),
                        shape: WidgetStatePropertyAll(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        elevation: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.pressed)) {
                            return 2;
                          }
                          return 6;
                        }),
                      ),
                      child: Text(
                        'Check',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
