import 'package:checked_in_front/checked_in_panel.dart';
import 'package:checked_in_front/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return const CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Check In'),
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
    return CupertinoPageScaffold(
      child: SlidingUpPanel(
        controller: _panelController,
        body: const MainPage(),
        panel: CheckedInPanel(
          title: 'CHECK IN',
          panelController: _panelController,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: const Color.fromARGB(255, 42, 42, 42),
        backdropEnabled: true,
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
    );
  }
}
