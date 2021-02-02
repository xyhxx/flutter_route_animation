[English] | [中文](https://github.com/xyhxx/flutter_route_animation/blob/master/doc/cn.md)

# Introduction

Route animation by using flutter's transition widget

# Usage

use Navigator.push() to push route:

``` dart

  Navigator.push(context, ProsteRouteAnimation.fadeRoute(route: DemoPage(), ...));

```

use Navigator.pushNamed() to push route，Can be set onGenerateRoute in MaterialApp

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

+ ProsteRouteAnimation

``` dart
ProsteRouteAnimation(
  builder: (context) => DemoPage(),
  curve: Curves.linear,
  useFade: true,
  axis: Axis.vertical,
  alignment: Alignment.center,
  mode: AnimationMode.fade,
);
```

+ ProsteRouteAnimation.fadeRoute
``` dart
  ProsteRouteAnimation.fadeRoute(
    route: DemoPage(),
    duration: Duration(milliseconds: 300),
    reverseDuration: Duration(milliseconds: 300),
    curve: Curves.linear,
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
  curve: Curves.linear,
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
  curve: Curves.linear,
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
  curve: Curves.linear,
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
  curve: Curves.linear,
);
```

> If you find a bug, please send it to [issues](https://github.com/xyhxx/flutter_route_animation/issues), I will fix it as soon as I see it, thinks!!