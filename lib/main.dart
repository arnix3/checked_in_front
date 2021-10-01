import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: _panelController,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 20),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(EvaIcons.menu),
                  padding: EdgeInsets.zero,
                  splashRadius: 18,
                  constraints: BoxConstraints.loose(const Size(30, 30)),
                ),
              ),
              Column(
                children: [
                  Text(
                    'TRENDING',
                    style: GoogleFonts.bebasNeue(
                      textStyle: const TextStyle(fontSize: 36),
                    ),
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildMainCard(
                          context: context, legend: '이 근처 뜨는 곳');
                    },
                  )
                ],
              )
            ],
          ),
        ),
        panel: GestureDetector(
          onTap: () {
            if (_panelController.isPanelOpen) {
              _panelController.close();
            } else {
              _panelController.open();
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.black87,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Container(
                    child: const SizedBox(
                      width: 90,
                      height: 3,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(1.5),
                        right: Radius.circular(1.5),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'CHECK IN',
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        backdropEnabled: true,
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
    );
  }

  Widget _buildMainCard(
      {required BuildContext context, required String legend}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FractionallySizedBox(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _krText(
                    text: legend, fontSize: 32, fontWeight: FontWeight.w500),
                Row(
                  children: [
                    Transform.rotate(
                      angle: -0.75,
                      child: const Icon(
                        EvaIcons.navigation,
                        size: 15,
                        color: Color.fromRGBO(79, 79, 79, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: _krText(text: '서울, 중구, 을지로 3가', fontSize: 13),
                    ),
                  ],
                ),
                Column(
                  children: [
                    _listItem(),
                    _listItem(),
                    _listItem(),
                  ],
                ),
              ],
            ),
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromRGBO(242, 242, 242, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(2, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 72,
        child: Row(
          children: [
            SizedBox(
              width: 72,
              height: 72,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _krText(text: '음식점', fontSize: 9),
                  _krText(
                      text: '을지면옥', fontSize: 20, fontWeight: FontWeight.w500),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _krText(
      {required String text,
      required double fontSize,
      FontWeight fontWeight = FontWeight.w400,
      TextAlign textAlign = TextAlign.start}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'IBMPlexSansKR',
      ),
      textAlign: textAlign,
    );
  }
}
