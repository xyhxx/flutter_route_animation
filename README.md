[English] | [中文](https://github.com/xyhxx/flutter_route_animation/blob/master/doc/cn.md)

# Introduction

Route animation by using flutter's transition widget

  <image style="width: 180px" src="https://github.com/xyhxx/program_preview/raw/master/proste_route_animation/preview.gif">

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

      return ProsteRouteAnimation.fadeRoute(route: widget, ...);
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

# ProsteSlideMode
Determine the animation path of ProsteRouteAnimation.slideRoute()

+ fromLeft
  > page from left to right
+ fromRight
  > page from right to left
+ fromBottom
  > page from bottom to top
+ fromTop
  > page from top to bottom

``` dart
ProsteRouteAnimation.slideRoute(
  route: DemoPage(),
  mode: ProsteSlideMode.fromLeft,
  ...
);
```

# ProsteAnimationMode
Determine which animation method the constructor method uses

+ fade
  > fade animation
+ slideFromLeft
  > animation use slide and page from left to right
+ slideFromRight
  > animation use slide and page from right to left
+ slideFromBottom
  > animation use slide and page from bottom to top
+ slideFromTop
  > animation use slide and page from top to bottom
+ scale
  > animation use scale
+ rotation
  > animation use rotation
+ size
  > animation use size change

``` dart
ProsteRouteAnimation(
  builder: (context) => DemoPage(),
  mode: ProsteAnimationMode.fade,
  ...
);
```

# Api

__`Notice that using the constructor method can not control the routing time,other static functions can control the entry and exit time.`__

+ ProsteRouteAnimation

``` dart
ProsteRouteAnimation(
  builder: (context) => DemoPage(),
  curve: Curves.linear,
  useFade: true,
  axis: Axis.vertical,
  alignment: Alignment.center,
  mode: ProsteAnimationMode.fade,
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
  mode: ProsteSlideMode.fromLeft,
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