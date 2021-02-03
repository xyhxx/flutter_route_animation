# Introduction

通过使用flutter的transition组件进行路由过渡动画

  <image style="width: 180px" src="https://github.com/xyhxx/program_preview/raw/master/proste_route_animation/preview.gif">

# Usage

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
调用ProsteRouteAnimation.slideRoute()时，确定动画路径。

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
调用构造方法时确定动画方式

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

__`注意使用构造方法不能通过时间控制路由的入场和离场动画时间，其他静态方法可以控制路由动画的离场和入场动画时间`__

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
    curve: Curves.liner,
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

> 如果你发现了bug，请发送到[issues](https://github.com/xyhxx/flutter_route_animation/issues)，我会看到后会尽快修复，谢谢！！