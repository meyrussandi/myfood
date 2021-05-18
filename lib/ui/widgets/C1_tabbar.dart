part of 'widgets.dart';

class C1Tabbar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  C1Tabbar({this.selectedIndex, @required this.titles, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 1,
            color: Color(0xffF2F2F2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: titles
                .map((e) => Padding(
                      padding: EdgeInsets.only(left: (titles.first == e) ? defaultMargin : 0, right: defaultMargin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              if(onTap != null){
                                onTap(titles.indexOf(e));
                              }
                            },
                            child: Text(e,
                                style: (titles.indexOf(e) == selectedIndex)
                                    ? blackTextFont.copyWith(
                                        fontWeight: FontWeight.w500)
                                    : greyTextFont),
                          ),
                          Container(
                            width: (e.length * 10.0),
                            height: 3,
                            margin: EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                              color: (titles.indexOf(e)==selectedIndex)? Color(0xff020202) : Colors.transparent,
                              borderRadius: BorderRadius.circular(1.5)
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
