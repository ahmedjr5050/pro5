import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro5/constant.dart';
import 'package:pro5/core/helper/extention.dart';
import 'package:pro5/core/routing/routes.dart';

class DetectBOdy extends StatelessWidget {
  const DetectBOdy({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        appartext(context),
        bodydesc(context),
      ],
    );
  }

  Widget bodydesc(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
      child: Container(
        width: ScreenUtil().setWidth(50),
        height: ScreenUtil().setHeight(520),
        decoration: BoxDecoration(
          color: const Color(0xffEAD8A8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 350.h,
              width: 300.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'lib/core/assets/images/khofo.jpeg',
                    ),
                  )),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Khufu',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colorsapp.title,
                fontFamily: 'Koh',
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(1),
                    right: ScreenUtil().setWidth(260),
                  ),
                  child: Text(
                    'What This?',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colorsapp.title,
                      fontFamily: 'Koh',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(2),
                    right: ScreenUtil().setWidth(10),
                  ),
                  child: Text(
                    'It is one of the largest and most famous international museums, ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff51504D),
                      fontFamily: 'Koh',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            // context.pushNamed(Routes.imagePickerDemo);
                            context.pushNamed(Routes.imagePickerDemo);
                          },
                          child:
                              Image.asset('lib/core/assets/images/Vector.png')),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.chatScreen);
                        },
                        child: Image.asset(
                          'lib/core/assets/images/layer1.png',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget appartext(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 60,
        vertical: MediaQuery.of(context).size.height / 60,
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 28.sp,
                color: Colorsapp.title,
              )),
          SizedBox(
            width: 22.r,
          ),
          Text(
            'Egyptian Museum',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: Colorsapp.title,
              fontFamily: 'Koh',
            ),
          ),
        ],
      ),
    );
  }
}
