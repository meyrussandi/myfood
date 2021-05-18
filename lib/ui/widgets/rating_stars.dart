part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double rate;
  RatingStars(this.rate);
  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.floor();

    return Row(
      children: List<Widget>.generate(5, (index) => Icon(
        (index < numberOfStars) ? Icons.star : Icons.star_border_outlined, color: mainColor,size: 15,
      )) + [
        SizedBox(width: 5,),
        Text(rate.toString(), style: greyTextFont.copyWith(fontSize: 12),)
      ],
    );
  }
}
