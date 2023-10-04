import 'package:appventas/utilidades/color.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future sign_in() async{
    String url = "http://10.0.2.2/ProjectVentas/login.php";
    final response = await http.post(Uri.parse(url), body:{
      'email': email.text,
      'password': pass.text,
    });
    var data = json.decode(response.body);
    print(data);
    if(data == "Error"){
      Navigator.pushNamed(context, 'login');
    }else{
      await User.setsignin(true);
      Navigator.pushNamed(context, 'home');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], 
        begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Open Bar',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 70, fontFamily: 'Schyler'),
                ),
                      
                      Image.asset("assets/logo.png"),
                      
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Correo Electronico',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.person, color: Colors.white,),
                          ),
                          validator: (val){
                            if(val!.isEmpty){
                              return 'Empty';
                            }
                            return null;
                          },
                          controller: email,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock_outline,color: Colors.white,),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          validator: (val){
                            if(val!.isEmpty){
                              return 'Empty'; 
                            }
                            return null;
                          },
                          controller: pass,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 247, 2, 206),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            bool pass = formKey.currentState!.validate();
                            if(pass){
                              sign_in();
                            }
                          },
                          child: const Text(
                            'Iniciar Sesión',
                            
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle:  TextStyle(fontSize: 15, color: Color.fromARGB(255, 230, 141, 7)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child:  Text("Aun no estas registrado? Registrate ahora", style:  TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
