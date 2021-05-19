import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfood/cubit/cubit.dart';
import 'package:myfood/models/models.dart';
import 'package:myfood/ui/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>UserCubit()),
          BlocProvider(create: (_)=>FoodCubit()),
          BlocProvider(create: (_)=>TransactionCubit()),
        ],
        child: GetMaterialApp(debugShowCheckedModeBanner: false, home: SignInPage()));
  }
}
