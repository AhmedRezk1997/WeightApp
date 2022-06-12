import 'package:flutter/material.dart';
//import 'package:weight_app/constants/constant.dart';
import 'package:weight_app/leftbar.dart';
import 'package:weight_app/rightbar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  double wresult = 0;
  String tresult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text("Weight Calculator"),
        centerTitle: true,
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                child: TextField(
                  controller: _height,
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Height",
                    hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(.8)),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: TextField(
                  controller: _weight,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Weight",
                    hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(.8)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              double h = double.parse(_height.text);
              double w = double.parse(_weight.text);

              setState(() {
                wresult = w / (h * h);
                if (wresult > 25) {
                  tresult = "You are over weight";
                } else if (wresult >= 18.5 && wresult <= 25) {
                  tresult = "You have normal weight";
                } else {
                  tresult = "You are under weight";
                }
              });
            },
            child: Container(
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              wresult.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Visibility(
            visible: tresult.isNotEmpty,
            child: Container(
              child: Text(
                tresult,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Leftbar(barwidth: 40),
          SizedBox(
            height: 10,
          ),
          Leftbar(barwidth: 70),
          SizedBox(
            height: 10,
          ),
          Leftbar(barwidth: 40),
          SizedBox(
            height: 10,
          ),
          Rightbar(barwidth: 40),
          SizedBox(
            height: 10,
          ),
          Rightbar(barwidth: 70),
          SizedBox(
            height: 10,
          ),
          Rightbar(barwidth: 40),
        ]),
      ),
    );
  }
}
