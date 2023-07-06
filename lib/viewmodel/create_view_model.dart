import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/pages/home_page.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';

class CreateViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostCreate(BuildContext context, String title, String body) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.POST(
        Network.BASE + Network.API_CREATE,
        Network.paramsCreate(
            Post(
                userId:1,
                id: 1,
                title: title,
                body: body
            )
        )
    );

    if (response != null) {
      Navigator.pushReplacementNamed(context, HomePage.id);
      // return response;
    }

    isLoading = false;
    notifyListeners();
  }
}