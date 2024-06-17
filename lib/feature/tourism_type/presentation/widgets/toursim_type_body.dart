
import 'package:flutter/material.dart';
import 'package:pro5/constant.dart';
import 'package:pro5/core/helper/extention.dart';
import 'package:pro5/feature/tourism_type/presentation/widgets/customtoursimtype_conatiner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TourismTypeBody extends StatelessWidget {
  const TourismTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.px,
        ),
        appbartype(context),
        SizedBox(
          height: 26.px,
        ),
        Expanded(
            child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomTypeContainer(
                description:
                    ' like:\n pyramids and Sphinx\n Luxor is the city of palaces\n The Red Sea\n The Nile River\n Ras Mohammed National Park\n',
                imagess: 'lib/core/assets/images/pyrimds.jpeg',
                textAPPBAR: 'Historical tourism',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTypeContainer(
                description:
                    ' like:\n Muhammad bin Abi Bakr Al-\n Siddiq Mosque\n Abdullah bin Al Harith Mosque\n Abdul Rahman bin Hormuz \n Mosque',
                imagess: 'lib/core/assets/images/nationalmuseim.png',
                textAPPBAR: 'Religious tourism',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTypeContainer(
                description:
                    ' These different cultures\n included Greek, Roman,\n Islamic and Jewish\n',
                imagess: 'lib/core/assets/images/swia.png',
                textAPPBAR: 'Cultural tourism\t',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTypeContainer(
                description:
                    ' This tourism begins with\n quick trips on small boats,\n passing through Nile cruise \n ships, and ending with\n floating hotels.',
                imagess: 'lib/core/assets/images/egyptmusiem.png',
                textAPPBAR: 'Recreational tourism\t',
              ),
            )
          ],
        )),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget appbartype(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10.px,
        ),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colorsapp.title,
            size: 30,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.px, top: 5),
          child: Container(
            width: 80.px,
            height: 80.px,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/core/assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.px,
        ),
        Text.rich(
          TextSpan(
            text: ' Select Your \nTourism type',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                wordSpacing: 10,
                color: Colorsapp.title,
                fontSize: 25.px,
                fontFamily: 'Koh'),
          ),
        )
      ],
    );
  }
}
