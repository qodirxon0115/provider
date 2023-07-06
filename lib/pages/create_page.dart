import 'package:flutter/material.dart';

import '../viewmodel/create_view_model.dart';

class CreatePage extends StatefulWidget {
  static const String id = 'create_page';
  const CreatePage({required Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateViewModel viewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
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
                    hintText: 'Title',
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
                    hintText: 'Body',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  viewModel.apiPostCreate(context, viewModel.titleTextEditingController.text, viewModel.bodyTextEditingController.text);
                },
                color: Colors.blue,
                child: Text("Create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}