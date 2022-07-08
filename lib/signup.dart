import 'package:flutter/material.dart';
import 'package:learning_mobile_app/constant/color_constant.dart';
import 'package:learning_mobile_app/constant/icon_constant.dart';
import 'package:learning_mobile_app/constant/string_constant.dart';
import 'package:learning_mobile_app/constant/validate.dart';
import 'package:learning_mobile_app/constant/web_view_screen.dart';

import 'mobile_number_enter.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController textNameController = TextEditingController();
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  var _formKey2 = GlobalKey<FormState>();
  var _securetext = true;
  var value = '';


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey,width: 1))
                        ),
                          child: TabBar(
                              indicatorColor: Colors.blue[900],
                              indicatorWeight: 3,
                              labelColor: Colors.blue[900],
                              labelStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              unselectedLabelColor: Colors.grey,
                              unselectedLabelStyle: const TextStyle(fontSize: 13),
                              tabs: [
                                Tab(text: StringConstants.signup),
                                Tab(text: StringConstants.login),
                              ]),
                        ),
                      ),
                      SizedBox(height: 650,
                          child: TabBarView(
                              children: [
                                Form(key: _formKey,
                                  child: SizedBox(height: 550,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 30),
                                        TextFormField(
                                         validator: Validate.validateNameAddress,
                                          decoration: InputDecoration(
                                              filled: true,
                                              errorText: null,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide: BorderSide.none),
                                              fillColor: Colors.black12,
                                              hintText: StringConstants.name),
                                          controller: textNameController,
                                        ),
                                        SizedBox(height: 30),
                                        TextFormField(
                                          validator: Validate.validateEmailAddress,
                                          decoration: InputDecoration(
                                              filled: true,
                                              errorText: null,
                                              border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              borderSide: BorderSide.none),
                                              fillColor: Colors.black12,
                                              hintText: StringConstants.email,
                                          ),
                                          // controller: textEmailController,
                                        ),
                                        const SizedBox(height: 30),
                                        TextFormField(
                                         validator: Validate.validatePasswordAddress,
                                          decoration: InputDecoration(
                                            filled: true,
                                            errorText: null,
                                            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                borderSide: BorderSide.none),
                                            fillColor: Colors.black12,
                                            hintText: StringConstants.password,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                  _securetext ? Icons.remove_red_eye : Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  _securetext = !_securetext;
                                                });
                                              },
                                            ),
                                          ),
                                          obscureText: _securetext,
                                          controller: textPasswordController,
                                        ),
                                        const SizedBox(height: 60),
                                        InkWell(onTap: () {
                                          if (_formKey.currentState!.validate()) {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MobileNumberScreen()));
                                          }
                                        },
                                          child: Container(
                                            padding: const EdgeInsets.all(17),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: ColorConstants.buttonColor),
                                            child: Center(
                                              child: Text(StringConstants.signup,style: TextStyle(
                                                color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,
                                              )),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        const Center(child: Text('Or')),
                                        const SizedBox(height: 20),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const WebViewScreen(url: 'https://www.facebook.com/login/')));
                                            },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: ColorConstants.containerBorderColor,width: 2)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(IconConstant.facebook,fit: BoxFit.cover,height: 30,width: 30,),
                                                    const SizedBox(width: 5),
                                                    Text(StringConstants.facebook),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>  WebViewScreen(url: 'https://www.google.co.in/')));
                                            },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: ColorConstants.containerBorderColor,width: 2)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(IconConstant.google,fit: BoxFit.cover,width: 30,height: 30,),
                                                    const SizedBox(width: 5),
                                                    Text(StringConstants.google),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Form(key: _formKey2,
                                  child: SizedBox(height: 550,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 30),
                                        TextFormField(
                                          validator: Validate.validateEmailAddress,
                                          decoration:  InputDecoration(
                                              filled: true,
                                              errorText: null,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  borderSide: BorderSide.none),
                                              fillColor: Colors.black12,
                                              hintText: StringConstants.email),
                                          // controller: textEmailController,
                                        ),
                                        const SizedBox(height: 30),
                                        TextFormField(
                                          validator: Validate.validatePasswordAddress,
                                          decoration: InputDecoration(
                                            filled: true,
                                            errorText: null,
                                            border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                borderSide: BorderSide.none),
                                            fillColor: Colors.black12,
                                            hintText: StringConstants.password,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                  _securetext ? Icons.remove_red_eye : Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  _securetext = !_securetext;
                                                });
                                              },
                                            ),
                                          ),
                                          obscureText: _securetext,
                                          // controller: textPasswordController,
                                        ),
                                        const SizedBox(height: 60),
                                        InkWell(onTap: () {
                                          if (_formKey2.currentState!.validate()) {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MobileNumberScreen()));
                                          }
                                        },
                                          child: Container(
                                            padding: const EdgeInsets.all(17),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: ColorConstants.buttonColor),
                                            child: Center(
                                              child: Text(StringConstants.login,style: TextStyle(
                                                color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,
                                              )),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        const Center(child: Text('Or')),
                                        const SizedBox(height: 20),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewScreen(url: 'https://www.facebook.com/login/')));
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: ColorConstants.containerBorderColor,width: 2)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(IconConstant.facebook,fit: BoxFit.cover,height: 30,width: 30,),
                                                    const SizedBox(width: 5),
                                                    Text(StringConstants.facebook),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>  WebViewScreen(url: 'https://www.google.co.in/')));
                                            },
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(color: ColorConstants.containerBorderColor,width: 2)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(IconConstant.google,fit: BoxFit.cover,width: 30,height: 30,),
                                                    const SizedBox(width: 5),
                                                    Text(StringConstants.google),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]
                          )
                      )
                    ]
                ),
              ),
          )
        )
      ),
    );
  }

}
