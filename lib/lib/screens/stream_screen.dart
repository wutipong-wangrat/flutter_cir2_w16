import 'dart:async';

import 'package:flutter/material.dart';

class StreamScreen extends StatelessWidget {
  static String id = "/stream";
  final StreamController streamController = StreamController(); //1.create new stream controller
  // const StreamScreen({Key? key}) : super(key: key);
  void streamData()async{
    streamController.stream.listen((data){
      print(data);
    });
    //2.Adding data to the stream
    for(int i = 0;i<4;i++){
      streamController.add('You got a message');
      await Future.delayed(Duration(seconds: 2),(){
        print('Read');
      },);
    }
  }

  Stream myStream()async*{
    for(var i = 0;i<10;i++){
      yield i;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Stream'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                streamData();
              },
              child: Text("War in UK"),
            ),
            SizedBox(height: 20),
            StreamBuilder(
              stream: myStream(),
              builder: (_,AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return Text(snapshot.data.toString(),style: TextStyle(fontSize: 30,color: Colors.indigo),);
                }
                return Center(child: CircularProgressIndicator());
              },
            )
          ],
        ),
      ),
    );
  }
}
