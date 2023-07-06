import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/model/post_model.dart';
import 'package:provider/viewmodel/home_view_model.dart';
import 'package:provider/views/item_of_post.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id="home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeViewModel viewModel = HomeViewModel();

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
        title: const Text("Provider"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<HomeViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              ListView.builder(
                  itemCount: viewModel.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(viewModel,post as Post);
                  }),
              viewModel.isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }

}
