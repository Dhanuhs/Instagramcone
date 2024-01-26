import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_pro/prsentation/pages/home/home_view.dart';
import 'package:instagram_pro/prsentation/widgets/nav_bar.dart';
import 'package:instagram_pro/prsentation/pages/profile/widgets/profile_view.dart';
import 'package:instagram_pro/prsentation/pages/search/search_view.dart';
import 'package:instagram_pro/prsentation/pages/upload_post/post_view.dart';

class BodyView extends StatefulWidget {
  const BodyView({super.key});

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  int currentIndex = 0;
  var pageViewList = [
    HomeView(),
    SearchView(),
    PostView(),
    Text('hello'),
    ProfileView(
      userId: FirebaseAuth.instance.currentUser!.uid,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
      ),
      body: pageViewList[currentIndex],
    );
  }
}
