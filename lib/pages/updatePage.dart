import 'package:flutter/material.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/pages/updatePageModel.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  final Post post;
  const UpdatePage({Key? key, required this.post}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  Post? post;
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  UpdatePageModel updatePageModel = UpdatePageModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post = widget.post;
    textEditingController1.text = widget.post.title!;
    textEditingController2.text = widget.post.body!;
  }

  //
  //
  updateItem() async {
    await updatePageModel.updateItemProvider(post!.id,
        textEditingController1.text, textEditingController2.text, post!.userId);
    print("res");
    print(updatePageModel.res);
    if (updatePageModel.res != null) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${post!.title}"),
      ),
      body: ChangeNotifierProvider<UpdatePageModel>.value(
        value: updatePageModel,
        child: Consumer<UpdatePageModel>(
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
                    onPressed: updateItem,
                    child: Text("Update"),
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
