import 'package:flutter/material.dart';
import 'package:instagram_pro/prsentation/pages/auth/sign_up.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _pageController = PageController(initialPage: 0);
  int _currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentpage = value;
                  });
                },
                children: const [
                  OnBoardingScreen(
                    heading: 'with your friends',
                    headingText: 'Connect',
                    imageUrl:
                        'https://firebasestorage.googleapis.com/v0/b/fir-c41ab.appspot.com/o/onboarding2.png?alt=media&token=224cbba6-9cc2-459f-baa5-cd0e154ad0ce&_gl=1*1ilyao7*_ga*MTMyNTIwNzg5Mi4xNjUzMzIzMzkz*_ga_CW55HF8NVT*MTY4NjY0MDc0Ni4xMjcuMC4xNjg2NjQwNzQ2LjAuMC4w',
                    paragraph:
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',
                    subheading: 'Direct Message',
                  ),
                  OnBoardingScreen(
                    heading: 'your best Moments',
                    headingText: 'Post',
                    imageUrl:
                        'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp',
                    paragraph:
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',
                    subheading: 'Create Videos',
                  ),
                  OnBoardingScreen(
                    imageUrl:
                        'https://www.commonsensemedia.org/sites/default/files/styles/ratio_16_9_xlarge/public/blog/2022-pug-instagram.jpg',
                    heading: 'with your friends',
                    subheading: 'Direct Message',
                    paragraph:
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document',
                    headingText: 'Connect',
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_currentpage == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ));
                        } else {
                          _pageController.nextPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.ease);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor:
                              const Color.fromARGB(255, 246, 87, 8)),
                      child: Text(_currentpage == 2 ? "Get Started" : "next"))),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 12,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: _currentpage == index
                              ? Colors.white
                              : const Color.fromARGB(255, 132, 87, 87),
                          borderRadius: BorderRadius.circular(50)),
                    );
                  })),
            )
          ],
        ));
  }
}

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen(
      {super.key,
      required this.imageUrl,
      required this.heading,
      required this.subheading,
      required this.paragraph,
      required this.headingText});

  final String imageUrl;
  final String heading;
  final String subheading;
  final String paragraph;
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.network(
            "https://cdn.pixabay.com/photo/2016/02/10/20/00/symbol-of-infinity-of-autism-1192408_1280.png",
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 220,
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Color.fromARGB(255, 246, 87, 8), width: 4.0))),
              child: RichText(
                  text: TextSpan(style: TextStyle(fontSize: 32), children: [
                TextSpan(
                  text: headingText,
                  style: TextStyle(color: Color.fromARGB(255, 246, 87, 8)),
                ),
                TextSpan(text: heading)
              ])),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Image.network(
            imageUrl,
            width: 150,
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            subheading,
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 177, 175, 175)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            paragraph,
            style: TextStyle(color: Color.fromARGB(255, 177, 175, 175)),
          ),
        ],
      ),
    );
  }
}
