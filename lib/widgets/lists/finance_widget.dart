import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinanceWidget extends StatefulWidget {
  @override
  _FinanceWidgetState createState() => _FinanceWidgetState();
}

class _FinanceWidgetState extends State<FinanceWidget> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(2500.0, Colors.red, rankKey: 'Egresos'),
        new CircularSegmentEntry(5000.0, Colors.green, rankKey: 'Ingresos'),
      ],
      rankKey: 'Gastos',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Chip(
                  label: Text('Mayo'),
                  backgroundColor: Colors.grey,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Junio'),
                  backgroundColor: Colors.grey,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Julio'),
                  backgroundColor: Colors.grey,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Agosto'),
                  backgroundColor: Colors.grey,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Setiembre'),
                  backgroundColor: Colors.green,
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ],
            ),
            AnimatedCircularChart(
              //key: _chartKey,
              size: const Size(300.0, 300.0),
              initialChartData: data,
              chartType: CircularChartType.Radial,
              holeLabel: 'Gasto de Setiembre\n          S/.3500',
              labelStyle: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Card(
              child: Stack(
                children: <Widget>[
                  ListTile(
                      leading: Icon(
                        FontAwesomeIcons.ticketAlt,
                        size: 36,
                        color: Colors.green,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      title: Text(
                        "Entretenimiento",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Suscripciones, compras de videojuegos",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("1500.0"),
                          Icon(Icons.keyboard_arrow_right,
                              color: Colors.grey, size: 30.0),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
