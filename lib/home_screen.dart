import 'package:flutter/material.dart';
import 'package:learning_mobile_app/constant/color_constant.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> items=["Design","Development", "Marketing", "Product", "Implementation", "Testing"];


  final List item=[
    {
      'image': 'https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/6/5/2/652a7adb1b_98148_01-intro-773.jpg',
      'title':'UI/UX Design',
      'subtitle': 'BDT 9000',
    },
    {
      'image': 'https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/6/5/2/652a7adb1b_98148_01-intro-773.jpg',
      'title':'Web Design',
      'subtitle': 'BDT 8500',
    },
    {
      'image': 'https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/6/5/2/652a7adb1b_98148_01-intro-773.jpg',
      'title':'UI/UX Design',
      'subtitle': 'BDT 9000',
    },
    {
      'image': 'https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/6/5/2/652a7adb1b_98148_01-intro-773.jpg',
      'title':'Web Design',
      'subtitle': 'BDT 8500',
    },
    {
      'image': 'https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/6/5/2/652a7adb1b_98148_01-intro-773.jpg',
      'title':'UI/UX Design',
      'subtitle': 'BDT 9000',
    },
    {
      'image': 'https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/6/5/2/652a7adb1b_98148_01-intro-773.jpg',
      'title':'Web Design',
      'subtitle': 'BDT 8500',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(40),
                          child: Image.asset('assets/shikhbe.png',height: 60,width: 60,fit: BoxFit.cover,)),
                      const SizedBox(width: 10),
                      Text('Hi! Gaurav',style: TextStyle(color: ColorConstants.textColor,fontSize: 15,fontWeight: FontWeight.bold),),
                      const Spacer()
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Find a course you want to learn.',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              hintText: 'Search..',
                              fillColor: Colors.white,
                              suffixIcon: Icon(Icons.search)
                          ),),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.movie_filter_rounded,size: 60),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Categories',style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: ListView.builder(scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1,color: Colors.black12)
                      ),
                        child: Row(
                          children: [
                            Icon(Icons.design_services),
                            Center(
                              child: Text(items[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular Course',style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 18,
                      )),
                      Text('All Courses',style: TextStyle(
                        fontSize: 18
                      ),)
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 500,
                    width: double.infinity,
                    child: GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      children: List.generate(item.length, (index) {
                        return _buildCardViewWidget(
                            imageUrl: item[index]['image'],
                            title: item[index]['title'],
                            subtitle: item[index]['subtitle']);
                      }),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _buildCardViewWidget(
      {required String imageUrl,
        required String title,
        required String subtitle}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
              ),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageUrl,
                ),
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black38,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(Icons.favorite)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


