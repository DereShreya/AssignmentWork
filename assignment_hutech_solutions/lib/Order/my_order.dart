import 'package:assignment_hutech_solutions/constants/appBarWidget.dart';
import 'package:assignment_hutech_solutions/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context:context,title: 'My Orders', isBackButton: true),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order:#123456",style: TextStyle(
                                fontSize: 14
                            ),),
                            Icon(Icons.arrow_forward,
                              color: Colors.blue,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      Divider(),

                      Padding(
                        padding:EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.asset('assets/images/ecg.png',height: 50,width: 50,),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: 'Delivered ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color: Color(0xFF219653)
                                        ),),
                                      TextSpan(text: 'on 21 Apr, 24',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text("+5 items",style: TextStyle(
                                    fontSize: 10
                                ),),
                              ],
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text("Track Order",
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF14818A),
                                  color: Color(0xFF14818A)
                                ),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          )

        ],
      ),
    );
  }
}