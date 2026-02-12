import 'package:flutter/material.dart';
import 'package:ui_flutter/Day_3_learn_UI/location_model.dart';
import 'package:ui_flutter/common/styles/app_styles.dart';

class LocationDetail extends StatefulWidget {
  final String idTag;
  const LocationDetail({super.key, required this.idTag});
  //day la class widget
  @override
  State<LocationDetail> createState() => _LocationDetailState();
}

final List<String> avatars = [
  'assets/images/aa.png',
  'assets/images/ab.jpeg',
  'assets/images/as.jpeg',
  'assets/images/bb.webp',
  'assets/images/cd.jpeg',
];

// final des =
//     'At dawn, the Eiffel Tower in Paris becomes a spectacle of beauty as the sun rises behind its iconic silhouette, casting a warm glow over the cityscape.If you want to enjoy more then you need to visit this all place.';

//day la class state
class _LocationDetailState extends State<LocationDetail> {
  bool isMark = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final String tag = widget.idTag; //idTag truyen tu home_page qua
    final int index = int.tryParse(tag) ?? 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
              ),
              Column(
                children: [
                  //nua ui ben tren
                  Container(
                    width: size.width,
                    height: size.height * 0.55,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFFFBFB), Color(0XFFF3ECEE)],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80),
                              ),
                              image: DecorationImage(
                                image: AssetImage(locationItems[index].image),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0, //gan vao top
                          left: 0,
                          right: 0,
                          bottom: size.height * 0.14, //cach day 0.14
                          child: SafeArea(
                            bottom: false,
                            child: Container(
                              width: size.width,
                              height: double.infinity,
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    child: appBarPage(
                                      onBack: () {
                                        Navigator.pop(context); //back ve home
                                      },
                                      onMark: () {
                                        setState(() {
                                          isMark = !isMark;
                                        });
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          locationItems[index].name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              locationItems[index].address,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          //cach top 43% chieu cao man hinh
                          top: size.height * 0.43,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80),
                                topRight: Radius.circular(80),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFFFFBFB), Color(0XFFF3ECEE)],
                              ),
                            ),
                            //locationInformation
                            child: locationInformation(
                              size: size,
                              index: index,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //nua ui ben duoi
                  Expanded(
                    child: Stack(
                      children: [
                        //background
                        Container(
                          width: size.width,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFFFBFB), Color(0XFFF3ECEE)],
                            ),
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: double.infinity,
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 16,
                            right: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(80),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //recommended
                                Row(
                                  children: [
                                    avatarStack(avatars: avatars),
                                    SizedBox(width: 20),
                                    Text('Recommended', style: textStyle),
                                  ],
                                ),
                                Text('Description', style: textStyle),
                                //description
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        //co scroll
                                        locationItems[index].description,
                                        style: textStyle.copyWith(
                                          fontSize: 16,
                                          color: Colors.pinkAccent.withValues(
                                            alpha: 0.6,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //book and pay
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Container(
                            color: Colors.white,
                            child: SafeArea(
                              top: false,
                              bottom: true,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //price
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                r'$ ' +
                                                locationItems[index].price
                                                    .toString(),
                                            style: TextStyle(
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '/per one',
                                            style: TextStyle(
                                              color: Colors.pink,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 50),
                                    //payment
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                Colors.pinkAccent,
                                              ),
                                          padding: WidgetStatePropertyAll(
                                            const EdgeInsets.symmetric(
                                              vertical: 16,
                                              horizontal: 20,
                                            ),
                                          ),
                                          elevation:
                                              WidgetStateProperty.resolveWith((
                                                states,
                                              ) {
                                                if (states.contains(
                                                  WidgetState.pressed,
                                                )) {
                                                  return 2;
                                                }
                                                return 4;
                                              }),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Book Now',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
    );
  }

  //stack avatar
  Row avatarStack({required List<String> avatars}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 6),
        for (int i = 0; i < avatars.length; i++)
          Align(
            widthFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 0),
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(avatars[i]),
              ),
            ),
          ),
        Align(
          widthFactor: 0.6,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purpleAccent,
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              '36+',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container locationInformation({required Size size, int index = 0}) {
    return Container(
      width: size.width,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          chipInfo(
            icon: Icons.star_rate_rounded,
            data: locationItems[index].rating.toString(),
            colorIcon: Colors.greenAccent,
            colorText: Colors.greenAccent,
          ),
          chipInfo(
            icon: Icons.cloud,
            data: locationItems[index].temperature.toString(),
            colorIcon: Colors.blue.withValues(alpha: 0.5),
            colorText: Colors.blue.withValues(alpha: 0.5),
          ),
          chipInfo(
            icon: Icons.access_time_filled,
            data: '${locationItems[index].time}Days',
            colorIcon: Colors.purpleAccent.withValues(alpha: 0.4),
            colorText: Colors.purpleAccent.withValues(alpha: 0.4),
          ),
        ],
      ),
    );
  }

  Row chipInfo({
    required IconData icon,
    required String data,
    required Color colorIcon,
    required Color colorText,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: colorIcon),
        SizedBox(width: 5),
        Text(
          data,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colorText,
          ),
        ),
      ],
    );
  }

  //back and mark (app bar)
  Row appBarPage({required Function onBack, required Function onMark}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            onBack();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 30,
            color: Colors.white70,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white38,
          ),
          child: IconButton(
            onPressed: () {
              onMark();
            },
            icon: Icon(
              isMark == false ? Icons.bookmark_border : Icons.bookmark,
              size: 30,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
