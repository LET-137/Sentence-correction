
import 'package:hubu/todo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  // final String guri = "guri";
  final todos = List.generate(5,(index) => Todo(title: "Todo ${index + 1}"),);

  @override
  Widget build(BuildContext context){
        return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => CheckboxListTile(
          onChanged: (checked){
            setState(() {
              todos[index].archiver = !todos[index].archiver;
            });
          },
          value: todos[index].archiver,
          title: Text(todos[index].title),
        ),
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          setState(() {
            todos.add(Todo(title: "ToDo ${todos.length + 1}"),);
          });
        },
      ),
    );
  }
}