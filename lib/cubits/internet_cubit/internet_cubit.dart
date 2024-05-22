import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

enum InternetState { Initial, Lost, Gained }

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState.Initial){
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.wifi||result == ConnectivityResult.mobile){
        emit(InternetState.Gained);
      }else{
        emit(InternetState.Lost);
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}
