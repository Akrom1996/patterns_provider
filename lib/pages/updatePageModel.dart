import 'package:flutter/foundation.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/services/http_service.dart';

class UpdatePageModel extends ChangeNotifier {
  Post? post;
  var res;
  Future updateItemProvider(id, text1, text2, userId) async {
    print("update provider");
    res = await Network.PUT(
      Network.API_UPDATE,
      Network.paramsUpdate(
        new Post(id:  id, title: text1, body: text2, userId: userId),
      ),
    );
    print("provider res: $res");
    notifyListeners();
    return res;
  }
}
