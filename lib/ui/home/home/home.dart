import 'package:e_comerce/ui/home/home/cubit/home_screen_view_model.dart';
import 'package:e_comerce/ui/home/home/cubit/home_states.dart';
import 'package:e_comerce/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Home extends StatelessWidget {
  static const String routeName='homeTabs';

  HomeScreenViewModel viewModel =HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel,HomeScreenStates>(
      bloc: viewModel,
        listener: (context,state){

        },
      builder: (context, state){
        return   Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyTheme.mainColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: MyTheme.mainColor,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                currentIndex: viewModel.selectIndex,
                onTap: (index) {
                  viewModel.ChangeBottomNavBar(index);
                },
                items: [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: CircleAvatar(
                      foregroundColor:  viewModel.selectIndex==0?MyTheme.mainColor:MyTheme.whiteColor,
                      backgroundColor:  viewModel.selectIndex==0?MyTheme.whiteColor:MyTheme.mainColor,
                      radius: 20.r,
                      child: ImageIcon(
                        size:40.sp,
                        AssetImage(
                            'assets/images/home.png'
                        ),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Category',
                    icon: CircleAvatar(
                      foregroundColor:  viewModel.selectIndex==1?MyTheme.mainColor:MyTheme.whiteColor,
                      backgroundColor:  viewModel.selectIndex==1?MyTheme.whiteColor:MyTheme.mainColor,
                      radius: 20.r,
                      child: ImageIcon(
                        size:40.sp,
                        AssetImage(
                            'assets/images/product.png'
                        ),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Favorite',
                    icon: CircleAvatar(
                      foregroundColor:  viewModel.selectIndex==2?MyTheme.mainColor:MyTheme.whiteColor,
                      backgroundColor:  viewModel.selectIndex==2?MyTheme.whiteColor:MyTheme.mainColor,
                      radius: 20.r,
                      child: ImageIcon(
                        size:40.sp,
                        AssetImage(
                            'assets/images/fav.png'
                        ),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Account',
                    icon: CircleAvatar(
                      foregroundColor:  viewModel.selectIndex==3?MyTheme.mainColor:MyTheme.whiteColor,
                      backgroundColor:  viewModel.selectIndex==3?MyTheme.whiteColor:MyTheme.mainColor,
                      radius: 20.r,
                      child: ImageIcon(
                        size:40.sp,
                        AssetImage(
                            'assets/images/account.png'
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: viewModel.Tabs[ viewModel.selectIndex] ,
        );
      },
    );

  }
}
