part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

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
                        style:
                            greyTextFont.copyWith(fontWeight: FontWeight.w300),
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
                                (context.read<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath))),
                  )
                ],
              ),
            ),
            //LIST OF FOOD
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (context, state) {
                  return (state is FoodLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: state.food
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(
                                            left: e == state.food.first
                                                ? defaultMargin
                                                : 0,
                                            right: defaultMargin),
                                        child: InkWell(
                                            onTap: () {
                                              Get.to(FoodDetailPage(
                                                transaction: Transaction(
                                                    food: e,
                                                    user: (context
                                                            .read<UserCubit>()
                                                            .state as UserLoaded)
                                                        .user),
                                                onBackPress: () {
                                                  Get.back();
                                                },
                                              ));
                                            },
                                            child: FoodCard(e)),
                                      ))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(child: loadingIndicator);
                },
              ),
            ),
            //TAB OF FOOD
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  C1Tabbar(
                    titles: ['New Taste', 'Popular', 'Recomended'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<FoodCubit, FoodState>(builder: (_, state) {
                    if (state is FoodLoaded) {
                      List<Food> foods = state.food.where((element) =>
                          element.foodType.contains((selectedIndex == 0)
                              ? FoodType.new_food
                              : (selectedIndex == 1)
                                  ? FoodType.popular
                                  : FoodType.recomended)).toList();

                      return Column(
                        children: foods
                            .map((e) => Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 16),
                                  child: FoodListCard(
                                      food: e, itemWidth: listItemWidth),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(
                        child: loadingIndicator,
                      );
                    }
                  })
                ],
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ],
    );
  }
}
