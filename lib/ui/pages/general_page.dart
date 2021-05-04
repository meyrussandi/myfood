part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onBackPress;
  final Widget child;
  final Color backColor;

  GeneralPage(
      {this.title = "Title",
      this.subTitle = "subtitle",
      this.onBackPress,
      this.backColor,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(color: whiteColor,),
        SafeArea(child: Container(color: backColor?? Color(0xffFAFAFC),)),
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    width: double.infinity,
                    height: 100,
                    color: whiteColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
