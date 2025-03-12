import 'package:flutter/material.dart';
import 'package:kuis_h/pages/movie_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Ashadu" , style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          )),
          TextField(
            controller: _username,
            decoration: InputDecoration(
              filled: true,
              fillColor: isError? Colors.red : Colors.transparent,
              label: Text("username")
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: isError? Colors.red : Colors.transparent,
              label: Text("pass")
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              String msg = "";
              if(_username.text == "karten" && _password.text == "080"){
                setState(() {
                  isError = false;
                  msg = "login";
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>MovieListPage()
                  ));
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context)=>HomePage(username: _username.text)
                  // ));
                });
              }else{
                isError = true;
                msg = "salah";
              }
              SnackBar snackBar = SnackBar(content: Text(msg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text("Login")
          ),
        ],
      ),
    );
  }
}