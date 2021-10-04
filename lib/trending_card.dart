import 'package:checked_in_front/fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantInformation extends StatelessWidget {
  const RestaurantInformation(
      {Key? key,
      required this.name,
      required this.location,
      required this.visitedPeople})
      : super(key: key);

  final String name;
  final String location;
  final int visitedPeople;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: Container(
              decoration: const BoxDecoration(
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: CustomFonts.ibmPlexSansKR,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      location,
                      style: const TextStyle(
                        fontFamily: CustomFonts.ibmPlexSansKR,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        EvaIcons.people,
                        color: CupertinoColors.darkBackgroundGray,
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          visitedPeople.toString(),
                          style: GoogleFonts.bebasNeue(
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingCard extends StatefulWidget {
  const TrendingCard(
      {Key? key, required this.category, required this.restaurants})
      : super(key: key);

  final String category;

  final List<RestaurantInformation> restaurants;

  @override
  State createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  widget.category,
                  style: const TextStyle(
                    fontFamily: CustomFonts.ibmPlexSansKR,
                    fontSize: 32,
                  ),
                ),
              ),
              ...widget.restaurants,
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'MORE',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 24,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Icon(
                        EvaIcons.arrowIosForwardOutline,
                        color: CupertinoColors.darkBackgroundGray,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: Color.fromRGBO(242, 242, 242, 1),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.12),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(2, 4),
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
    );
  }
}
