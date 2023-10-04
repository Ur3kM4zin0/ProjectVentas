import 'package:appventas/utilidades/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PagarPage extends StatefulWidget {
  final double total;

  PagarPage(this.total);

  @override
  _PagarPageState createState() => _PagarPageState();
}

class _PagarPageState extends State<PagarPage> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController tarjetaController = TextEditingController();

  bool _nombreError = false;
  bool _apellidosError = false;
  bool _tarjetaError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "Pagar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              TextField(
                controller: nombreController,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: "Nombre",
                  errorText: _nombreError ? "Campo obligatorio" : null,
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              TextField(
                controller: apellidosController,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: "Apellidos",
                  errorText: _apellidosError ? "Campo obligatorio" : null,
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              TextField(
                controller: tarjetaController,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Tarjeta",
                  errorText: _tarjetaError ? "Campo obligatorio" : null,
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Total: S/ ${widget.total.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Validar campos obligatorios
                      _nombreError = nombreController.text.isEmpty;
                      _apellidosError = apellidosController.text.isEmpty;
                      _tarjetaError = tarjetaController.text.isEmpty;
                    });

                    if (!_nombreError && !_apellidosError && !_tarjetaError) {
                      

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Pago realizado con éxito."),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      "Pagar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: hexStringToColor("CB2B93"),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
