import 'dart:convert';
import 'package:appventas/utilidades/color.dart';
import 'package:appventas/widgets/items_widget.dart';
import 'package:flutter/material.dart';
import '../user.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
    _tabController = TabController(length: 1, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection(){
    if(_tabController.indexIsChanging){
      setState(() {
        
      });
    }
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

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
        ], 
        begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                  onTap: (){},
                  child: Icon(
                    Icons.sort_rounded,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 35,
                  ),
                  ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Es un gran dia para beber...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 50, 54, 56),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Busca tu bebida",
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white.withOpacity(0.5),
                        )
                      ),
                    ),
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: Color(0xFFE57734),
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    isScrollable: true,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color(0xFFE57734)
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    tabs: [
                    Tab(text: "Bebidas"),
                    
                    
                  ],),
                  SizedBox(height: 10,),
                  Center(
                    child: [
                      ItemsWidget(),
                      
                    ][_tabController.index],
                  )
              ],
            ),
          ),
          
        ),
        
        
      ),
      
    );
  }
}