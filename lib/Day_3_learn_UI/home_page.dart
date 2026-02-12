import 'package:flutter/material.dart';
import 'package:ui_flutter/Day_3_learn_UI/location_detail.dart';
import 'package:ui_flutter/Day_3_learn_UI/location_model.dart';
import 'package:ui_flutter/common/Logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedTab = 0;

//list tabLabel
final List<String> nameTabLabels = [
  'Best nature',
  'Most viewed',
  'Recommend',
  'Newly discover',
  'Peace',
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              //gia su day la widget chua backgroud(thi ko nen boc SafeArea o dau -> tao vach den -< xau , mat anh)
              Container(
                width: size.width,
                height: size.height,
                color: Colors.white,
              ),

              Container(
                width: size.width,
                height: size.height * 0.5,
                padding: EdgeInsets.only(top: 10, left: 16, right: 16),
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
              ),
              //nen boc SafeArea o ngoai widget chua noij dung
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.7,
                      padding: EdgeInsets.only(top: 10, left: 16, right: 16),
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
                      child: Column(
                        children: [
                          //appbar
                          appBar(onClickMenu: () {}, onClickSearch: () {}),
                          SizedBox(height: 50),
                          //text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                ' Discover',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          optionTabs(
                            size: size,
                            onSelectTab: (label) {
                              Logger.logTest(tag: 'Test', msg: label);
                            },
                          ),
                          optionLocation(
                            size: size,
                            onClickItem: (idTag) {
                              Logger.logTest(tag: 'Test', msg: 'Clicked');
                              //qua man hinh detail
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    //return man hinh muon den
                                    return LocationDetail(idTag: idTag);
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    //layout bottom
                    Expanded(
                      child: Stack(
                        children: [
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
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(70),
                              ),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.only(
                              left: 26,
                              right: 26,
                              top: 20,
                              bottom: 10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Popular Categories',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        //onClick see all
                                        Logger.logTest(
                                          tag: 'Test',
                                          msg: 'See all',
                                        );
                                      },
                                      child: Text(
                                        'See All',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: const Color.fromARGB(
                                            255,
                                            169,
                                            151,
                                            158,
                                          ),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    optionPopularCategory(
                                      iconLink: 'assets/images/beach.png',
                                      label: 'Beach',
                                      colorBackground: const Color(0xFFF8CDEC),
                                      onClick: () {},
                                    ),
                                    optionPopularCategory(
                                      iconLink: 'assets/images/camping.png',
                                      label: 'Camping',
                                      colorBackground: const Color(0xFF9ED2F7),
                                      onClick: () {},
                                    ),
                                    optionPopularCategory(
                                      iconLink: 'assets/images/car.png',
                                      label: 'Car',
                                      colorBackground: const Color(0xFfcbb8ef),
                                      onClick: () {},
                                    ),
                                    optionPopularCategory(
                                      iconLink: 'assets/images/food.png',
                                      label: 'Food',
                                      colorBackground: const Color(0xFFFacdcc),
                                      onClick: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //lua chon list pho bien
  Column optionPopularCategory({
    required String iconLink,
    required String label,
    required Color colorBackground,
    required Function onClick,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            //when click popular categories
            onClick();
          },
          child: CircleAvatar(
            radius: 35, //ban kinh cua circle -> duong kinh = 80
            backgroundColor: colorBackground,
            child: Image.asset(
              iconLink,
              color: Colors.white,
              height: 40, //chieu cao cua child = 50 -> padding all = 15
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(255, 169, 151, 158),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  //lua con dia diem
  Expanded optionLocation({
    required Size size,
    required Function(String id) onClickItem,
  }) {
    return Expanded(
      child: ListView.builder(
        itemCount: locationItems.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal, //cuon ngang
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.6, //chieu ngang
            height: double
                .infinity, //chieu cao(chiem het chieu cao cua column con lai)
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Hero(
              tag: locationItems[index].id,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: 10,
                    //chiem het dien tich cua stack
                    child: GestureDetector(
                      onTap: () => onClickItem(locationItems[index].id),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pinkAccent.withValues(alpha: 0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(locationItems[index].image),
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                  Positioned(
                    top: 10, //cach top 10dp
                    right: 10, //cach le phai 10dp
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200), //circle
                        color: Colors.white38,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            locationItems[index].isMark =
                                !locationItems[index].isMark;
                          });
                        },
                        icon: Icon(
                          locationItems[index].isMark == true
                              ? Icons.bookmark
                              : Icons.bookmark_outline_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          //return widget
        },
      ),
    );
  }

  //option tabs
  SizedBox optionTabs({
    required Size size,
    required Function(String) onSelectTab,
  }) {
    return SizedBox(
      width: size.width,
      height: 60,
      child: ListView.builder(
        itemCount: nameTabLabels.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal, //cuon ngang
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque, //nhan vao dau cx tinh la clicked
            onTap: () {
              setState(() {
                selectedTab = index;
              });
              onSelectTab(
                nameTabLabels[selectedTab],
              ); //thong bao ra ngoai de call data
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    nameTabLabels[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 0.6, //chieu cao cua dong
                      color: selectedTab == index
                          ? Colors.black
                          : const Color.fromARGB(255, 169, 151, 158),
                    ),
                  ),
                  Text(
                    '.',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: selectedTab == index
                          ? Colors.black
                          : Colors.transparent,
                      height: 0.1, //chieu cao cua dong
                    ),
                  ),
                ],
              ),
            ),
          );
          //tra ve widget cho item
        },
      ),
    );
  }

  //appBar
  Row appBar({required Function onClickMenu, required Function onClickSearch}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => onClickMenu(),
          icon: Icon(
            Icons.grid_view_rounded,
            size: 30,
            color: const Color.fromARGB(255, 152, 134, 140),
          ),
        ),
        IconButton(
          onPressed: () => onClickSearch(),
          icon: Icon(
            Icons.search_rounded,
            size: 30,
            color: const Color.fromARGB(255, 152, 134, 140),
          ),
        ),
      ],
    );
  }
}
