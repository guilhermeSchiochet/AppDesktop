import 'package:app_desktop/presenter/utils/app_desktop_colors.util.dart';
import 'package:app_desktop/presenter/widgets/scroll_buttons.dart';
import 'package:app_desktop/presenter/widgets/tamanho_tela.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar,
      body: this._conteudoTela,
    );
  }

  PreferredSize get _getAppBar {
    return PreferredSize (
      preferredSize: Size(TamanhoTela.largura, TamanhoTela.porcentagemAltura(0.42)),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppDesktopColorsUtil.getColorDefault,
              offset: Offset(0, 6),
              blurRadius: 12,
            ),
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/png/folhas_vermelhas.jpg')
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                this._getTituloAppBar,
                this._linhaDivisao()
              ],
            ),
            Row(
              children: [
                this._getImageContainer(),
                this._spaceWidget70,
                this._linhaDivisaoVertical,
                this._spaceWidget70,
                this._iconGear,
                this._spaceWidget70,
              ],
            ),
          ]
        ),
      ),
      
    );
  }

  Widget get _iconGear {
    return Icon(
      FontAwesomeIcons.gear,
      size: 80,
      color: AppDesktopColorsUtil.white
    );
  }

  Widget _getImageContainer() {
    return Container(
      height: 250,
      width: TamanhoTela.porcentagemLargura(0.4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:  BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/png/folhas_vermelhas.jpg')
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              child: DigitalClock(
                secondDigitDecoration: BoxDecoration(
                  color: Colors.transparent
                ),
                hourMinuteDigitDecoration: BoxDecoration(
                  color: Colors.transparent
                ),
                digitAnimationStyle: Curves.elasticInOut,
                areaDecoration: BoxDecoration(
                  color: Colors.transparent
                ),
                hourMinuteDigitTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 100
                ),
                amPmDigitTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 100
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _circleContainer({Color? color}) {
    return Container(
      height: 100,
      width: 100,
      child: Icon(Icons.add, color: AppDesktopColorsUtil.white, size: 50),
      decoration: BoxDecoration(
        color: color != null ? color : AppDesktopColorsUtil.white,
        borderRadius: BorderRadius.circular(100)
      ),
    );
  }

  Widget get _spaceWidget70 => SizedBox(width: 70, height: 70);

  Widget get _getTituloAppBar {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          this._textAppBar(text: 'Aplication'),
          Row(
            children: [
              this._spaceWidget70,
              this._textAppBar(text: 'Desktop'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _linhaDivisao() {
    return Container(
      decoration: BoxDecoration(
        color: AppDesktopColorsUtil.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(3),
          bottomRight: Radius.circular(3),
        )
      ),
      height: 3,
      width: TamanhoTela.porcentagemLargura(0.3),
    );
  }

  Widget get _linhaDivisaoVertical {
    return Container(
      color: Colors.white,
      width: 3,
      height: 200,
    );
  }


  Widget _textAppBar({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 70,
        fontWeight: FontWeight.w700,
        color: AppDesktopColorsUtil.white,
      ),
    );
  }

  Widget get _conteudoTela {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          this.conteudoCard(),
          ScrollButton(
            controller: _scrollController
          )
        ],
      ),
    );
  }

  Widget conteudoCard() {
    return Flexible(
      child: GridView.builder(
        itemCount: 40,
        shrinkWrap: true,
        controller: this._scrollController,
        itemBuilder: (context, index) => this._containerSerivico(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 250),
      ),
    ) ;
  }

  Widget _containerSerivico() {
    return Padding(
      padding: const EdgeInsets.only(
      bottom: 10,
      left: 10,
      right: 20,
      top: 30
      ),
      child: Container(
        decoration: BoxDecoration (
          color: AppDesktopColorsUtil.white,
          border: Border.all(
            color: AppDesktopColorsUtil.grey40,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 15,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              this._circleContainer(color: AppDesktopColorsUtil.getColorDefault),
              SizedBox(
                width: 20,
              ),
              Text(
                'Service',
                style: TextStyle(
                  color: AppDesktopColorsUtil.getColorDefault,
                  fontSize: 40
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}