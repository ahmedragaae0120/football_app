import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}
