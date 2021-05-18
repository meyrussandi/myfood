part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});


  @override
  List<Object> get props => [id, name, email, address, houseNumber, phoneNumber, city, picturePath];

}


User dummyUser = User(
    id: 1,
  name: 'Isyana Sarasvati',
  email: 'isyana@mail.com',
  address: 'jl. boulevard barat',
    houseNumber: '4D',
  phoneNumber: '0833898306293',
  picturePath: 'https://disk.mediaindonesia.com/thumbs/1800x1200/news/2018/10/6d6c224641cdcff679e89c90ba2f7b8c.jpg',
  city: 'Jakarta'
);