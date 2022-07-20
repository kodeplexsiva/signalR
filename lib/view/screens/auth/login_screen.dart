import 'package:flutter/material.dart';

import '../../../utill/images.dart';
import '../home/home.dart';
import '../onboard_selection/selection.dart';
import '../splash/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

@override
void initState() {
  var _passwordVisible = false;
}


class _LoginScreenState extends State<LoginScreen> {

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("V: 22.07.12.0", style: TextStyle(color: Colors.white, fontSize: 16.0, ),),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.network_check),
        ),
        PopupMenuButton(
            itemBuilder: (context){
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Settings"),
                ),

                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Exit"),
                ),
              ];
            },
            onSelected:(value){
              if(value == 0){
                print("Settings menu is selected.");
              }else if(value == 1){
                print("Exit is selected.");
              }
            }
        ),
      ],
      backgroundColor: Colors.green,
    ),

    body: SingleChildScrollView(
      child: Scrollbar(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  Images.app_logo,
                  height: 30,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Center(
                child: Text('My Ware House'),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Center(
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                      suffixIcon: Icon(
                        Icons.email,
                      ),
                    ),
              ),
            ),
           ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Center(
              child: TextField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                    hintText: 'Pasword',
                    suffixIcon: IconButton(
                        icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MainHome())),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                  primary: Colors.green,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              ),
            ),
          ],
        ),
      ),
    ),


    );
  }
}
