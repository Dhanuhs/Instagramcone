import 'package:flutter/material.dart';
import 'package:instagram_pro/prsentation/pages/home/widgets/post_card.dart';
import 'package:instagram_pro/prsentation/pages/home/widgets/profile_story_card.dart';
import 'package:instagram_pro/prsentation/pages/home/widgets/story_card.dart';

import 'widgets/posts_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  var storyData = [
    {
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj9JJJAhrJ_MiURbIWctw36JR8warm7xL9rg&usqp=CAU',
      'userName': 'user1f',
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user2',
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/heart-girl-anime-character_603843-485.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user3',
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user4',
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user5',
    },
  ];

  var postData = [
    {
      'imageUrl':
          'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp',
      'userName': 'chandru',
      "profileImage":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj9JJJAhrJ_MiURbIWctw36JR8warm7xL9rg&usqp=CAU'
    },
    {
      'imageUrl':
          'https://blog.hootsuite.com/wp-content/uploads/2021/07/How-to-use-instagram-stories-768x768.png.webp',
      'userName': 'hari',
      "profileImage":
          'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp'
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/heart-girl-anime-character_603843-485.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'Vikram',
      "profileImage":
          'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp'
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'Rathore',
      "profileImage":
          'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp'
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'jagan',
      "profileImage":
          'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp'
    },
  ];

  var likeImagesList = [
    'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp',
    'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp',
    'https://blog.hootsuite.com/wp-content/uploads/2020/07/Instagram-hacks-768x768.png.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 40,
              floating: true,
              pinned: false,
              snap: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Text("Instagram", style: TextStyle(fontSize: 30)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.radio_button_unchecked,
                          color: Colors.orange),
                    )
                  ]),
                  Icon(Icons.message)
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProfileStoryCard(),
                    ListView.builder(
                        itemCount: storyData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return StoryCard(
                            profileImage: storyData[index]['imageUrl']!,
                            userName: storyData[index]['userName']!,
                          );
                        })
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:
                  PostsView(postData: postData, likeImagesList: likeImagesList),
            ),
          ],
        ),
      ),
    );
  }
}
