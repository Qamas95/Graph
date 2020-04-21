import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    var data1 = [
      new Pollution(1980, 'USA', 30),
      new Pollution(1980, 'Asia', 40),
      new Pollution(1980, 'Europe', 10),
    ];

    var data2 = [
      new Pollution(1985, 'USA', 100),
      new Pollution(1980, 'Asia', 150),
      new Pollution(1985, 'Europe', 80),
    ];

    var data3 = [
      new Pollution(1985, 'USA', 200),
      new Pollution(1980, 'Asia', 300),
      new Pollution(1980, 'Europe', 180),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];

    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    _seriesData.add(
      charts.Series(
          domainFn: (Pollution pollution, _) => pollution.place,
          measureFn: (Pollution pollution, _) => pollution.quantity,
          id: '2017',
          data: data1,
          fillPatternFn: (_, __) => charts.FillPatternType.forwardHatch,
          fillColorFn: (Pollution pollution, _) =>
              charts.ColorUtil.fromDartColor(
                  Colors.primaries[Random().nextInt(Colors.primaries.length)])),
    );

    _seriesData.add(
      charts.Series(
          domainFn: (Pollution pollution, _) => pollution.place,
          measureFn: (Pollution pollution, _) => pollution.quantity,
          id: '2018',
          data: data2,
          fillPatternFn: (_, __) => charts.FillPatternType.forwardHatch,
          fillColorFn: (Pollution pollution, _) =>
              charts.ColorUtil.fromDartColor(
                  Colors.primaries[Random().nextInt(Colors.primaries.length)])),
    );

    _seriesData.add(
      charts.Series(
          domainFn: (Pollution pollution, _) => pollution.place,
          measureFn: (Pollution pollution, _) => pollution.quantity,
          id: '2019',
          data: data3,
          fillPatternFn: (_, __) => charts.FillPatternType.forwardHatch,
          fillColorFn: (Pollution pollution, _) =>
              charts.ColorUtil.fromDartColor(
                  Colors.primaries[Random().nextInt(Colors.primaries.length)])),
    );

    var pieData = [
      new Task('Work', 14.2,
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      new Task('Gym', 14.2,
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      new Task('Eat', 14.2,
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      new Task('Sleep', 14.2,
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      new Task('Learn', 14.2,
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      new Task('Entertainment', 14.2,
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      new Task('Other', 14.2,
          Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ];

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskValue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Daily Task',
        labelAccessorFn: (Task row, _) => '${row.taskValue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo[900],
              bottom: TabBar(
                indicatorColor: Colors.indigo[900],
                tabs: [
                  Tab(
                    icon: Icon(FontAwesomeIcons.solidChartBar),
                  ),
                  Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                  Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                ],
              ),
              title: Text('Flutter Charts'),
            ),
            body: TabBarView(
              children: [
//od tad series data

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Sales for the first 5 years',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: charts.LineChart(_seriesLineData,
                                defaultRenderer: new charts.LineRendererConfig(
                                    includeArea: true, stacked: true),
                                animate: true,
                                animationDuration: Duration(seconds: 2),
                                behaviors: [
                                  new charts.ChartTitle('Years',
                                      behaviorPosition:
                                          charts.BehaviorPosition.bottom,
                                      titleOutsideJustification: charts
                                          .OutsideJustification.middleDrawArea),
                                  new charts.ChartTitle('Sales',
                                      behaviorPosition:
                                          charts.BehaviorPosition.start,
                                      titleOutsideJustification: charts
                                          .OutsideJustification.middleDrawArea),
                                  new charts.ChartTitle(
                                    'Departments',
                                    behaviorPosition:
                                        charts.BehaviorPosition.end,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea,
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //do tego miejsca series data
//od teg miejsca
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'SO2 emission by world region (in milion tonnes)',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: charts.BarChart(
                              _seriesData,
                              animate: true,
                              barGroupingType: charts.BarGroupingType.grouped,
                              animationDuration: Duration(seconds: 2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                ///do tego miejsca data1,2,3
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Time spent on daily tasks',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                              child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 2),
                            behaviors: [
                              new charts.DatumLegend(
                                outsideJustification:
                                    charts.OutsideJustification.endDrawArea,
                                horizontalFirst: false,
                                desiredMaxRows: 2,
                                cellPadding: new EdgeInsets.only(
                                    right: 4.0, bottom: 4.0),
                                entryTextStyle: charts.TextStyleSpec(
                                    color: charts
                                        .MaterialPalette.purple.shadeDefault,
                                    fontFamily: 'Georgia',
                                    fontSize: 11),
                              )
                            ],
                            defaultRenderer: new charts.ArcRendererConfig(
                                arcWidth: 100,
                                arcRendererDecorators: [
                                  new charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.inside)
                                ]),
                          )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class Task {
  String task;
  double taskValue;
  Color colorval;

  Task(this.task, this.taskValue, this.colorval);
}

class Pollution {
  String place;
  int year;
  int quantity;
  Pollution(this.year, this.place, this.quantity);
}

class Sales {
  int yearval;
  int salesval;
  Sales(this.yearval, this.salesval);
}
