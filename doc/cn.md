# Introduction

通过使用flutter的transition组件进行路由过渡动画

# Use

通过Navigator.push()跳转直接传入包裹后的路由即可

``` dart

  Navigator.push(context, ProsteRouteAnimation.fadeRoute(route: DemoPage(), ...));

```

想要通过Navigator.pushName()跳转，可以通过MaterialApp中的onGenerateRoute进行设置

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