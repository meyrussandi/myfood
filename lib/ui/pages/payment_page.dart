part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralPage(
        title: 'Payment',
        subTitle: 'You deserve better meal',
        onBackPress: () {},
        backColor: Color(0xffFAFAFC),
        child: Column(
          children: [
            //// Top
            Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item Orders',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        widget.transaction.food.picturePath))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      2 * defaultMargin -
                                      60 -
                                      12 -
                                      78,
                                  child: Text(
                                    widget.transaction.food.name,
                                    style: blackTextFont.copyWith(
                                        fontWeight: FontWeight.w600),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                  )),
                              Text(
                                NumberFormat.currency(
                                        symbol: 'IDR ',
                                        locale: 'id_ID',
                                        decimalDigits: 0)
                                    .format(widget.transaction.food.price),
                                style: greyTextFont,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        '${widget.transaction.quantity} item(s)',
                        style: greyTextFont.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Details Transaction',
                      style: blackTextFont.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.food.name,
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(widget.transaction.total),
                          style: blackTextFont,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Driver',
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(12000),
                          style: blackTextFont,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Tax 10%',
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(widget.transaction.total * 0.1),
                          style: blackTextFont,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Total',
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          NumberFormat.currency(
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                  locale: 'id_ID')
                              .format(widget.transaction.total *
                                      1.1 +
                                  12000),
                          style: blackTextFont.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff1ABC9C)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: defaultMargin),
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliver to',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Name',
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.user.name,
                          style: blackTextFont,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Phone No',
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.user.phoneNumber,
                          style: blackTextFont,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'Address',
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.user.address,
                          style: blackTextFont,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'House Number',
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.user.houseNumber,
                          style: blackTextFont,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          'City',
                          style: greyTextFont,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 -
                            defaultMargin -
                            5,
                        child: Text(
                          widget.transaction.user.city,
                          style: blackTextFont,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            (isLoading) ?
                Center(child: loadingIndicator,)
                :SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: mainColor),
                onPressed: ()async {
                  setState(() {
                    isLoading = true;
                  });

                  bool result = await context.read<TransactionCubit>().submitTransaction(widget.transaction.copyWith(
                    dateTime: DateTime.now(),
                    total: (widget.transaction.total * 1.1).toInt() + 12000
                  ));

                  if(result){
                      Get.to(SuccessOrderPage());
                  }else{
                    setState(() {
                      isLoading = false;
                    });

                    Get.snackbar("", "", backgroundColor: secondColor, icon: Icon(Icons.close, color: Colors.white,),
                    titleText: Text('Transaction Failed', style: whiteTextFont.copyWith(fontWeight: FontWeight.w600),),
                    messageText: Text('Please try again later', style: whiteTextFont,));
                  }
                },
                child: Text('Checkout Now'),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
