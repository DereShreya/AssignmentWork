import 'dart:io';

import 'package:assignment_hutech_solutions/Profile/Model/UserModel.dart';
import 'package:assignment_hutech_solutions/constants/appBarWidget.dart';
import 'package:assignment_hutech_solutions/constants/colors.dart';
import 'package:assignment_hutech_solutions/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  XFile? image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEAECF0),
      appBar: AppBarWidget(context:context,title: 'Profile', isBackButton: false),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(userCollection).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            print("snapshot.data!.docs: ${snapshot.data!.docs}");
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
                          GestureDetector(
                            onTap: () async{
                              final ImagePicker picker = ImagePicker();
                               image = await picker.pickImage(source: ImageSource.camera);
                               setState(() {
                                 
                               });
                            },
                            child: CircleAvatar(
                              radius: 40,
                              child: image!=null? ClipRRect(
                                 borderRadius: BorderRadius.circular(50.0),
                                child: Image.file(File(image!.path),height: 100,width: 100,fit: BoxFit.fill, )):null,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text("${snapshot.data!.docs.isEmpty? "Name": snapshot.data!.docs[0]['name']}",
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
                    controller: nameController..text = snapshot.data!.docs.isEmpty?"":"${snapshot.data!.docs[0]['name']}",
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
                   TextFormField(
                    controller: phoneController..text = snapshot.data!.docs.isEmpty?"": "${snapshot.data!.docs[0]['phone']}",
                    readOnly: !enableEditButton,
                    keyboardType: TextInputType.number,
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
                  TextFormField(
                    controller: emailController..text = snapshot.data!.docs.isEmpty?"": "${snapshot.data!.docs[0]['email']}",
                    readOnly: !enableEditButton,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: practionerIDController..text = snapshot.data!.docs.isEmpty?"":"${snapshot.data!.docs[0]['practioner_id']}",
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
                    controller: billingAddressController..text = snapshot.data!.docs.isEmpty?"": "${snapshot.data!.docs[0]['billing_address']}",
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
    );
  }

  UserModel? userModel;
  updateUserIntoFirebase() async{
    userModel = UserModel(
      id: "users1",
      name: nameController.text.toString(),
      billingAddress: billingAddressController.text.toString(),
      email: emailController.text.toString(),
      phone: phoneController.text.toString(),
      practionerId: practionerIDController.text.toString(),
    );
    
    var currentUserDocument =
            await FirebaseFirestore.instance.collection(userCollection)
                .doc("users1").get();
    if (currentUserDocument.exists) {
      currentUserDocument.reference.update(userModel!.toJson());
      
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Updated Successfully')));
    }else{
      currentUserDocument.reference.set(userModel!.toJson());
      
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data Added Successfully')));
    }
  }
}