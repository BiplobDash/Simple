import 'package:better_half/Provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<postProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Get Data'),),
      body:FutureBuilder(
        future: post.getData(), 
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error occurred: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: post.posts?.length ?? 0,
              itemBuilder: (_, index) {
                return Card(
                  child: ListTile(
                    title: Text(post.posts![index].title),
                    subtitle: Text(post.posts![index].body),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
