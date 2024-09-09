import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/MyApp.dart';
import 'package:football_app/core/Di/di.dart';
import 'package:football_app/core/api/api_manger.dart';
import 'package:football_app/presentation/observer/BlocObserver.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  ApiManger.init();
  runApp(const Myapp());
}
