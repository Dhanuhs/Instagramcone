import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_pro/prsentation/pages/home/widgets/post_card.dart';
import 'package:instagram_pro/services/firestore_service.dart';

class PostsView extends StatefulWidget {
  const PostsView({
    super.key,
    required this.postData,
    required this.likeImagesList,
  });

  final List<Map<String, String>> postData;
  final List<String> likeImagesList;

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  var firestoreService = FirestoreService();
  List<Map<String, dynamic>> postsData = [];
  @override
  void initState() {
    getPosts();
    super.initState();
  }

  getPosts() async {
    var posts = await firestoreService.getPost();
    setState(() {
      postsData = posts;
    });
    print(postsData);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.postData.length,
        itemBuilder: (context, index) {
          return PostCard(
            likeImagesList: widget.likeImagesList,
            postData: postsData[index],
          );
        });
  }
}
