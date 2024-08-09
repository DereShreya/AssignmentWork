import 'package:flutter/material.dart';
import 'package:assignment_hutech_solutions/constants/colors.dart';

Widget medicineItem({int ?index}){
  return Column(
    children: [
      Container(
        height:140,
        // width: 300,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(
            bottom: 5
        ),
        decoration: BoxDecoration(
            color:index==0?
            ColorsClass.pinkColor:
            index==1?ColorsClass.yellowColor:
            index==2?ColorsClass.blueColor :
            index==3?ColorsClass.greenColor:
            ColorsClass.blueColor,

            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)
            )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:0.0),
              child: Align(
                alignment:Alignment.topLeft,
                child: Container(
                    height: 20,
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color:index==0?
                        ColorsClass.titlepinkColor:
                        index==1?ColorsClass.titleyelloColor:
                        index==2?ColorsClass.titleblueColor:
                        index==3?ColorsClass.titlegreenColor:
                        ColorsClass.titlegreenColor,

                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight:Radius.circular(20),
                        )
                    ),
                    child: Text("Alloted: 12 units",style: TextStyle(fontSize: 14),)),
              ),
            ),
            Image.asset(
              index==0?
              "assets/images/image1.png":
              index==1?"assets/images/image2.png":
              index==2?"assets/images/image3.png":
              index==3?"assets/images/image4.png":
              "assets/images/image5.png",

              height: 60, ),
            Padding(
              padding: const EdgeInsets.only(top: 5,right:10.0),
              child: Align(
                alignment:Alignment.bottomRight,
                child: Image.asset('assets/images/btn.png',height: 30,),
              ),
            )
          ],
        ),
      ),
      Text(
        index==0?
        'Revital Cal 500mg Strip Of 15 Tablets':
        index==1?'Recombigen Dr. ORG New 3 In 1 Vaporizer':
        index==2?'Dr. Morepen Blood Pressure Monitor Model Bp 14':
        index==3?'Revital Cal 500mg Strip Of 15 Tablets':'',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
        ),
      )
   
       ],
  );
}