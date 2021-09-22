import 'package:flutter/material.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/services/http_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, }) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Post? post;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  postItem() async {
    var res = await Network.POST(
      Network.API_UPDATE,
      Network.paramsCreate(
        new Post(
            title: textEditingController1.text,
            body: textEditingController2.text,
            userId: 1),
      ),
    );
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new item"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 3,

              controller: textEditingController1,
              // initialValue: "${post.title}",
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 3,
              // initialValue: "${post.body}",
              controller: textEditingController2,
              decoration: InputDecoration(
                hintText: "Body",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: postItem,
                child: Text("Post item"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
