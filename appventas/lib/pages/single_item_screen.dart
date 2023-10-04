import 'package:appventas/pages/carrito.dart';
import 'package:appventas/utilidades/color.dart';
import 'package:appventas/widgets/items_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class Cart {
  static final Cart _singleton = Cart._internal();
  List<Product> _items = [];

  factory Cart() {
    return _singleton;
  }

  Cart._internal();

  void addItem(Product item) {
    _items.add(item);
  }

  void removeProduct(Product product) {
    _items.remove(product);
  }

  List<Product> get items => _items;

  double get totalPrice {
  double total = 0;
  for (Product item in _items) {
    total += item.price;
  }
  return total;
}

  void clear() {
    _items.clear();
  }
}

class SingleItemScreen extends StatelessWidget {
  String img;
  double price;

  SingleItemScreen(this.img, this.price);

  @override
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
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Image.asset(
                      "assets/$img.png",
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LICOR",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            letterSpacing: 3,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          img,
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Text(
                                "S/ ${price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Elaborado con 70% de centeno, 18% de maíz y un 12% de cebada malteada. – Color: ámbar claro. – Olor: plátano, especias, malvavisco, aceite y algo de fruta del huerto. – Sabor: notas de caramelo y especias, un toque picante de centeno.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Volume: ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "750 ml",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Cart().addItem(Product(img,price));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Producto agregado al carrito!"),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Agregar a carrito",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: hexStringToColor("9546C4"),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    CupertinoIcons.cart_badge_plus,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),

                              
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: InkWell(
                                  onTap: () {Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen(price)),);
                                  },
                                  child: Text(
                                    "Ver Carrito",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
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