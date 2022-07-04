import 'package:flutter/material.dart';
import 'package:learning_mobile_app/tutorial.dart';
class ShikhbeScreen extends StatefulWidget {
  const ShikhbeScreen({Key? key}) : super(key: key);

  @override
  State<ShikhbeScreen> createState() => _ShikhbeScreenState();
}

class _ShikhbeScreenState extends State<ShikhbeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Image(image: AssetImage('assets/Shikhbe-shobai-logo.png'),height: 500,width: double.infinity,
                ),
              ),
              ClipRRect(borderRadius: BorderRadius.circular(40),
                child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TutorialScreen()));
                  },
                  child: Container(
                    height: 70,width: 70,
                    decoration: BoxDecoration(
                    color: Colors.blue[900],
                    ),
                    child: const Icon(Icons.arrow_forward,color: Colors.white,size: 30),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
