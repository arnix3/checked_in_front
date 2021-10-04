import 'package:checked_in_front/trending_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State createState() => _MainState();
}

class _MainState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: SizedBox(
              width: 24,
              height: 24,
              child: CupertinoButton(
                child: const Icon(
                  EvaIcons.menu,
                  color: CupertinoColors.darkBackgroundGray,
                ),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'TRENDING',
              style: GoogleFonts.bebasNeue(fontSize: 36),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const TrendingCard(
                  category: '이 주변 뜨는 곳',
                  restaurants: [
                    RestaurantInformation(
                      name: '을지면옥',
                      location: '중구 을지로동 충무로14길 2-1',
                      visitedPeople: 1202,
                    ),
                    RestaurantInformation(
                      name: '을지면옥',
                      location: '중구 을지로동 충무로14길 2-1',
                      visitedPeople: 1202,
                    ),
                    RestaurantInformation(
                      name: '을지면옥',
                      location: '중구 을지로동 충무로14길 2-1',
                      visitedPeople: 1202,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
