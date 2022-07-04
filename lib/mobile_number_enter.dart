
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_mobile_app/signup.dart';
import 'package:learning_mobile_app/validate.dart';
import 'otp_verification.dart';
class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {

  TextEditingController textMobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                        child: Icon(Icons.arrow_back,color: Colors.blue[900],size: 30,)),
                    Column(
                      children: [
                        const SizedBox(height: 40,),
                        Text("Let's Get Started",style: TextStyle(
                          color: Colors.blue[900],fontSize: 20,fontWeight: FontWeight.bold,
                        )),
                        const SizedBox(height: 15),
                        const Text('Enter Your Mobile Number'),
                        const Text('and enable 2 step verification')
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)
                ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        initialSelection: 'IN',
                      ),
                      Container(
                        color: Colors.black,
                        width: 1,
                        height: 30,
                      ),
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: 'Mobile number',border: InputBorder.none,
                            ),
                          controller: textMobileNumberController,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                InkWell(onTap: () {
                  if(textMobileNumberController.text.isNotEmpty){
                    String? msg6 = Validate.validateMobileAddress(textMobileNumberController.text);
                    if(msg6 == null){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpVerificationScreen()));
                    }
                    else{
                      var snackBar = SnackBar(
                          content: Text(msg6));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                  else{
                    var snackBar = const SnackBar(content: Text('Enter your Mobile Number'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[900]),
                    child: const Center(
                      child: Text('Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
//