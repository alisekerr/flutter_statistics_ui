import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context).size;
    var screenHeight = screenInfo.height;
    var screenWidth = screenInfo.width;
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.9,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.greenAccent,
                height: 250,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 40.0, right: 20.0),
            child: Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: SfCircularChart(
                legend: Legend(
                    isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                series: <CircularSeries>[
                  RadialBarSeries<GDPData, String>(
                      dataSource: _chartData,
                      xValueMapper: (GDPData data, _) => data.continent,
                      yValueMapper: (GDPData data, _) => data.gdp,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true,
                      maximumValue: 5000),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 60),
            child: Text(
              "Statistics",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 550, left: 40),
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.orangeAccent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.4),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 550, left: 200),
            child: Container(
              width: 150,
              height: 85,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.greenAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.4),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 650, left: 200),
            child: Container(
              width: 150,
              height: 85,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.white],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.4),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(4, 4),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          //Icons---
          Padding(
            padding: const EdgeInsets.only(top: 550, left: 85),
            child: Container(
              color: Colors.transparent,
              width: 50,
              height: 50,
              child: Image.asset("assets/breakfast.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 550, left: 210),
            child: Container(
              color: Colors.transparent,
              width: 50,
              height: 50,
              child: Image.asset("assets/dinner.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 650, left: 210),
            child: Container(
              color: Colors.transparent,
              width: 50,
              height: 50,
              child: Image.asset("assets/snacks.png"),
            ),
          ),
         //Button--
          Padding(
            padding: const EdgeInsets.only(top: 650,left:48 ),
            child: SizedBox(
              width: 130,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.4),
                ),
                icon: Icon(Icons.add),
                label: Text(
                  "Add Breakfast",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 600,left:210 ),
            child: SizedBox(
              width: 130,
              height: 25,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.4),
                ),
                icon: Icon(Icons.add),
                label: Text(
                  "Add Dinner",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 700,left:210 ),
            child: SizedBox(
              width: 130,
              height: 25,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white.withOpacity(0.4),
                ),
                icon: Icon(Icons.add),
                label: Text(
                  "Add Snacks",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Brakfast', 160),
      GDPData('Lunch', 750),
      GDPData('Dinner', 1500),
      GDPData('Snacks', 2305),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height + 20, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    //var firstStart=Offset(size.width/3, size.height+20);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
