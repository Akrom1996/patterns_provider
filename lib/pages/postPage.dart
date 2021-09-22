import 'package:flutter/material.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/pages/postPageModel.dart';
import 'package:patterns_provider/services/http_service.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    Key? key,
  }) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Post? post;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  PostPageModel postPageModel = PostPageModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
  }

  postItem() async {
    var res =await postPageModel.PostItem(
        textEditingController1.text, textEditingController2.text, 1);
    print("res post: $res");
    if (res != null) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create new item"),
      ),
      body: ChangeNotifierProvider<PostPageModel>.value(
        value: postPageModel,
        child: Consumer<PostPageModel>(
          builder: (context, model, index) => Container(
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
        ),
      ),
    );
  }
}
