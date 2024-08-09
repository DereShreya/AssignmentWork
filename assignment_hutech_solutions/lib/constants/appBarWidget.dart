import 'package:assignment_hutech_solutions/constants/colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget AppBarWidget({required BuildContext context,required String title, required bool isBackButton}){
  return AppBar(
    backgroundColor: ColorsClass.primaryColor,
    leading: isBackButton?InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back,color: Colors.white,)):SizedBox(),
    title: Text("$title",
    style: TextStyle(
      fontSize: 16,
      color: Colors.white
    ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    actions: [
      Image.asset("assets/images/notification.png",height: 35,width: 35,)
    ],
  );
}