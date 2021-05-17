part of 'widgets.dart';

class C1BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  C1BottomNavbar({this.selectedIndex=0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              child: selectedIndex == 0
                  ? Icon(
                      Icons.home,
                      color: mainColor,size: 30,
                    )
                  : Icon(
                      Icons.home_outlined,
                      color: Colors.grey,size: 30,
                    ),
            ),
          ),
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              child: selectedIndex == 1
                  ? Icon(
                Icons.shopping_bag,
                color: mainColor,size: 30,
              )
                  : Icon(
                Icons.shopping_bag_outlined,
                color: Colors.grey,size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              height: 32,
              width: 32,
              child: selectedIndex == 2
                  ? Icon(
                Icons.person,
                color: mainColor,size: 30,
              )
                  : Icon(
                Icons.person_outline,
                color: Colors.grey,size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
