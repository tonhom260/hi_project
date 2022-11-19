import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.white,
          width: double.maxFinite,
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                height: 200,
                color: Colors.blue,
              child: Stack(
                children: [
                  Positioned(
                      left: 20,
                      top: 40,
                      child: Text('Dashboard',style: TextStyle(fontSize: 30,color: Colors.white),)),
                  Positioned(
                      left: 20,
                      top: 80,
                      child: Text('Hi Chiangrai Hotel on 29/10/2022',style: TextStyle(fontSize: 18,color: Colors.white),)),
                ],
              ),),
              //whitebox
              Positioned(
                  top: 125,
                  left: 20,
                  child: Container(
                    alignment: Alignment.center,
                    width: width*.50,
                    height: height*.15,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        CircleAvatar(
                          radius: 25,backgroundColor: Colors.blue,),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text('Total Guests',style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('24/6',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25))
                        ],)
                      ],),
                    ),
                  )),
              //blue chart box
              Positioned(
                  top: height*.35,
                  child: Container(
                    width: width,
                    alignment: Alignment.center,
                    child: Container(
                      height: height*.35,
                      width: width*.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue,),
                      ),
                  )),
              //spacer
              Positioned(
                  top: height*.6,
                  child: Container(
                    width: width,
                    alignment: Alignment.center,
                    child: Container(
                color: Colors.grey,
                height: 3,
                width: width*.9,
              ),
                  )),
              //consumption
              Positioned(
                  top: height*.61,
                  left: width*.05,
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      // color: Colors.green,
                      child: Text(
                        'Consumption',style:
                      TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),))),
              // detail date and %
              Positioned(
                  top: height*.66,
                  // left: width*.05,
                  child: Container(width: width,alignment: Alignment.center,child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text('12/3'),
                    Text('50%'),
                  ],),)),
              //elevateBT 1
              Positioned(
                  left: width*.03,
                  right: width*.03,
                  top: height*.74,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    onPressed: (){},child: Container(
                    alignment: Alignment.center,
                      height: 40,
                      child: Text('Use Coupons',style: TextStyle(color: Colors.black),)),)),
              //elevateBT 2
              Positioned(
                  left: width*.03,
                  right: width*.03,
                  top: height*.81,
                  child: ElevatedButton(onPressed: (){},child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: Text('Create Coupons')),)),
              //pie
              Positioned(
                top: height*.38,
                child: Container(
                  // color: Colors.white,
                  width: width,
                  height: height*.2,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                    //pie1
                    PieChart(
                      chartValuesOptions: ChartValuesOptions(decimalPlaces: 0),
                      legendOptions: LegendOptions(showLegends: false),
                      chartRadius: height*.12,
                      chartType: ChartType.ring,
                      dataMap: {"applied":50.0,"not Applied":50},),
                    //pie2
                    PieChart(
                      chartValuesOptions: ChartValuesOptions(
                          showChartValuesOutside: true,
                          decimalPlaces: 0),
                      legendOptions: LegendOptions(showLegends: false),
                      chartRadius: height*.20,
                      chartType: ChartType.ring,
                      dataMap: {"applied":70.0,"not Applied":30},)
                  ],),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
