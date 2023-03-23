<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# skeleton_marker

easy mark widget, make the widget become a skeleton widget with animation transform


<p>
  <img src="https://github.com/yellowChao/skeleton_marker/blob/main/demo.gif?raw=true" height="50%" width="50%" />
</p>

## Features

* support custom switch animation

## Usage

```yaml
dependencies:
  skeleton_marker: 
```

```dart
import 'package:skeleton_marker/skeleton_marker.dart'; // import skeleton_marker lib

...

Container(
    margin: EdgeInsets.only(right: 10),
    child: Text(
        desc,
        style: TextStyle(
        overflow: TextOverflow.ellipsis
        ),
        textAlign: TextAlign.left,
        maxLines: 2,
    ).markSkeleton(isLoading: isLoading, shapeType: SkeletionShapeEnum.roundedRectangle)
)

// call markSkeleton by widget
```





