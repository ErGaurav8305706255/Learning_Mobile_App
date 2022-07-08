import 'package:flutter/material.dart';
import 'package:learning_mobile_app/constant/string_constant.dart';
import 'package:learning_mobile_app/signup.dart';
class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Center(
                    heightFactor: 4,
                    child: ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: const Image(image: AssetImage('assets/shikhbe.png'),height: 150,width: 300,fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                        }, child: Text(
                        StringConstants.skip,
                        style: TextStyle(
                        fontSize: 18,
                            fontWeight: FontWeight.bold
                      ),)),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                        }, child: Text(
                        StringConstants.next,
                        style: TextStyle(
                        fontSize: 18,
                            fontWeight: FontWeight.bold
                      ),)),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
