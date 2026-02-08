import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_flutter/common/Logger.dart';

class ImageViewWidgetLearn extends StatefulWidget {
  const ImageViewWidgetLearn({super.key});

  @override
  State<ImageViewWidgetLearn> createState() => _ImageViewWidgetLearnState();
}

class _ImageViewWidgetLearnState extends State<ImageViewWidgetLearn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Image widget',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 200,
                padding: EdgeInsets.zero,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://w0.peakpx.com/wallpaper/670/326/HD-wallpaper-doraemon-cartoon-cat.jpg',
                  fit: BoxFit.cover, //phu kin khung anh bao
                  //sau khi tai xong anh
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.black45,
                            spreadRadius: 5.0,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  //hien thi khi dang tai
                  progressIndicatorBuilder: (context, url, progress) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                        color: Colors.pinkAccent,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //hieu ung quay nhi spotify
              RotationTransition(
                turns: _controller,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/img1.png'),
                    onBackgroundImageError: (exception, stackTrace) {
                      Logger.logError(tag: 'error', msg: 'image error');
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black38,
                      spreadRadius: 5.0,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://w0.peakpx.com/wallpaper/670/326/HD-wallpaper-doraemon-cartoon-cat.jpg',
                    ),
                    filterQuality: FilterQuality.medium,
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20)
                ),
*/

/*
child: Image.network(
                  'https://w0.peakpx.com/wallpaper/670/326/HD-wallpaper-doraemon-cartoon-cat.jpg',
                  // repeat: ImageRepeat.repeat,
                  // height: 200,
                  filterQuality: FilterQuality.medium,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    Logger.logError(tag: 'ERROR', msg: error.toString());
                    return Icon(Icons.error, color: Colors.pink, size: 150);
                  },
                  alignment: Alignment.center,
                  // opacity: AlwaysStoppedAnimation(0.5),//lam mo anh
                ),
*/
