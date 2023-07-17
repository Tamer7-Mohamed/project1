import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taam_app/models/todomodel.dart';
import 'package:taam_app/servcis/todoservice.dart';

class donetaskesscreen extends StatefulWidget {

  @override
  State<donetaskesscreen> createState() => _donetaskesscreenState();
}

class _donetaskesscreenState extends State<donetaskesscreen> {
  List<Todomodole> todo = [];
  bool isLoading = true;

  getUsers() async {
    todo = await todoservice().getuserdata();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return
      isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: todo.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(todo[index].title ?? "--"),
             subtitle: Text(todo[index].completed.toString() ?? "--"),
          );
        },
      );
  }
}
