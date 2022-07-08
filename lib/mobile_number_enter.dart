import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_mobile_app/constant/color_constant.dart';
import 'package:learning_mobile_app/constant/string_constant.dart';
import 'package:learning_mobile_app/signup.dart';
import 'package:learning_mobile_app/constant/validate.dart';
import 'otp_verification.dart';
class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {

  // TextEditingController textMobileNumberController = TextEditingController();

   var _formKey = GlobalKey<FormState>();
  var value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.backgroundColor,
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
                        Text("Let's Get Started",
                            style: TextStyle(
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
                  decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)
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
                        child: Form(key: _formKey,
                          child: TextFormField(
                            validator: Validate.validateMobileAddress,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: StringConstants.mobile,
                              border: InputBorder.none,
                            ),
                            // controller: textMobileNumberController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                InkWell(onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen()));
                  }
                },
                  child: Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.buttonColor),
                    child: Center(
                      child: Text(StringConstants.conti,
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