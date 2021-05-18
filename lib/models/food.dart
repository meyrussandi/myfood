part of 'models.dart';

class Food extends Equatable{
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate});

  @override
  List<Object> get props => [id,picturePath,name,description,ingredients,price,rate];
}


List <Food> dummyFoods = [
  Food(
      id: 1,
      picturePath: 'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2018/08/09/90225/cara-membuat-bakso-180809t-rev180810.jpg',
      name: 'Bakso Enak Banget',
      description: 'Bakso yang dibuat dengan urat urat pilihan , kenyal dimakan dan kenyang ditelan',
      ingredients: 'urat sapi, tepung pilihan, kaldu sapi',
      price: 15000,
      rate: 4.2
  ),
  Food(
      id: 2,
      picturePath: 'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2018/08/09/90225/cara-membuat-bakso-180809t-rev180810.jpg',
      name: 'Bakso Podomoro',
      description: 'Bakso yang dibuat dengan urat urat pilihan , kenyal dimakan dan kenyang ditelan',
      ingredients: 'urat sapi, tepung pilihan, kaldu sapi',
      price: 15000,
      rate: 4.2
  ),
  Food(
      id: 3,
      picturePath: 'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2018/08/09/90225/cara-membuat-bakso-180809t-rev180810.jpg',
      name: 'Bakso Malang',
      description: 'Bakso yang dibuat dengan urat urat pilihan , kenyal dimakan dan kenyang ditelan',
      ingredients: 'urat sapi, tepung pilihan, kaldu sapi',
      price: 15000,
      rate: 4.2
  )
];