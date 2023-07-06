import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../viewmodel/update_view_model.dart';

class UpdatePage extends StatefulWidget {
  static const String id = 'update_page';

  Post post = Post(id: 1, title: '', body: '', userId: 1);
  UpdatePage({required this.post, required Key key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel viewModel = UpdateViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.titleTextEditingController.text = widget.post.title.toUpperCase();
    viewModel.bodyTextEditingController.text = widget.post.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Post'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Title TextField
              Container(
                color: Colors.black12,
                child: TextField(
                  controller: viewModel.titleTextEditingController,
                  maxLines: 3,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              // Title TextField
              Container(
                color: Colors.black12,
                child: TextField(
                  controller: viewModel.bodyTextEditingController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  viewModel.apiPostUpdate(context, Post(userId: widget.post.userId, id: widget.post.id, title: viewModel.titleTextEditingController.text, body: viewModel.bodyTextEditingController.text));
                },
                color: Colors.blue,
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}