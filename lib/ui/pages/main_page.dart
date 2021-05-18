part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage=0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(child:
            Container(color: Color(0xffFAFAFC),),),
          SafeArea(child: PageView(
            controller: pageController,
            onPageChanged: (index){
              setState(() {
                selectedPage = index;
              });
            },
            children: [
              FoodPage(),
              Center(child: Text("order"),),
              Center(child: Text("profile"),),
            ],
          )),
          Align(alignment: Alignment.bottomCenter,child: C1BottomNavbar(selectedIndex: selectedPage,onTap: (index){
            setState(() {
              selectedPage = index;
            });
            pageController.jumpToPage(selectedPage);
          },),)
        ],
      ),
    );
  }
}
