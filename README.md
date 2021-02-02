[English] | [中文](https://github.com/xyhxx/flutter_route_animation/blob/master/doc/cn.md)

# Introduction

Route animation by using flutter's transition widget

# Usage

use Navigator.push() to push route:

``` dart

  Navigator.push(context, ProsteRouteAnimation.fadeRoute(route: DemoPage(), ...));

```

use Navigator.pushNamed() to push route，Can be set through onGenerateRoute in MaterialApp

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
    child: Text('push'),
  );
```

# Api


+ ProsteRouteAnimation.fadeRoute
``` dart
  ProsteRouteAnimation.fadeRoute(
    route: DemoPage(),
    duration: Duration(milliseconds: 300),
    reverseDuration: Duration(milliseconds: 300),
    curve: Curves.liner,
  )
```
+ ProsteRouteAnimation.slideRoute
``` dart
ProsteRouteAnimation.slideRoute(
  route: DemoPage(),
  mode: SlideMode.fromLeft,
  duration: Duration(milliseconds: 300),
  reverseDuration: Duration(milliseconds: 300),
  useFade: true,
  curve: Curves.liner,
);
```
+ ProsteRouteAnimation.scaleRoute
``` dart
ProsteRouteAnimation.scaleRoute(
  route: DemoPage(),
  alignment: Alignment.center,
  duration: Duration(milliseconds: 300),
  reverseDuration: Duration(milliseconds: 300),
  useFade: true,
  curve: Curves.liner,
);
```
+ ProsteRouteAnimation.rotationRoute
``` dart
ProsteRouteAnimation.rotationRoute(
  route: DemoPage(),
  alignment: Alignment.center,
  duration: Duration(milliseconds: 300),
  reverseDuration: Duration(milliseconds: 300),
  useFade: true,
  curve: Curves.liner,
);
```
+ ProsteRouteAnimation.sizeRoute
``` dart
ProsteRouteAnimation.sizeRoute(
  route: DemoPage(),
  alignment: Alignment.center,
  duration: Duration(milliseconds: 300),
  reverseDuration: Duration(milliseconds: 300),
  useFade: true,
  axis: Axis.vertical,
  curve: Curves.liner,
);
```