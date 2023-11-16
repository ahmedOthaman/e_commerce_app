import 'package:e_comerce/utils/my_theme.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context,String message){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: MyTheme.mainColor,
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 12,),
                Text(message,
                  style:Theme.of(context).textTheme.titleMedium),
              ],
            ),
          );
        }
    );
  }

  static void hideDialog(BuildContext context ){
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context,
      String message,
      {String? title = 'title',
        String? posActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
        bool isDismisable =false,
      } ){
    List<Widget>actions=[];
    if(posActionName !=null){
      actions.add(TextButton(
        onPressed:(){
          Navigator.pop(context);
          posAction?.call();
        },
        child: Text(posActionName,style:Theme.of(context).textTheme.titleMedium!.copyWith(
          color: MyTheme.whiteColor,
        ),),
      ),);
    }
    if(negActionName !=null){
      actions.add(TextButton(
        onPressed:(){
          Navigator.pop(context);
          negAction?.call();
        },
        child: Text(negActionName),
      ),);
    }
    showDialog(context: context,
        barrierDismissible: isDismisable,
        builder:(context){
          return AlertDialog(backgroundColor: MyTheme.mainColor,
            title: Text(title!,style:Theme.of(context).textTheme.titleMedium!.copyWith(
              color: MyTheme.whiteColor,
            )),
            content:Text(message,style:Theme.of(context).textTheme.titleMedium) ,
            actions: actions,
            titleTextStyle: TextStyle(
                color: Theme.of(context).primaryColor
            ),
            contentTextStyle: TextStyle(
              color: Colors.black,
            ),
          );
        }
    );
  }
}