import 'package:appventas/pages/single_item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  List<String> img = [
    'Jack Daniels',
    'Flor de Caña',
    'Black Label',
    'Chivas Regal',
    'Absolut Vodka',
    'Jose Cuervo',
    'Coca Cola',
    'Fanta',
    'Pepsi',
    'Sprite',
    'Cusqueña',
    'Heineken',
    'Sol',
    'Kunsman',
    'Miller',
    'Corona',
  ];

  List<double> prices = [
    120.0,
    155.0,
    40.0,
    95.0,
    99.0,
    60.0,
    10.0,
    9.0,
    9.0,
    8.0,
    10.0,
    15.0,
    8.50,
    10.0,
    15.0,
    8.50,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 150 / 195,
      ),
      shrinkWrap: true,
      itemCount: img.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF212325),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 8,
              )
            ],
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleItemScreen(
                        img[index],
                        prices[index],
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  "assets/${img[index]}.png",
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        img[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Licor",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "S/${prices[index].toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
