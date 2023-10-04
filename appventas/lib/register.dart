import 'package:appventas/utilidades/color.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  Future sign_up() async{
    String url = "http://10.0.2.2/ProjectVentas/register.php";
    final response = await http.post(Uri.parse(url), body: {
      'name': name.text,
      'password': pass.text,
      'email': email.text,
    });
    var data = json.decode(response.body);
    print(data);
    if(data == "Error"){
      Navigator.pushNamed(context, 'register');
    }else{
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

                SizedBox(height: 20,),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nombre',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.person, color: Colors.white,),
                          ),
                          validator: (val){
                            if(val!.isEmpty){
                              return 'Empty';
                            }
                            return null;
                          },
                          controller: name,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Correo Electronico',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.mail, color: Colors.white,),
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
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.white,),
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
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Repita su contraseña',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.white,),
                          ),
                          validator: (val){
                            if(val == null){
                              return 'Empty';
                            }else if(val != pass.text){
                              return 'La contraseña no coincide';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 247, 2, 206),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            bool pass = formKey.currentState!.validate();
                            if(pass){
                              sign_up();
                            }
                          },
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: const Text("Ya tengo una cuenta", style:  TextStyle(fontSize: 15, color: Colors.white)),
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
