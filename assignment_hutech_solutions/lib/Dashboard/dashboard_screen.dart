import 'package:assignment_hutech_solutions/ProductDetails/product_details.dart';
import 'package:assignment_hutech_solutions/constants/appBarWidget.dart';
import 'package:assignment_hutech_solutions/constants/colors.dart';
import 'package:assignment_hutech_solutions/constants/medicineTileItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key,});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 1;
  List<String> items = [
    "assets/images/banner.png",
    "assets/images/banner.png",
    "assets/images/banner.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context:context,title: 'PharmaConnect', isBackButton: false ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),

              CarouselSlider.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Container(
                    width:MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: 20
                    // ),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(items[itemIndex],fit: BoxFit.fill,),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 2,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  // autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.15,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Center(
                child: DotsIndicator(
                  dotsCount: items.length,
                  position: currentIndex,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sample Drugs",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Text(
                "List of drugs assigned to you",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),//(orientation == Orientation.portrait) ? 2 : 3
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsPage(
                          title: index==0?
                          'Revital Cal 500mg Strip Of 15 Tablets':
                          index==1?'Recombigen Dr. ORG New 3 In 1 Vaporizer':
                          index==2?'Dr. Morepen Blood Pressure Monitor Model Bp 14':
                          index==3?'Revital Cal 500mg Strip Of 15 Tablets':'',
                        )));
                      },
                      child: medicineItem(
                          index: index
                      ),
                    )
                  );
                },
              ),
               SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }

  gridTile({int ?index}){
    return Column(
      children: [
        Container(
          height: 180,
          width: 300,
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
                padding: const EdgeInsets.only(top:10.0),
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

                height: 100, ),
              Padding(
                padding: const EdgeInsets.only(right:10.0,bottom: 10.0),
                child: Align(
                  alignment:Alignment.bottomRight,
                  child: Image.asset('assets/images/btn.png',height: 40,),
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
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}