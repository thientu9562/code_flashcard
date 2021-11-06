import 'dart:html';

import 'package:flashcard/src/model/Notebook_model.dart';
import 'package:flashcard/src/resource/HomePage.dart';
import 'package:flutter/material.dart';
import './widget/notebook_widget';
import 'data/data.dart';

class Note extends StatefulWidget{
  @override
  _NoteState createState() => _NoteState();
}
class _NoteState extends State<Note>{
  final key = GlobalKey<_NoteState>();
  static var items = List.from(Data.noteList);
  //String itemsCount = items.length.toString();
   Future<void> insertItem(int index, NoteItem item) async {
    items.insert(index,item);
    key.currentState!.insertItem(index, item);
  }

 void removeItem( int index){
   // ignore: unused_local_variable
   final item =items.remove(index);
  key.currentState!.removeItem(index);
 }
       Widget buildItem(item, int index,Animation<double> animation) =>
      NoteItemWidget(
        item: item,
        animation: animation,
        onClicked: () => removeItem(index),
      );
Widget buildInsertButton() =>  ElevatedButton(
        child: Text(
          'Thêm từ vựng',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () => insertItem(1,Data.noteList.first),
      );
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("SỔ TAY CỦA BẠN"),
          leading: IconButton(icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
          onPressed: (){
            Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => MyHomePage()));
          },),
          ),
          body: Column(
           children: [
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index,animation),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: buildInsertButton(),
            ),
          ],
            ),
          ),
        ),
        
      );
    
  }
}

