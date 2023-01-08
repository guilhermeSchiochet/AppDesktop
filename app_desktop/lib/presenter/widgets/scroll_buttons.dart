import 'package:app_desktop/presenter/utils/app_desktop_colors.util.dart';
import 'package:flutter/material.dart';

class ScrollButton extends StatelessWidget {
  
  final ScrollController controller;
  final Color? corIcone;
  final double tamnhoIcone;

  ScrollButton({
    required this.controller,
    this.tamnhoIcone = 200.0,
    this.corIcone
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        this._icone(
          icone: Icons.keyboard_arrow_up,
          onClick: () => this._onClickUp
        ),
        SizedBox(height: 20),
        this._icone(
          icone: Icons.keyboard_arrow_down,
          onClick: () => this._onClickDown
        )
      ],
    );
  }

  /// componenente Icone
  Widget _icone({Function()? onClick, required IconData icone}) {
    return IconButton(
      icon: Icon(icone),
      iconSize: this.tamnhoIcone,
      color: this.corIcone != null ? this.corIcone! :  AppDesktopColorsUtil.getColorDefault,
      onPressed: onClick,
    );
  }

  /// Controlador de posição do scroll para cima.
  void get _onClickUp {
    controller.animateTo(this.controller.position.pixels - 300,
      duration: Duration(seconds: 1), curve: Curves.easeIn
    );
  }

  /// Controlador de posição do scroll para baixo.
  void get _onClickDown {
    controller.animateTo(this.controller.position.pixels - 300,
      duration: Duration(seconds: 1), curve: Curves.easeIn
    );
  }
}