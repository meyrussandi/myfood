part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Function onBackPress;
  final Transaction transaction;

  FoodDetailPage({this.onBackPress, this.transaction});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.transaction.food.picturePath))),
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    //// BACK BUTTON
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            if (widget.onBackPress != null) {
                              widget.onBackPress();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black12),
                            child: Icon(Icons.arrow_back, color: Colors.white,),
                          ),
                        ),
                      ),
                    ),

                    ////BODY
                    Container(
                      margin: EdgeInsets.only(top: 180),
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        134, //32 + 102,
                                    child: Text(
                                      widget.transaction.food.name,
                                      style: blackTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  RatingStars(widget.transaction.food.rate)
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(width: 1)),
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Text(
                                      quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: blackTextFont,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(width: 1)),
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Text(
                              widget.transaction.food.description,
                              style: greyTextFont,
                            ),
                          ),
                          Text(
                            'Ingredients',
                            style: blackTextFont.copyWith(
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                            child: Text(
                              widget.transaction.food.ingredients,
                              style: greyTextFont,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: greyTextFont.copyWith(fontSize: 13),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            symbol: 'IDR ',
                                            decimalDigits: 0,
                                            locale: 'id_ID')
                                        .format(quantity *
                                            widget.transaction.food.price),
                                    style: blackTextFont.copyWith(fontSize: 18),
                                  ),
                                ],
                              ),

                              SizedBox(
                                width: 163, height: 45,
                                child: ElevatedButton(
                                  onPressed: (){
                                    Get.to(PaymentPage(transaction: widget.transaction.copyWith(
                                      quantity: quantity,
                                      total: quantity * widget.transaction.food.price
                                    ),));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: mainColor
                                  ),
                                  child: Text("Order Now", style: whiteTextFont.copyWith(fontSize:16,fontWeight: FontWeight.w500),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
