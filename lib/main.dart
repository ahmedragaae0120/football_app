import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/MyApp.dart';
import 'package:football_app/core/Di/di.dart';
import 'package:football_app/core/api/api_manger.dart';
import 'package:football_app/core/local/shared_preferences_helper.dart';
import 'package:football_app/firebase_options.dart';
import 'package:football_app/presentation/layouts/home/view_model/cubit/home_cubit.dart';
import 'package:football_app/presentation/observer/BlocObserver.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferencesHelper.init();
  Bloc.observer = MyBlocObserver();
  ApiManger.init();
  runApp(BlocProvider(
    create: (context) => HomeCubit()..cheekAuth(),
    child: const Myapp(),
  ));
}
