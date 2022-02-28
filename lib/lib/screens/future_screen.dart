import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  static String id = "/future";

  const FutureScreen({Key? key}) : super(key: key);

  @override
  _FutureScreenState createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  Future<void> getData() async {
    Future.delayed(const Duration(seconds: 3), () {
      print("Volodymyr Zelenskyy Id - 1");
    }).then(
          (value) {
        Future.delayed(const Duration(seconds: 2), () {
          print("Hey Vlademir Putin Id - 2");
        }).catchError((error) {
          print(error);
        });
      },
    );

    print("Random Line of code");
  }

  Future<void> getAsynncData() async {
    try{
      final UserId = await Future.delayed(Duration(seconds: 3), () {
        print("Volodymyr Zelenskyy Id - 1");
        return "Volodymyr Zelenskyy";
      });

      await Future.delayed(Duration(seconds: 2), () {
        print("Hey Vlademir Putin, Hi $UserId");
      });
    }catch(e){
      print(e);
    }
    print("War in UK");
  }
  Future<String> getUsername()async{
    final user = await Future.delayed(Duration(seconds: 2),(){
      return "Hi I oam";
    },);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Text("Future Network"), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: Text("Click here"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()async {
                await getAsynncData();
                print("Second function");
              },
              child: Text("Click War"),
            ),
            SizedBox(height: 20,),
            FutureBuilder(
              future: getUsername(),
              builder: (_,AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return Text(snapshot.data);
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}