part of 'pages.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return GeneralPage(
      title: "Sign Up",
      subTitle: 'Register and find eat',
      onBackPress: (){
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(top: 26),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/photo_border.png'))),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(
                'https://disk.mediaindonesia.com/thumbs/1800x1200/news/2018/10/6d6c224641cdcff679e89c90ba2f7b8c.jpg'
              ), fit: BoxFit.cover)
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Full Name",
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: blackColor)),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextFont,
                  hintText: 'type your full name'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 6),
            child: Text(
              "Email Address",
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: blackColor)),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextFont,
                  hintText: 'type your email address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Password",
              style: blackTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: blackColor)),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextFont,
                  hintText: 'type your password'),
            ),
          ),

          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(elevation: 0, primary: mainColor),
              child: Text(
                "Continue",
                style: whiteTextFont.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
