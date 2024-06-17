import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:pro5/constant.dart';
import 'package:pro5/core/assets/imagesname/name.dart';
import 'package:pro5/core/helper/extention.dart';
import 'package:pro5/core/routing/routes.dart';

class DetailsBody extends StatefulWidget {
  const DetailsBody(place, {super.key});
  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

TextEditingController textController = TextEditingController();
final FlutterTts flutterTts = FlutterTts();
String texttt =
    "The museum in question is the Egyptian Museum, also known as the Museum of Egyptian Antiquities or the Museum of Cairo. Established in 1835, it has undergone several relocations before settling in its current prominent location on the northern side of Tahrir Square in Cairo. Initially situated in Azbakeya Park, it later found a home in the Salah al-Din Citadel. However, it was the initiative of the French Egyptologist Auguste Mariette, who recognized the need for a dedicated museum to house Egypt's vast collection of antiquities, that led to its establishment in its present location. Mariette's foresight was particularly crucial when the artifacts faced the threat of flooding while being housed on the Nile's shore at Boulaq.";
speak(String text) async {
  await flutterTts.setLanguage('en-Us');
  await flutterTts.setPitch(1);
  await flutterTts.speak(texttt);
  await flutterTts.setVolume(10);
  await flutterTts.setSpeechRate(0.5);
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  color: Colorsapp.title,
                  Icons.arrow_back,
                  size: 30,
                )),
            const SizedBox(
              width: 30,
            ),
            Text("Egyptian Museum",
                style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.amber.shade400,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: describiton(),
              ),
              SliverToBoxAdapter(
                child: seconddescription(),
              ),
              SliverToBoxAdapter(
                child: float(),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget float() {
    return Row(children: [
      SizedBox(
        width: 50.w,
      ),
      Container(
        height: 33.dg,
        width: 33.dg,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () {
            context.pushNamed(Routes.imagePickerDemo);
          },
          icon: Image.asset(
            'lib/core/assets/images/Vector.png',
            height: 50,
            width: 50,
          ),
        ),
      ),
      SizedBox(
        width: MediaQuery.devicePixelRatioOf(context) / 2 * 120.w,
      ),
      Container(
        height: 33.dg,
        width: 33.dg,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () {
            context.pushNamed(Routes.chatScreen);
          },
          icon: Image.asset(
            height: 33.dg,
            width: 33.dg,
            'lib/core/assets/images/ai.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ]);
  }

  Widget seconddescription() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(6),
          vertical: ScreenUtil().setHeight(6)),
      child: Container(
        width: ScreenUtil().setWidth(350),
        height: ScreenUtil().setHeight(270),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colorsapp.textdescription,
                          fontSize: 19.sp,
                          fontFamily: 'Koh',
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              flutterTts.pause();
                            },
                            icon: Icon(
                              Icons.stop,
                              size: 18.sp,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.002,
                        ),
                        IconButton(
                            onPressed: () async {
                              await speak(texttt);
                            },
                            icon: Icon(
                              Icons.play_arrow,
                              size: 18.sp,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 80),
                child: Text(
                  texttt,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'Koh',
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold),
                  softWrap: true,
                  maxLines: 10,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.comment_rounded,
                          color: Colorsapp.title,
                          size: 20.sp,
                        ),
                      ),
                      Text(
                        "Comments",
                        style: TextStyle(
                            color: Colorsapp.textdescription,
                            fontSize: 15.sp,
                            fontFamily: 'Koh',
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        '334',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rates :',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.star, color: Colorsapp.title, size: 15.sp),
                      Icon(Icons.star, color: Colorsapp.title, size: 15.sp),
                      Icon(Icons.star, color: Colorsapp.title, size: 15.sp),
                      Icon(Icons.star, color: Colorsapp.title, size: 15.sp),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget describiton() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10)),
      child: Container(
        width: ScreenUtil().setWidth(300),
        height: ScreenUtil().setHeight(250),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10).w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(IMagesName.images[0]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 50),
                    child: Text("Egyptian Museum",
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colorsapp.title,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                  IconButton(
                    iconSize: 20.sp,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.label_rounded,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              smalldescript(),
            ],
          ),
        ),
      ),
    );
  }

  Widget smalldescript() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.03),
          child: Text(
            "opened from 8AM to 4PM",
            style: TextStyle(color: Colors.blue, fontSize: 12.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.03),
          child: Row(
            children: [
              Icon(
                size: 12.dg,
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                size: 12.dg,
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                size: 12.dg,
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                size: 12.dg,
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                size: 12.dg,
                Icons.star,
                color: Colors.yellow,
              ),
            ],
          ),
        )
      ],
    );
  }
}
