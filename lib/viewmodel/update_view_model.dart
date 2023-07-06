import 'package:flutter/cupertino.dart';

import '../model/post_model.dart';
import '../pages/home_page.dart';
import '../services/http_service.dart';

class UpdateViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostUpdate(BuildContext context,Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.PUT(
        Network.BASE + Network.API_UPDATE + post.id.toString(),
        Network.paramsUpdate(
            Post(
                userId: post.userId,
                id: post.id,
                title: titleTextEditingController.text,
                body: bodyTextEditingController.text
            )
        )
    );

    if (response != null) {
      Navigator.pushReplacementNamed(context, HomePage.id);
    }

    isLoading = false;
    notifyListeners();
  }
}