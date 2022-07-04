import 'package:flutter/material.dart';
import 'package:learning_mobile_app/validate.dart';
import 'package:learning_mobile_app/web_view_container.dart';
import 'package:learning_mobile_app/web_view_facebook.dart';

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
                              tabs: const [
                                Tab(text: 'SignUp'),
                                Tab(text: 'Login'),
                              ]),
                        ),
                      ),
                      SizedBox(height: 550,
                          child: TabBarView(
                              children: [
                                SizedBox(height: 550,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 30),
                                      TextField(
                                        decoration: const InputDecoration(
                                            filled: true,
                                            errorText: null,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                borderSide: BorderSide.none),
                                            fillColor: Colors.black12,
                                            hintText: 'Enter Your Name'),
                                        controller: textNameController,
                                      ),
                                      const SizedBox(height: 30),
                                      TextField(decoration: const InputDecoration(filled: true, border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          borderSide: BorderSide.none),
                                          fillColor: Colors.black12,
                                          hintText: 'Enter Your Email Id'),
                                        controller: textEmailController,
                                      ),
                                      const SizedBox(height: 30),
                                      TextField(
                                        decoration: InputDecoration(
                                            filled: true,
                                          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              borderSide: BorderSide.none),
                                          fillColor: Colors.black12,
                                            hintText: 'Enter Your Password',
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
                                        if(textNameController.text.length >= 3){
                                          if(textEmailController.text.isNotEmpty){
                                            if (textPasswordController.text.isNotEmpty){
                                              String? msg1 = Validate.validateNameAddress(
                                                  textNameController.text);
                                              String? msg2 = Validate.validateEmailAddress(
                                                  textEmailController.text);
                                              String? msg3= Validate.validatePasswordAddress(
                                                  textPasswordController.text);
                                              if(msg1 == null){
                                                if(msg2 == null){
                                                  if(msg3 == null){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MobileNumberScreen()));
                                                  }
                                                  else{
                                                    var snackBar = SnackBar(
                                                        content: Text(msg3));
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                        snackBar);
                                                  }
                                                }
                                                else{
                                                  var snackBar = SnackBar(
                                                      content: Text(msg2));
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                      snackBar);
                                                }
                                              }
                                              else{
                                                var snackBar = SnackBar(
                                                    content: Text(msg1));
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    snackBar);
                                              }
                                            }
                                            else {
                                              var snackBar = const SnackBar(
                                                  content: Text('Please Enter your password'));
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  snackBar);
                                            }
                                          }
                                          else {
                                            var snackBar = const SnackBar(
                                                content: Text('Please Enter your Email'));
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                snackBar);
                                          }
                                        }
                                        else {
                                          var snackBar = const SnackBar(
                                              content: Text('Please Enter your Name'));
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              snackBar);
                                        }
                                      },
                                        child: Container(
                                          padding: const EdgeInsets.all(17),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.blue[900]),
                                          child: const Center(
                                            child: Text('SignUp',style: TextStyle(
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const WebViewFacebook()));
                                          },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Colors.blue,width: 2)
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/fb.png',fit: BoxFit.cover,height: 30,width: 30,),
                                                  const SizedBox(width: 5),
                                                  const Text('Facebook'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const WebViewGoogle()));
                                          },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Colors.blue,width: 2)
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/google.png',fit: BoxFit.cover,width: 30,height: 30,),
                                                  const SizedBox(width: 5),
                                                  const Text('Google'),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 550,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 30),
                                      TextField(
                                        decoration: const InputDecoration(
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                borderSide: BorderSide.none),
                                            fillColor: Colors.black12,
                                            hintText: 'Enter Your Email Id'),
                                        controller: textEmailController,
                                      ),
                                      const SizedBox(height: 30),
                                      TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              borderSide: BorderSide.none),
                                          fillColor: Colors.black12,
                                          hintText: 'Enter Your Password',
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
                                        if(textEmailController.text.isNotEmpty){
                                          if(textPasswordController.text.isNotEmpty){
                                            String? msg4 = Validate.validateEmailAddress(
                                                textEmailController.text);
                                            String? msg5 = Validate.validatePasswordAddress(
                                                textPasswordController.text);
                                            if(msg4 == null){
                                              if(msg5 == null){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const MobileNumberScreen()));
                                              }
                                              else{
                                                var snackBar = SnackBar(
                                                    content: Text(msg5));
                                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              }
                                            }
                                            else{
                                              var snackBar = SnackBar(
                                                  content: Text(msg4));
                                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                            }
                                          }
                                          else{
                                            var snackBar = const SnackBar(
                                                content: Text('Enter Your Password'));
                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          }
                                        }
                                        else {
                                          var snackBar = const SnackBar(
                                              content: Text('Enter your Email id'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                        child: Container(
                                          padding: const EdgeInsets.all(17),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.blue[900]),
                                          child: const Center(
                                            child: Text('Login',style: TextStyle(
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
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const WebViewFacebook()));
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Colors.blue,width: 2)
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/fb.png',fit: BoxFit.cover,height: 30,width: 30,),
                                                  const SizedBox(width: 5),
                                                  const Text('Facebook'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const WebViewGoogle()));
                                          },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Colors.blue,width: 2)
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset('assets/google.png',fit: BoxFit.cover,width: 30,height: 30,),
                                                  const SizedBox(width: 5),
                                                  const Text('Google'),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
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
