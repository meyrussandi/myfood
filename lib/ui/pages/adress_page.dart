part of 'pages.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController houseNumberController = TextEditingController();

    return GeneralPage(
      title: "Sign Up",
      subTitle: 'Register and find your favorite food',
      onBackPress: (){
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 6),
            child: Text(
              "Phone Number",
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
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextFont,
                  hintText: 'type your phone number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 6),
            child: Text(
              "Address",
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
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextFont,
                  hintText: 'type your address'),
            ),
          ), Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 6),
            child: Text(
              "House Number",
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
              controller: houseNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyTextFont,
                  hintText: 'type your house number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "city",
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
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              items: [
                DropdownMenuItem(child: Text("Jakarta", style: blackTextFont,),),
                DropdownMenuItem(child: Text("Bandung", style: blackTextFont,),),
                DropdownMenuItem(child: Text("Surabaya", style: blackTextFont,),),
              ],
              onChanged: (item){},
            )
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
