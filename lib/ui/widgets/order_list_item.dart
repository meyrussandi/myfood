part of 'widgets.dart';

class OrderListCard extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  OrderListCard({@required this.transaction, @required this.itemWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(transaction.food.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182, //60 - 12 -110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: blackTextFont.copyWith(fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                '${transaction.quantity} item(s) • ' +
                    NumberFormat.currency(
                            symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID')
                        .format(transaction.total),
                style: greyTextFont.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(convertDateTime(transaction.dateTime), style: greyTextFont),
              (transaction.status == TransactionStatus.cancelled)
                  ? Text('Cancelled',
                      style: greyTextFont.copyWith(fontSize: 10, color: Colors.red))
                  : (transaction.status == TransactionStatus.pending)
                      ? Text('Pending',
                          style: mainTextFont.copyWith(fontSize: 10))
                      : (transaction.status == TransactionStatus.on_delivered)
                          ? Text('On Delivered',
                              style: greyTextFont.copyWith(
                                  color: Color(0xff1ABC9C), fontSize: 10))
                          : SizedBox()
            ],
          ),
        )
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;
    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Dec';
    }
    return month +
        ' ${dateTime.day}, ' +
        '${dateTime.hour}:' +
        '${dateTime.minute}';
  }
}
