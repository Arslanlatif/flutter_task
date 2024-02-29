import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc.dart';
import 'package:flutter_application_1/details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Posts',
                style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true),
        body: BlocBuilder<PostBloc, List<dynamic>>(builder: (context, state) {
          if (state.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return RefreshIndicator(
                color: Colors.blue,
                backgroundColor: Colors.white,
                onRefresh: () async {
                  context.read<PostBloc>().fetchPosts();
                },
                child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (BuildContext context, int index) {
                      final post = state[index];
                      return Card(
                          elevation: 33,
                          shadowColor: Colors.black,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ListTile(
                              title: Text(post['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(post['body']),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostDetailScreen(post: post)));
                              }));
                    }));
          }
        }));
  }
}
