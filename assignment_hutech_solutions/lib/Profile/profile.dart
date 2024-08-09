import 'package:assignment_hutech_solutions/Profile/Model/UserModel.dart';
import 'package:assignment_hutech_solutions/constants/appBarWidget.dart';
import 'package:assignment_hutech_solutions/constants/colors.dart';
import 'package:assignment_hutech_solutions/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key,});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController practionerIDController = TextEditingController();
  TextEditingController billingAddressController = TextEditingController();
  bool enableEditButton = false;

  @override
  void initState() {
    // getUserInfoFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEAECF0),
      appBar: AppBarWidget(context:context,title: 'Profile', isBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text("Dr.Rachel Green",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              enableEditButton = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child:Text("Edit Profile",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Name",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),

            new TextFormField(
              controller: nameController,
              readOnly: !enableEditButton,
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Name",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            //phone
            SizedBox(
              height: 20,
            ),
            Text("Phone",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new TextFormField(
              controller: phoneController,
              readOnly: !enableEditButton,
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Phone",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            //email
            SizedBox(
              height: 20,
            ),
            Text("Email",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new TextFormField(
              controller: emailController,
              readOnly: !enableEditButton,
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            //Practioner ID
            SizedBox(
              height: 20,
            ),
            Text("Practioner ID",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: practionerIDController,
              readOnly: !enableEditButton,
              decoration:  InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "wdfdavbv",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            //billing address
            SizedBox(
              height: 20,
            ),
            Text("Billing Address",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new TextFormField(
              controller: billingAddressController,
              readOnly: !enableEditButton,
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "1234 Health St., Med City, State 56789, USA",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Visibility(
              visible: enableEditButton,
              child: GestureDetector(
                onTap: (){
                  updateUserIntoFirebase();
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  color: ColorsClass.primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  UserModel? userModel;
  updateUserIntoFirebase() async{
    userModel = UserModel(
      id: "users1",
      name: nameController.text,
      billingAddress: billingAddressController.text,
      email: emailController.text,
      phone: phoneController.text,
      practionerId: practionerIDController.text
    );
    var currentUserDocument =
            await FirebaseFirestore.instance.collection(userCollection)
                .doc("users1").get();
    if (currentUserDocument.exists) {
      currentUserDocument.reference.update(userModel!.toJson());
      var snackBar = SnackBar(content: Text('Hello World'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      currentUserDocument.reference.set(userModel!.toJson());
      var snackBar = SnackBar(content: Text('Hello World2'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

/*
StreamBuilder(
        stream: FirebaseFirestore.instance.collection(userCollection).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text("Dr.Rachel Green",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  enableEditButton = true;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child:Text("Edit Profile",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Name",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                new TextFormField(
                controller: nameController,
                readOnly: !enableEditButton,
                decoration: new InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Name",
                  labelStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                ),
                ),

                //phone
                SizedBox(
                  height: 20,
                ),
                Text("Phone",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                new TextFormField(
                  controller: phoneController,
                  readOnly: !enableEditButton,
                  decoration: new InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Phone",
                    labelStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                      // ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                  ),
                ),

                //email
                SizedBox(
                  height: 20,
                ),
                Text("Email",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                new TextFormField(
                  controller: emailController,
                  readOnly: !enableEditButton,
                  decoration: new InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                      // ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                  ),
                ),

                //Practioner ID
                SizedBox(
                  height: 20,
                ),
                Text("Practioner ID",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                 TextFormField(
                  controller: practionerIDController,
                  readOnly: !enableEditButton,
                  decoration:  InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "wdfdavbv",
                    labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                      // ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                  ),
                ),

                //billing address
                SizedBox(
                  height: 20,
                ),
                Text("Billing Address",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                new TextFormField(
                  controller: billingAddressController,
                  readOnly: !enableEditButton,
                  decoration: new InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "1234 Health St., Med City, State 56789, USA",
                    labelStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                      // ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                Visibility(
                  visible: enableEditButton,
                  child: GestureDetector(
                    onTap: (){
                      updateUserIntoFirebase();
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      color: ColorsClass.primaryColor,
                      alignment: Alignment.center,
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),

Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text("Dr.Rachel Green",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              enableEditButton = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child:Text("Edit Profile",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Name",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),

            new TextFormField(
              controller: nameController,
              readOnly: !enableEditButton,
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Name",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            //phone
            SizedBox(
              height: 20,
            ),
            Text("Phone",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new TextFormField(
              controller: phoneController,
              readOnly: !enableEditButton,
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Phone",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            //email
            SizedBox(
              height: 20,
            ),
            Text("Email",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new TextFormField(
              controller: emailController,
              readOnly: !enableEditButton,
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            //Practioner ID
            SizedBox(
              height: 20,
            ),
            Text("Practioner ID",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: practionerIDController,
              readOnly: !enableEditButton,
              decoration:  InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "wdfdavbv",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            //billing address
            SizedBox(
              height: 20,
            ),
            Text("Billing Address",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new TextFormField(
              controller: billingAddressController,
              readOnly: !enableEditButton,
              decoration: new InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "1234 Health St., Med City, State 56789, USA",
                labelStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  // ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Visibility(
              visible: enableEditButton,
              child: GestureDetector(
                onTap: (){
                  updateUserIntoFirebase();
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  color: ColorsClass.primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
* */