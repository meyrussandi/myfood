part of 'widgets.dart';

class MenuListItem extends StatelessWidget {
  final String name;
  final Function onTap;

  MenuListItem({ this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: blackTextFont.copyWith(fontSize: 14,fontWeight: FontWeight.w400),),
          Icon(Icons.arrow_forward_ios, color: greyColor,)
        ],
      ),
    );
  }
}
