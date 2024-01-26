import 'package:flutter/material.dart';

class MediaBottomSheet {
  static void show(context, Function() pickImages, Function() takePicture,
      Function() pickVideo) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                leading: Icon(Icons.image),
                title: Text("Pick Image"),
                onTap: pickImages),
            ListTile(
                leading: Icon(Icons.videocam),
                title: Text("Pick video"),
                onTap: pickVideo),
            ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("take picture"),
                onTap: takePicture),
          ],
        );
      },
    );
  }
}

class RemoveMediaBottomSheet {
  static void show(
    context,
    Function() removeMedia,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("remove"),
              onTap: removeMedia,
            ),
            ListTile(
              leading: Icon(Icons.cancel),
              title: Text("Cancel"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
