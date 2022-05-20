import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter/bloc/counter_bloc.dart';
import 'package:flutterbloc/bloc/counter/bloc/counter_cubit.dart';
import 'package:flutterbloc/pages/home_cubit_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CounterBloc())],
      child: MaterialApp(
        home: HomeCubitPage(),
      ),
    );
  }
}
