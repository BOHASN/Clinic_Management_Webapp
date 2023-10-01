import 'package:flutter/material.dart';
import '../../components/side_menu.dart';
import 'Panel/panel_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool isSmallScreen = constraints.maxWidth <= 768;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isSmallScreen)
                  Expanded(
                    child: SideMenu(),
                  ),
                Expanded(
                  flex: isSmallScreen ? 12 : 5,
                  child: PanelScreen(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
