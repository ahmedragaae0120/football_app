import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/presentation/layouts/home/home_view.dart';
import 'package:football_app/presentation/layouts/onboarding/onboarding_view.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeCurrentIndex({required int newIndex}) {
    if (currentIndex == newIndex) return;
    currentIndex = newIndex;
    emit(ChangeCurrentIndexState());
  }

  String? startRoute;
  void cheekAuth() {
    if (FirebaseAuth.instance.currentUser == null) {
      currentIndex = 0;
      startRoute = OnboardingView.routeName;
    } else {
      currentIndex = 0;
      startRoute = HomeView.routeName;
    }
  }
}
