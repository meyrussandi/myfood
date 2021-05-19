part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  User user = dummyUser;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //FOTO
            Container(
              height: 234,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    margin: EdgeInsets.only(top: 26),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/photo_border.png')),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage((context
                                      .read<UserCubit>()
                                      .state as UserLoaded)
                                  .user
                                  .picturePath))),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    (context.read<UserCubit>().state as UserLoaded).user.name,
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    (context.read<UserCubit>().state as UserLoaded).user.email,
                    style: greyTextFont.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                  defaultMargin, 0, defaultMargin, defaultMargin),
              child: Column(
                children: [
                  C1Tabbar(
                    selectedIndex: selectedIndex,
                    titles: ['Account', 'FoodMarket'],
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  (selectedIndex == 0)
                      ? Column(
                          children: [
                            MenuListItem(
                              name: 'Edit Profile',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MenuListItem(
                              name: 'Home Address',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MenuListItem(
                              name: 'Security',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MenuListItem(
                              name: 'Payments',
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            MenuListItem(
                              name: 'Rate App',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MenuListItem(
                              name: 'Help Center',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MenuListItem(
                              name: 'Privacy & Policy',
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            MenuListItem(
                              name: 'Terms & Conditions',
                            ),
                          ],
                        )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
