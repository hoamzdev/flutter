// ignore_for_file: file_names

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PullToReFresh extends StatefulWidget {
  const PullToReFresh({super.key});

  @override
  State<PullToReFresh> createState() => _PullToReFreshState();
}

class _PullToReFreshState extends State<PullToReFresh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomRefreshIndicator(
          offsetToArmed:
              150, //khi keo xuong den day -> tha tay -> bat dau chay vao onRefresh
          onRefresh: () async {
            await Future.delayed(
              const Duration(seconds: 2),
            ); //gia dinh call API ...
          },
          builder: (context, child, controller) {
            // child: chinh la listView
            //controller cho biet dang keo dc bao nhieu(value)
            //dang o trang thai gi
            return AnimatedBuilder(
              animation:
                  controller, //quan sat su thay doi cua controller -> moi khi controller thay doi -> build ben trong thay doi theo
              builder: (context, _) {
                double lottieHeight =
                    controller.value *
                    150; //ti le chieu cao cua lottie se ti le thuan vs chieu cao da keo dc
                //controller.value : co gia tri tu 0.0(chua keo) -> (1.0) keo xong
                return Column(
                  children: [
                    // Cái vùng Lottie này sẽ đẩy cái List xuống dưới một cách tự nhiên
                    Container(
                      height: lottieHeight,
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Center(
                        child: Lottie.asset(
                          'assets/images/refresh.json',
                          // Ép frame Lottie chạy theo tay cho mượt
                          controller: controller.isLoading
                              ? null
                              : AlwaysStoppedAnimation(
                                  controller.value.clamp(
                                    0.0,
                                    1.0,
                                  ), //giu gia tri bat buoc trnog doan [0.0,1.0]
                                ),
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Danh sách bên dưới, dùng Expanded để nó chiếm hết chỗ còn lại
                    Expanded(child: child),
                  ],
                );
              },
            );
          },
          child: ListView.builder(
            // const BouncingScrollPhysics(),//cho phep keo qua tay > 150
            physics: const ClampingScrollPhysics(), //cho phep keo qua tay = 150
            itemCount: 35,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Dinh Van Hoa',
                  style: TextStyle(color: Colors.red),
                ),
                leading: Icon(Icons.abc_outlined),
              );
            },
          ),
        ),
      ),
    );
  }
}
