import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/internet_bloc/internet_bloc.dart';
import '../blocs/internet_bloc/internet_state.dart';
import '../cubits/internet_cubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            // child: BlocConsumer<InternetBloc, InternetState>(
            child: BlocConsumer<InternetCubit, InternetState>(
                listener: (context, state) {
              if (state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Connected To Internet"),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Internet Connection Lost"),
                  backgroundColor: Colors.red,
                ));
              }
            }, builder: (BuildContext context, InternetState state) {
              if (state == InternetState.Gained) {
                return Text('Connected To Internet');
              } else if (state == InternetState.Lost) {
                return Text('Internet Connection Lost');
              } else {
                return Text('Loading.....');
              }
            }),
            // child: BlocBuilder<InternetBloc, InternetState>(
            //   builder: (context, state) {
            //     if (state is InternetGainedState) {
            //       return Text('Connected To Internet');
            //     } else if (state is InternetLostState) {
            //       return Text('Internet Connection Lost');
            //     } else {
            //       return Text('Loading.....');
            //     }
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
