import 'package:flutter/foundation.dart';
import 'package:patterns_provider/model/post_model.dart';
import 'package:patterns_provider/services/http_service.dart';

class UpdatePageModel extends ChangeNotifier {
  Post? post;
  var res;
  Future updateItemProvider(text1, text2, id) async {
    res = await Network.PUT(
      Network.API_UPDATE,
      Network.paramsUpdate(
        new Post(id: post!.id, title: text1, body: text2, userId: id),
      ),
    );
    notifyListeners();
  }
}
