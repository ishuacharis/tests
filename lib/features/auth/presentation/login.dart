import 'package:flutter/material.dart';
import 'package:tests/core/blocs/validation_bloc.dart';

class LoginPage extends StatelessWidget {
   ValidationBloc _validationBloc = ValidationBloc();
   TextEditingController _emailController =  TextEditingController();
   TextEditingController _passwordController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            StreamBuilder(
                stream: _validationBloc.email$ ,
                builder: (context, AsyncSnapshot snapshot) {
                  return TextField(
                    controller: _emailController,
                    onChanged: (value) => _validationBloc.onChangeEmail(value),
                    onSubmitted: (value) => print("ok"),
                    decoration: InputDecoration(
                        errorText: snapshot.error != null ? "${snapshot.error}" : null
                    ),
                  );
                }
            ),
            StreamBuilder(
                stream: _validationBloc.password$ ,
                builder: (context, AsyncSnapshot snapshot) {
                  return TextField(
                    controller: _passwordController,
                    obscureText: true,
                    onChanged: (value) => _validationBloc.onChangePassword(value),
                    decoration: InputDecoration(
                        errorText: snapshot.error != null ? "${snapshot.error}" : null
                    ),
                  );
                }
            ),
            StreamBuilder<Object>(
              stream: _validationBloc.validSubmit,
              builder: (context, snapshot) {
                return ElevatedButton(
                    onPressed: (){
                      _emailController.clear();
                      _passwordController.clear();
                      return snapshot.data == true ?
                      _validationBloc.onSubmit() : null;
                    },
                  style: ButtonStyle(
                      backgroundColor: snapshot.data == true ?
                      MaterialStateProperty.all<Color>(Colors.blueAccent):
                      MaterialStateProperty.all<Color>(Colors.grey)
                ) ,
                  child: Text("Log in"),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
