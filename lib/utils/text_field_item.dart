import 'package:e_comerce/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldItem extends StatelessWidget {
  String fullName;
  String hintText;
  Widget? suffixcIcon;
  bool isObscuer;
  var keyBoardType;
  String? Function(String?)? validator;
  TextEditingController controller;
CustomTextFieldItem({
    required this.fullName,
  required this.hintText,
  this.suffixcIcon,
  this.isObscuer=false,
  this.keyBoardType=TextInputType.text,
  required this.controller,
  required Function(String?)? validator,
});
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Text(
        fullName,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.start,
      ),
      Padding(
        padding: EdgeInsets.only(top: 24.h,bottom: 20.h),
        child: TextFormField(
          decoration: InputDecoration(

            fillColor: MyTheme.whiteColor,
            filled: true,
            hintText: hintText,
            suffixIcon: suffixcIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color:MyTheme.blackColor,
              fontWeight: FontWeight.w300,

            ),

          ),
          style: TextStyle(color: MyTheme.blackColor),
          controller: controller,
          validator: validator,
          obscureText: isObscuer,
          keyboardType: keyBoardType,
        ),
      ) ,
      ],
    );
  }
}
