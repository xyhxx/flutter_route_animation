[English] | [中文](https://github.com/xyhxx/flutter_route_animation/blob/master/doc/cn.md)

# Introduction

Route animation by using flutter's transition widget

# Use

use Navigator.push to push route:

``` dart

  Navigator.push(context, ProsteRouteAnimation.fadeRoute(route: DemoPage(), ...));

```

use Navigator.pushName to push route，Can be set through onGenerateRoute in MaterialApp

``` dart
  MaterialApp(
    onGenerateRoute: (settings) {
      Widet widget;
      switch(settings.name) {
        case '/demo':
          widget = DemoPage();
          break;
      }

      return ProsteRouteAnimation.fadeRoute(child: widget, ...);
    }
  )

  ...

  RaisedButton(
    onPressed: () {
      Navigator.pushNamed(
        context,
        '/demo',
        arguments: {
          'param': param,
        },
      );
    },
    child: Text(title),
  );
```

# Api

+ ProsteRouteAnimation.fadeRoute
+ ProsteRouteAnimation.slideRoute
+ ProsteRouteAnimation.scaleRoute
+ ProsteRouteAnimation.rotationRoute
+ ProsteRouteAnimation.sizeRoute

# Demo

``` dart

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:proste_route_animation/proste_route_animation.dart';
import 'package:route_demo/route/demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        var arg = Map.from(settings.arguments);
        var route = DemoPage(
          param: arg['param'],
        );
        switch (arg['type']) {
          case 'fadeRoute':
            return ProsteRouteAnimation.fadeRoute(
              route: route,
              duration: Duration(milliseconds: arg['duration']),
              reverseDuration: Duration(milliseconds: arg['reverseDuration']),
            );
          case 'slideRoute':
            return ProsteRouteAnimation.slideRoute(
              route: route,
              mode: arg['slideMode'],
              duration: Duration(milliseconds: arg['duration']),
              reverseDuration: Duration(milliseconds: arg['reverseDuration']),
              useFade: arg['useFade'],
            );
          case 'scaleRoute':
            return ProsteRouteAnimation.scaleRoute(
              route: route,
              alignment: arg['aligment'],
              duration: Duration(milliseconds: arg['duration']),
              reverseDuration: Duration(milliseconds: arg['reverseDuration']),
              useFade: arg['useFade'],
            );
          case 'rotationRoute':
            return ProsteRouteAnimation.rotationRoute(
              route: route,
              alignment: arg['aligment'],
              duration: Duration(milliseconds: arg['duration']),
              reverseDuration: Duration(milliseconds: arg['reverseDuration']),
              useFade: arg['useFade'],
            );
          case 'sizeRoute':
            return ProsteRouteAnimation.sizeRoute(
              route: route,
              alignment: arg['aligment'],
              duration: Duration(milliseconds: arg['duration']),
              reverseDuration: Duration(milliseconds: arg['reverseDuration']),
              useFade: arg['useFade'],
              axis: arg['axis'],
            );
        }
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('proste_route_animation'),
        ),
        body: MyAppHome(),
      ),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  _MyAppHomeState createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  String _returnMessage = '';
  SlideMode _slideMode = SlideMode.fromLeft;
  Alignment _alignment = Alignment.center;
  bool _useFade = false;
  Axis _axis = Axis.vertical;
  int _duration = 300;
  int _reverseDuration = 300;

  String _getRandom() {
    Random random = Random();
    return random.nextDouble().toString();
  }

  Widget _paddingWidget({Widget child}) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: child,
    );
  }

  Widget _radioForSlideMode(String title, SlideMode mode) {
    return Container(
      width: 200,
      child: RadioListTile<SlideMode>(
        groupValue: _slideMode,
        title: Text(title),
        onChanged: (value) {
          this.setState(() {
            _slideMode = value;
          });
        },
        value: mode,
      ),
    );
  }

  Widget _radioForAligment(String title, Alignment alignment) {
    return Container(
      width: 200,
      child: RadioListTile<Alignment>(
        groupValue: _alignment,
        title: Text(title),
        onChanged: (value) {
          this.setState(() {
            _alignment = value;
          });
        },
        value: alignment,
      ),
    );
  }

  Widget _radioForAxis(String title, Axis axis) {
    return Container(
      width: 200,
      child: RadioListTile<Axis>(
        groupValue: _axis,
        title: Text(title),
        onChanged: (value) {
          this.setState(() {
            _axis = value;
          });
        },
        value: axis,
      ),
    );
  }

  Widget _jumpButton(String title) {
    return RaisedButton(
      onPressed: () {
        String param = _getRandom();
        Navigator.pushNamed(
          context,
          '/demo',
          arguments: {
            'param': param,
            'type': title,
            'slideMode': _slideMode,
            'aligment': _alignment,
            'useFade': _useFade,
            'axis': _axis,
            'duration': _duration,
            'reverseDuration': _reverseDuration,
          },
        ).then((value) {
          setState(() {
            _returnMessage = value.toString();
          });
        });
      },
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _paddingWidget(
          child: Text(
            'returnMessage: $_returnMessage',
            textAlign: TextAlign.center,
          ),
        ),
        _paddingWidget(
          child: Column(
            children: [
              Text('SlideMode(slideRoute):'),
              Wrap(
                children: [
                  _radioForSlideMode('slideLeft', SlideMode.fromLeft),
                  _radioForSlideMode('fromRight', SlideMode.fromRight),
                  _radioForSlideMode('fromTop', SlideMode.fromTop),
                  _radioForSlideMode('fromBottom', SlideMode.fromBottom),
                ],
              )
            ],
          ),
        ),
        _paddingWidget(
          child: Column(
            children: [
              Text('Aligment(scaleRoute, rotationRoute,sizeRoute):'),
              Text(
                'all types can be used,the following is just an example',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Wrap(
                children: [
                  _radioForAligment('center', Alignment.center),
                  _radioForAligment('topLefter', Alignment.topLeft),
                  _radioForAligment('topRight', Alignment.topRight),
                  _radioForAligment('bottomLeft', Alignment.bottomLeft),
                  _radioForAligment('bottomRight', Alignment.bottomRight),
                ],
              ),
            ],
          ),
        ),
        _paddingWidget(
          child: Column(
            children: [
              Text('Axis(sizeRoute):'),
              Wrap(
                children: [
                  _radioForAxis('vertical', Axis.vertical),
                  _radioForAxis('horizontal', Axis.horizontal),
                ],
              ),
            ],
          ),
        ),
        _paddingWidget(
          child: Column(
            children: [
              Text('useFade(slideRoute,scaleRoute,rotationRoute,sizeRoute)'),
              Switch(
                value: _useFade,
                onChanged: (value) {
                  setState(() {
                    _useFade = value;
                  });
                },
              ),
            ],
          ),
        ),
        _paddingWidget(
          child: Column(
            children: [
              Text('duration(milliseconds)'),
              Slider(
                min: 100,
                max: 2000,
                divisions: 19,
                label: 'duartion is $_duration',
                value: _duration.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _duration = value.toInt();
                  });
                },
              ),
            ],
          ),
        ),
        _paddingWidget(
          child: Column(
            children: [
              Text('reverseDuration(milliseconds)'),
              Slider(
                min: 100,
                max: 2000,
                divisions: 19,
                label: 'reverseDuration is $_reverseDuration',
                value: _reverseDuration.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _reverseDuration = value.toInt();
                  });
                },
              ),
            ],
          ),
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            _jumpButton('fadeRoute'),
            _jumpButton('slideRoute'),
            _jumpButton('scaleRoute'),
            _jumpButton('rotationRoute'),
            _jumpButton('sizeRoute'),
          ],
        ),
      ],
    );
  }
}


```