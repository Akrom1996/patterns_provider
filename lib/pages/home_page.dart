import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/pages/postPage.dart';
import 'package:patterns_provider/pages/updatePage.dart';
import 'package:patterns_provider/viewModel/viewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewModel viewModel = ViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
        ),
        body: ChangeNotifierProvider(
          create: (context) => viewModel,
          child: Consumer<ViewModel>(
            builder: (context, model, index) => Stack(
              children: [
                ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                        onTap: () async {
                          print(viewModel.items[index].title);
                          var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => UpdatePage(
                                post: viewModel.items[index],
                              ),
                            ),
                          );
                          print("result: $result");
                          if (result == true) {
                            viewModel.apiPostList();
                          }
                        },
                        child: itemOfPost(viewModel.items[index]));
                  },
                ),
                viewModel.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () async{
          var result=await  Navigator.push(
                context, MaterialPageRoute(builder: (_) => PostPage()));
          if(result == true)
            viewModel.apiPostList();
          },
          child: Icon(Icons.add),
        ));
  }

  Widget itemOfPost(Post post) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title!.toUpperCase(),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(post.body.toString()),
          ],
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Update',
          color: Colors.indigo,
          icon: Icons.edit,
          onTap: () {},
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            viewModel.apiPostDelete(post);
          },
        ),
      ],
    );
  }
}
