import 'package:flutter/foundation.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/services/http_service.dart';

class PostPageModel extends ChangeNotifier {
  var res;
  PostItem(text1, text2, userId) async {
    res = await Network.POST(
        Network.API_UPDATE,
        Network.paramsCreate(
          new Post(title: text1, body: text2, userId: userId),
        ));
    print("res post2: $res");
     notifyListeners();
     return res;
  }
}
