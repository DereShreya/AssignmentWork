import 'package:assignment_hutech_solutions/Dashboard/dashboard_screen.dart';
import 'package:assignment_hutech_solutions/Order/my_order.dart';
import 'package:assignment_hutech_solutions/Profile/profile.dart';
import 'package:assignment_hutech_solutions/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
String userCollection = "users";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: FirebaseOptions(
    apiKey: 'AIzaSyB7wZb2tO1-Fs6GbDADUSTs2Qs3w08Hovw',
    appId: '1:922440893098:android:4b01cae68b013a1b8986d3',
    messagingSenderId: '922440893098',
    projectId: 'assignment-ae461',
    // storageBucket: 'myapp-b9yt18.appspot.com',
  )
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    DashboardPage(),
    MyOrderPage(),
    Container(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          vertical: 10
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            navBarItem(Icon(Icons.home,color: _currentIndex == 0 ? ColorsClass.primaryColor:Colors.grey,), 'Home',0),
            navBarItem(Image.asset('assets/images/package.png',height: 25,color: _currentIndex == 1 ? ColorsClass.primaryColor:Colors.grey,), 'My Orders',1),
            navBarItem(Image.asset('assets/images/shopping_cart.png',height: 25,color: _currentIndex == 2 ? ColorsClass.primaryColor:Colors.grey,), 'Cart',2),
            navBarItem(Image.asset('assets/images/face.png',height: 25,color: _currentIndex == 3 ? ColorsClass.primaryColor:Colors.grey,), 'Profile',3),
          ],
        ),
      )
    );
  }

  navBarItem(icon,label,index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        children: [
          icon,
          SizedBox(height: 5,),
          Text(label,
          style: TextStyle(
            color: index==_currentIndex?ColorsClass.primaryColor:Colors.grey,

          ),
          )
        ],
      ),
    );
  }
  /*
  BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: ColorsClass.primaryColor,
        unselectedLabelStyle: TextStyle(
          color: Colors.black
        ),
        selectedLabelStyle: TextStyle(
            color: ColorsClass.primaryColor
        ),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/package.png',height: 25,),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/shopping_cart.png',height: 25,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/face.png',height: 25,),
            label: 'Profile',
          ),
        ],
      ),
  * */
}