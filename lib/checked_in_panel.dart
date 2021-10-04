import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CheckedInPanel extends StatefulWidget {
  const CheckedInPanel(
      {Key? key, required this.panelController, required this.title})
      : super(key: key);

  final PanelController panelController;
  final String title;

  @override
  State<StatefulWidget> createState() => _CheckedInPanelState();
}

class _CheckedInPanelState extends State<CheckedInPanel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        child: Column(
          children: [
            SizedBox.fromSize(
              size: const Size(90, 3),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(1.5),
                    right: Radius.circular(1.5),
                  ),
                  color: CupertinoColors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                widget.title,
                style: GoogleFonts.bebasNeue(
                  fontSize: 36,
                  color: CupertinoColors.white,
                ),
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
      onTap: () {
        final controller = widget.panelController;

        if (controller.isPanelClosed) {
          controller.open();
        } else {
          controller.close();
        }
      },
    );
  }
}
