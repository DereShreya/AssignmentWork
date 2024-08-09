import 'package:assignment_hutech_solutions/constants/appBarWidget.dart';
import 'package:assignment_hutech_solutions/constants/colors.dart';
import 'package:assignment_hutech_solutions/constants/medicineTileItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.title});

  final String title;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int currentIndex = 1;
  List<String> items = [
    "assets/images/image1.png",
    "assets/images/banner.png",
    "assets/images/banner.png"
  ];
  String textPara=
  '''
  <p>Dr. Odin BPCBOA 3H Blood Pressure Machine&nbsp;is a fully automatic digital blood pressure monitor device that enables a high-speed and reliable measurement of systolic and diastolic blood pressure as well as the pulse through the oscillometric method.</p>
<p><strong>Uses:</strong><br>
<p>It is used for measuring the blood pressure of individuals </p>
<p><strong>Product Features And Specifications:</strong></p>
<ul>
<li>It has a portable design which makes it easy to carry anywhere at any time.<strong><br /></strong></li>
<li>It has a automatic shutdown function which saves power</li>
<li>It can support 2 users at a time with 120 memories each</li>
<li>It helps to measure irregular heartbeat as well</li>
<li>It comes with a large LED display</li>
<li>It has dual power modes i.e. it is chargeable with a USB power source or it can be powered with 4 AA alkaline batteries</li>
<li>It has an average value function that helps to analyse blood pressure variation</li>
<li>It has a one button easy operation</li>
</ul>
<p><strong>Directions For Use:</strong></p>
<p>Use as directed on the label</p>
<p><strong>Safety Information:</strong></p>
<ul>
<li>Store in a cool and dry place away from direct sunlight</li>
<li>Read the product manual carefully before use</li>
<li>Keep out of reach of children</li>
</ul>
<p>&nbsp;</p>
  ''';
  int itemCount= 1;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBarWidget(context:context,title: widget.title, isBackButton: true),
      body: Column(
        children: [
          Expanded(
              flex: 9,
              child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Dr. Odin BPCBOA 3H Blood Pressure Machine",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'FREE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),),
                      TextSpan(text: ' Sample ',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14
                        ),
                      ),
                      WidgetSpan(
                        child: Container(
                          width: 70,
                          height: 15,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: ColorsClass.blueColor,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text(
                            "TRIAL",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF10676E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20,bottom: 30),
                color: Color(0xFFC5E2FD),
                child: Text("Maximum of 12 unit can be added in the cart.",
                  style: TextStyle(
                      fontSize: 11
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10),
                child: Text("Product Information",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: HtmlWidget(textPara,
                  textStyle: TextStyle(
                      fontSize: 10
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Especially for you",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "List of drugs assigned to you",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width/2,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: medicineItem(
                              index: index
                          ),
                        );
                      }),
                ),
              )
            ],
          )),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
              children: [
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1
                        )
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: (){
                           if(itemCount>1){
                             setState(() {
                               itemCount--;
                             });
                           }
                          },
                          child: Icon(Icons.remove,size: 16,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                         itemCount.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            if(itemCount<12){
                              setState(() {
                                itemCount++;
                              });
                            }
                          },
                          child: Icon(Icons.add,size: 16,))
                    ],
                  ),
                )),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  color: ColorsClass.primaryColor,
                  child: Text("Place Order >",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),)
                ))
              ],
                        ),
            ))
        ],
      )
   );
  }
}