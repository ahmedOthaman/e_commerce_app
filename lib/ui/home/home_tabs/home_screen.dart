import 'package:e_comerce/ui/home/home_tabs/image_slider.dart';
import 'package:e_comerce/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/Group 5.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                   hintText: 'what do you search for?',
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: MyTheme.textColor,fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.search,size: 30,color: MyTheme.mainColor.withOpacity(0.75),),
                  ),

                ),
              ),
              SizedBox(width: 12,),
              InkWell(
                onTap: (){},
                  child: Icon(Icons.shopping_cart_outlined,
                    size: 30,color: MyTheme.mainColor,),
              ),
            ],
          ),
        ),
        ImageSlider(),
        // const SizedBox(
        //   height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories',style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: MyTheme.mainColor,
            ),),
            InkWell(
              onTap: (){},
              child: Text('View All',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyTheme.mainColor,
              ),),
            ),
          ],
        ),

        Expanded(flex: 1,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
              itemBuilder:(context,index){
               return Column(
                 children: [
                   CircleAvatar(
                      radius: 35.sp,
                      child: Image.network(
                          'https://t3.ftcdn.net/jpg/03/28/90/46/360_F_328904668_uECC7d3rtMkWCzEXGUlrnoBFNgKNQMvA.webp',
                      fit: BoxFit.cover,
                        width: 60.w,
                        height: 55.h,
                      ),
                    ),
                   Text('Ahmed'),
                 ],
               );
              },
            separatorBuilder: (context,index)=> SizedBox(width: 20.w,),
            itemCount: 10,
          ),
        ),
        Expanded(flex: 1,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index){
              return Column(
                children: [
                  CircleAvatar(
                    radius: 35.sp,
                    child: Image.network('https://t3.ftcdn.net/jpg/03/28/90/46/360_F_328904668_uECC7d3rtMkWCzEXGUlrnoBFNgKNQMvA.webp'),
                  ),
                  Text('Ahmed'),
                ],
              );
            },
            separatorBuilder: (context,index)=> SizedBox(width: 20.w,),
            itemCount: 10,
          ),
        ),
        // ScreenUtil(
        //
        // ),
      ],

          );
  }
}
