import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login Screen"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return 'Username is required';
                    }
                    return null;
                  },
                  onSaved: (value){
                    print('Username is saved');
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    hintText: 'Write your full name',
                    prefixIcon: Icon(Icons.person),
                  ),
                    keyboardType: TextInputType.text,
                    maxLength: 25,
                  ),
              SizedBox(height: 10),
              TextFormField(
                  validator: (value) {
                    if (value!.length<3) {
                      return 'Password should be more than 3 characters';
                    }
                    return null;
                  },
                  onSaved: (value){
                    print('Password is saved');
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    helperText: 'password > 3 characters',
                  ),
                    obscureText: true,
                  ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate() == true) {
                      _formkey.currentState!.save();
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Text('Thank you'),
                        content: Text('Form Submitted Seccessfully'),
                        actions: [
                          ElevatedButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text('Ok'))
                        ],
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Form Submitted Successfully')));
                      print('Form Submitted Successfully');
                    }
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
