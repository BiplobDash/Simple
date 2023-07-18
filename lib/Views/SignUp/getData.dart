import 'package:better_half/Helper/postHelper.dart';
import 'package:better_half/Model/postModel.dart';
import 'package:better_half/Provider/postProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class GetData extends StatefulWidget {
  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List<Post> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    data = await PostHelper().getData();
    // ignore: use_build_context_synchronously
    final provider = Provider.of<postProvider>(context, listen: false);
    provider.updatedData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<postProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Get Data'),
          ),
          body: Container(
            child: provider.dataList.isEmpty
                ? Center(child: Text('There is no data'))
                : ListView.builder(
                    itemCount: provider.dataList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${provider.dataList[index].title}"),
                        leading: Text("${provider.dataList[index].id}"),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
