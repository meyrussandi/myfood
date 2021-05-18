part of 'models.dart';

enum TransactionStatus { delivered, on_delivered, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;

  Transaction(
      {this.id,
      this.food,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user});

  //metod ini digunakan untuk update data, karena semua field final jadi harus buat metod ini
  Transaction copyWith(
      {int id,
      Food food,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus status,
      User user}) {
    return Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  @override
  List<Object> get props => [id, food, quantity, total, dateTime, status, user];
}

List<Transaction> dummyTransaction = [
  Transaction(
      id: 1,
      food: dummyFoods[0],
      quantity: 10,
      total: (dummyFoods[0].price * 10 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.on_delivered,
      user: dummyUser),
  Transaction(
      id: 2,
      food: dummyFoods[1],
      quantity: 7,
      total: (dummyFoods[1].price * 10 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.delivered,
      user: dummyUser),
  Transaction(
      id: 3,
      food: dummyFoods[2],
      quantity: 5,
      total: (dummyFoods[2].price * 10 * 1.1).round() + 50000,
      dateTime: DateTime.now(),
      status: TransactionStatus.cancelled,
      user: dummyUser),
];
