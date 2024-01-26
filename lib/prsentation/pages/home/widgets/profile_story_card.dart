import 'package:flutter/material.dart';

class ProfileStoryCard extends StatelessWidget {
  const ProfileStoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Colors.green)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69460.jpg?w=740&t=st=1686137185~exp=1686137785~hmac=390704896744102739b13593a6ee86ac579820b437588272dda37641c152fe9b'"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3.0, color: Colors.white)),
              child: Icon(
                Icons.add_circle,
                size: 30,
                color: Colors.orange,
              )),
        )
      ],
    );
  }
}
