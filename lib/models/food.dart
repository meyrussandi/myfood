part of 'models.dart';

enum FoodType { new_food, popular, recomended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> foodType;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.foodType});

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> dummyFoods = [
  Food(
      id: 1,
      picturePath:
          'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2018/08/09/90225/cara-membuat-bakso-180809t-rev180810.jpg',
      name: 'Bakso Enak Banget',
      description: 'Bakso yang dibuat dengan urat urat pilihan , kenyal dimakan dan kenyang ditelan',
      ingredients: 'urat sapi, tepung pilihan, kaldu sapi',
      price: 15000,
      rate: 4.2,
      foodType: [FoodType.new_food, FoodType.popular, FoodType.recomended]),
  Food(
    id: 2,
    picturePath:
        'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2018/08/09/90225/cara-membuat-bakso-180809t-rev180810.jpg',
    name: 'Bakso Podomoro',
    description:
        'Bakso yang dibuat dengan urat urat pilihan , kenyal dimakan dan kenyang ditelan',
    ingredients: 'urat sapi, tepung pilihan, kaldu sapi',
    price: 13000,
    rate: 4.2,
    foodType: [FoodType.popular]
  ),
  Food(
      id: 3,
      picturePath:
          'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2018/08/09/90225/cara-membuat-bakso-180809t-rev180810.jpg',
      name: 'Bakso Malang',
      description: 'Bakso yang dibuat dengan urat urat pilihan , kenyal dimakan dan kenyang ditelan',
      ingredients: 'urat sapi, tepung pilihan, kaldu sapi',
      price: 10000,
      rate: 4.2,
      foodType: [FoodType.new_food]),
  Food(
      id: 4,
      picturePath:
          'https://cdns.klimg.com/dream.co.id/resized/640x320/news/2018/08/09/90225/cara-membuat-bakso-180809t-rev180810.jpg',
      name: 'Bakso Tusuk',
      description: 'Bakso sederhana dengan sekali tusuk mendapatkan kenikmatan',
      ingredients: 'urat sapi, tepung pilihan, kaldu sapi',
      price: 5000,
      rate: 5,
      foodType: [FoodType.recomended]),
];
