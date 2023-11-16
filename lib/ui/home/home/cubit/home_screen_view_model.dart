import 'package:e_comerce/ui/home/home/cubit/home_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../category_tabs/proudact.dart';
import '../../favorite_tabs/favorite.dart';
import '../../home_tabs/home_screen.dart';
import '../../profile_tabs/profile.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel ():super(HomeInitialState());
  int selectIndex = 0;
  List<Widget>Tabs=[
    HomeTab(),
    ProudactTab(),
    ProfileTab(),
    FavoriteTab(),
  ];
void ChangeBottomNavBar(int newSelectedIndex){

  emit(HomeInitialState());
  selectIndex=newSelectedIndex;
  emit(HomeBottomNavBarState());

}
}