import 'package:flutter/material.dart';
import 'package:ui_flutter/common/Logger.dart';
import 'package:ui_flutter/common/constants/app_assets.dart';
import 'package:ui_flutter/common/constants/app_strings.dart';
import 'package:ui_flutter/common/styles/app_styles.dart';
import 'package:ui_flutter/common/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passwd = TextEditingController();
  bool isVisiblePasswd = true;
  IconData iconVisible = Icons.visibility_off_outlined;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //background image
            SizedBox(
              width: size.width,
              height: size.height,
              // clipBehavior: Clip.antiAlias,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(200),
              //   ),
              // ),
              child: Image.asset('assets/images/bg.png', fit: BoxFit.fill),
            ),
            Positioned(
              top: size.height * 0.15,
              left: 0, //het ben trai
              right: 0, //het ben phai
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          loginText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 50),

                    Container(
                      margin: EdgeInsetsDirectional.only(start: 16, end: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withValues(alpha: 0.8),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.check_circle,
                              color: const Color.fromARGB(255, 38, 222, 44),
                            ),
                          ),
                          hintText: hintEmailForm,
                          filled: true, //cai nay se ket hop vs mau ben duoi
                          fillColor: Colors.white,
                          enabledBorder: boderTextField,
                          focusedBorder: boderTextField,
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    Container(
                      margin: EdgeInsetsDirectional.only(start: 16, end: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withValues(alpha: 0.8),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _passwd,
                        obscureText: isVisiblePasswd,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: hintPasswdForm,
                          filled: true, //cai nay se ket hop vs mau ben duoi
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.verified),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisiblePasswd = !isVisiblePasswd;
                                  if (isVisiblePasswd == true) {
                                    //dang hide
                                    iconVisible = Icons.visibility_off_outlined;
                                  } else {
                                    iconVisible = Icons.visibility_outlined;
                                  }
                                });
                              },
                              icon: Icon(iconVisible),
                            ),
                          ),
                          enabledBorder: boderTextField,
                          focusedBorder: boderTextField,
                        ),
                      ),
                    ),

                    SizedBox(height: 60),
                    //login button
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pinkAccent.withValues(alpha: 0.8),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          String email = _email.text;
                          String passwd = _passwd.text;
                          Logger.logTest(tag: 'Test', msg: '$email $passwd');
                        },
                        style: baseElevatedButtonStyle.copyWith(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.pinkAccent,
                          ),
                          padding: WidgetStatePropertyAll(
                            const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
                            ),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          forgotPasswd,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: 2,
                            color: Colors.black12,
                          ),
                          Text(
                            'or connect with',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            width: size.width * 0.25,
                            height: 2,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    //login by other method
                    otherMethod(),

                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //phuong thuc login khac
  Row otherMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //login by facebook
        btnHaveIcon(
          imageLink: fbImageLinkAssets,
          textButton: 'Facebook',
          onClick: () {
            Logger.logTest(tag: 'Test', msg: 'Login by facebook');
          },
        ),
        //login by google
        btnHaveIcon(
          imageLink: ggImageLinkAssets,
          textButton: 'Google',
          onClick: () {
            Logger.logTest(tag: 'Test', msg: 'Login by google');
          },
        ),
      ],
    );
  }
}
