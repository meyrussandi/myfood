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
        SafeArea(child: Container(color: backColor?? whiteColor,)),
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    width: double.infinity,
                    height: 100,
                    color: whiteColor,
                    child: Row(
                      children: [
                        onBackPress != null ? Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.only(right: 26),
                          child: Icon(Icons.arrow_back_ios,size: 24,),
                        ):SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(title, style: blackTextFont.copyWith(fontSize: 22, fontWeight: FontWeight.w500),),
                            Text(subTitle, style: greyTextFont.copyWith(fontWeight: FontWeight.w300),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: defaultMargin,
                    width: double.infinity,
                    color: Color(0xffFAFAFC),
                  ),
                  child ?? SizedBox()
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
