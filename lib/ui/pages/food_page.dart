part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth = MediaQuery.of(context).size.width - 2 * defaultMargin;


    return ListView(
      children: [
        Column(
          children: [
            //HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Food Market",
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Let's get some food",
                        style: greyTextFont.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://disk.mediaindonesia.com/thumbs/1800x1200/news/2018/10/6d6c224641cdcff679e89c90ba2f7b8c.jpg'))),
                  )
                ],
              ),
            ),
            //LIST OF FOOD
            Container(
              height: 258,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: dummyFoods
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  left: e == dummyFoods.first ? defaultMargin : 0,
                                  right: defaultMargin),
                              child: FoodCard(e),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            //TAB OF FOOD
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  C1Tabbar(titles: ['New Taste', 'Popular', 'Recomended'],selectedIndex: selectedIndex,
                  onTap: (index){
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  ),
                  SizedBox(height: 16,),
                  Builder(builder: (_){
                    List<Food> foods = (selectedIndex == 0) ? dummyFoods : (selectedIndex == 1)? [] : [];

                    return Column(
                      children: foods.map((e) => Padding(
                        padding:  EdgeInsets.fromLTRB(defaultMargin,0,defaultMargin, 16),
                        child: FoodListCard(food: e, itemWidth: listItemWidth),
                      )).toList(),
                    );
                  })
                ],
              ),
            ),
            SizedBox(height: 80,)
          ],
        ),
      ],
    );
  }
}
