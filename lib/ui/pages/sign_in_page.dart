part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Sign In",
      subTitle: 'Do you miss your food?',
      child: Column(
        children: [
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
            child: isLoading
                ? loadingIndicator
                : ElevatedButton(
                    onPressed: ()async {
                      setState(() {
                        isLoading = true;
                      });

                      await context.read<UserCubit>().signIn(emailController.text, passwordController.text);
                      UserState state = context.read<UserCubit>().state;

                      if(state is UserLoaded){
                        context.read<FoodCubit>().getFoods();
                        context.read<TransactionCubit>().getTransactions();
                        Get.to(MainPage());
                      }else{
                        Get.snackbar("", '', backgroundColor: secondColor, icon: Icon(Icons.close, color: Colors.white,),
                            titleText: Text("Sign In Failed", style: whiteTextFont.copyWith(fontWeight: FontWeight.w600),),
                        messageText: Text((state as UserLoadingFailed).message, style: whiteTextFont,), );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0, primary: mainColor),
                    child: Text(
                      "Sign In",
                      style:
                          whiteTextFont.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=>SignUpPage());
              },
              style: ElevatedButton.styleFrom(elevation: 0, primary: greyColor),
              child: Text(
                "Create new account",
                style: whiteTextFont.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
