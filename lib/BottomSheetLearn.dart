// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ui_flutter/common/Logger.dart';

class BottomSheetlearn extends StatefulWidget {
  const BottomSheetlearn({super.key});
  @override
  State<BottomSheetlearn> createState() => _BottomsheetlearnState();
}

class _BottomsheetlearnState extends State<BottomSheetlearn> {
  String content = 'Hello world';
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
              'BottomSheet',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                //trong Expanded co flex giong nhu chiem weight trong Row, Column in JP (chia ti ly)
                child: Center(child: Text(content)),
              ),
              _buttomShow(
                title: 'Show BottomSheet',
                onClick: ([state]) {
                  //show bottom sheet va tuong tac realtime
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    builder: (contextOfSheet) {
                      int cnt = 0;
                      return StatefulBuilder(
                        builder: (context, sheetState) {
                          return SafeArea(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text('Hello world $cnt'),
                                    ),
                                  ),

                                  _buttomShow(
                                    title: 'Up',
                                    onClick: ([state]) {
                                      Logger.logTest(
                                        tag: 'Test',
                                        msg: 'Clicked on sheet $cnt',
                                      );
                                      // cnt++;//cnt se khong thay doi
                                      sheetState(
                                        () => cnt++,
                                      ); //thay doi content ben trong sheet
                                      updateContent(
                                        newVal: 'Dinh Van Hoa',
                                      ); //update content ben ngoai sheet
                                    },
                                  ),
                                  // SizedBox(height: 20),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),

              _buttomShow(
                title: 'Show AlertDialog',
                color: Colors.greenAccent,
                onClick: ([state]) async {
                  bool result =
                      await _showDialogConfirm(
                        context: context,
                        title: 'Are you sure',
                        confirm: 'Delete database',
                      ) ??
                      false;

                  if (result == true) {
                    Logger.logTest(tag: 'Yes', msg: 'User clicked Yes');
                  } else {
                    Logger.logError(tag: 'No', msg: 'User clicked No');
                  }
                },
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  //func update data content
  void updateContent({required String newVal}) {
    setState(() => content = newVal);
  }

  //func show dialog
  Future<bool?> _showDialogConfirm({
    required BuildContext context,
    required String title,
    required String confirm,
  }) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext contextOfDialog) {
        return AlertDialog(
          title: Text(title),
          backgroundColor: Colors.white,
          // contentPadding: EdgeInsets.all(5),
          content: Text(confirm),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(
                  contextOfDialog,
                  false,
                ); //vua an dialog vua truyen noi dung ra ngoai
              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(
                  contextOfDialog,
                  true,
                ); //vua an dialog vua truyen noi dung ra ngoai
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
          ],
        );
      },
    );
  }

  //button elevated
  Container _buttomShow({
    required String title,
    Color color = Colors.pinkAccent,
    required void Function([String? state])
    onClick, //cach khai bao 1 higer order func cho pheps nhan 1 or ko phuong thuc
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
      // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: ElevatedButton(
        onPressed: () => onClick('Clicked'),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          shape: WidgetStatePropertyAll(
            const RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
            ),
          ),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return 2;
            return 5;
          }),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}




                  // //show bottom sheet
                  // showModalBottomSheet(
                  //   context: context,
                  //   // isDismissible: false,//mac dinh la true (neu de false thi nhan ra ngoai se ko mat)
                  //   // barrierColor: Colors.pink,: mau nen ngoai khi sheet hien thi,
                  //   // isScrollControlled: true,//dieu chinh cao chiem het chieu cao man hinh
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.vertical(
                  //       top: Radius.circular(16),
                  //     ),
                  //   ),
                  //   builder: (BuildContext contextOfSheet) {
                  //     return Center(
                  //       child: Container(
                  //         padding: EdgeInsets.all(10),
                  //         child: Text('Sheet showed'),
                  //       ),
                  //     );
                  //   },
                  // );

