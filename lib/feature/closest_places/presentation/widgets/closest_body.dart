import 'package:flutter/material.dart';
import 'package:pro5/core/helper/extention.dart';
import 'package:pro5/core/routing/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pro5/constant.dart';
import 'package:pro5/core/assets/imagesname/name.dart';
import 'package:pro5/feature/Details/persentation/deatils_view.dart';

class CLosestBody extends StatelessWidget {
  const CLosestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 25.px,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              SizedBox(
                width: 2.px,
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colorsapp.textdescription,
                  size: 30.px,
                ),
              ),
              SizedBox(
                width: 15.px,
              ),
              Text.rich(
                TextSpan(
                  text: 'The closest historical\ntourism places to you',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 10,
                      color: Colorsapp.title,
                      fontSize: 25.px,
                      fontFamily: 'Koh'),
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
          ),
        ),
        SliverToBoxAdapter(
          child: gridedata(context),
        )
      ],
    );
  }

  Widget gridedata(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 270,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 7, right: 5),
            child: conatinerdata(
              context,
              index: index,
            ),
          );
        });
  }

  Widget conatinerdata(BuildContext context, {required int index}) {
    return Container(
      width: 210.px,
      height: 280.px,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 202.px,
              height: 202.px,
              child: InkWell(
                onTap: () {
                  context.pushNamed(Routes.detailsView,
                      arguments: NamePLACE.place[index]);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             DetailsView(NamePLACE.place[index])),
                  //     (route) => false);
                },
                child: Image.asset(
                  IMagesName.images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                NamePLACE.place[index],
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontFamily: 'Koh',
                  fontSize: 16.px,
                  fontWeight: FontWeight.w700,
                  color: Colorsapp.textdescription,
                ),
              ),
              Icon(Icons.star, color: const Color(0xff7B1E00), size: 18.px),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Read More About This',
                style: TextStyle(
                  fontFamily: 'Koh',
                  fontSize: 13.px,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff7B1E00),
                ),
              ),
              Icon(Icons.arrow_forward,
                  color: const Color(0xff7B1E00), size: 18.px),
            ],
          )
        ],
      ),
    );
  }
}
