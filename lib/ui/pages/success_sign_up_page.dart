part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IlustrationPage(
            title: 'Yeay! Completed',
            subTitle: 'Now you are able to order\nsome foods as a self-reward',
            picturePath: 'assets/success_sign_up.png',
            buttonTitle1: 'Find Foods',
            buttonTap1: () {}));
  }
}
