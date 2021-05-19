part of 'pages.dart';

class IlustrationPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String picturePath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function buttonTap1;
  final Function buttonTap2;

  IlustrationPage(
      {@required this.title,
      @required this.subTitle,
      @required this.picturePath,
      @required this.buttonTitle1,
      this.buttonTitle2,
      @required this.buttonTap1,
      this.buttonTap2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(picturePath), fit: BoxFit.cover)),
          ),
          Text(title, style: blackTextFont.copyWith(fontSize: 20)),
          Text(subTitle,
              textAlign: TextAlign.center,
              style: greyTextFont.copyWith(fontWeight: FontWeight.w300)),
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 12),
              height: 45,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: mainColor),
                  onPressed: () {
                    buttonTap1();
                  },
                  child: Text(buttonTitle1,
                      style: whiteTextFont.copyWith(
                          fontWeight: FontWeight.w500)))),
          (buttonTap2 == null)
              ? SizedBox()
              : SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: greyColor),
                      onPressed: buttonTap2,
                      child: Text(buttonTitle2,
                          style: whiteTextFont.copyWith(
                              fontWeight: FontWeight.w500)))),
        ],
      ),
    );
  }
}
