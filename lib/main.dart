import 'package:flutter/material.dart';
import 'package:onesignal/blocs/internet_bloc/internet_bloc.dart';
import 'package:onesignal/cubits/internet_cubit/internet_cubit.dart';
import 'package:onesignal/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => InternetBloc(),
      create: (context) => InternetCubit(),
      child: MaterialApp(
        title: 'Bloc Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}


