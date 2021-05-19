part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (_, state) {
        if (state is TransactionLoaded) {
          if (state.transaction.length == 0) {
            return IlustrationPage(
                title: 'Ouch! Hungry',
                subTitle: 'Seems you like have not\nordered any food yet',
                picturePath: 'assets/love_burger.png',
                buttonTitle1: 'Find Foods',
                buttonTap1: () {
                  print("tap");
                });
          } else {
            double listItemWidth =
                MediaQuery.of(context).size.width - 2 * defaultMargin;
            return ListView(
              children: [
                Column(
                  children: [
                    ////HEADER
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your Orders',
                              style: blackTextFont.copyWith(
                                  fontSize: 22, fontWeight: FontWeight.w500)),
                          Text('Wait For the best meal',
                              style: greyTextFont.copyWith(
                                  fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),

                    ////BODY
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          C1Tabbar(
                            titles: ['In Progress', 'Past Orders'],
                            selectedIndex: selectedIndex,
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          SizedBox(height: 16),
                          Builder(
                            builder: (_) {
                              List<Transaction> transaction = (selectedIndex ==
                                      0)
                                  ? state.transaction
                                      .where((element) =>
                                          element.status ==
                                              TransactionStatus.on_delivered ||
                                          element.status ==
                                              TransactionStatus.pending)
                                      .toList()
                                  : state.transaction
                                      .where((element) =>
                                          element.status ==
                                              TransactionStatus.delivered ||
                                          element.status ==
                                              TransactionStatus.cancelled)
                                      .toList();
                              return Column(
                                children: transaction
                                    .map((e) => Padding(
                                          padding: EdgeInsets.only(
                                              left: defaultMargin,
                                              right: defaultMargin,
                                              bottom: 16),
                                          child: OrderListCard(
                                              transaction: e,
                                              itemWidth: listItemWidth),
                                        ))
                                    .toList(),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        } else {
          return Center(
            child: loadingIndicator,
          );
        }
      },
    );
  }
}
