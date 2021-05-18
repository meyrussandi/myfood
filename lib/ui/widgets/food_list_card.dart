part of 'widgets.dart';

class FoodListCard extends StatelessWidget {
  final Food food;
  final double itemWidth;

  FoodListCard({
    @required this.food,
    @required this.itemWidth
});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,width: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: NetworkImage(food.picturePath), fit: BoxFit.cover)
          ),
        ),
        SizedBox(
          width: itemWidth - 182 , //60 - 12 -110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(food.name, style: blackTextFont.copyWith(fontSize: 14),maxLines: 1,overflow: TextOverflow.clip,),
              Text(NumberFormat.currency(symbol: 'IDR ', decimalDigits: 0, locale: 'id_ID').format(food.price), style: greyTextFont.copyWith(fontSize: 13),),
            ],
          ),
        ),
        RatingStars(food.rate)
      ],
    );
  }
}
