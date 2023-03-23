import 'package:flutter/material.dart';
import 'package:skeleton_marker/skeleton_marker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isLoading = true;
  final GlobalKey skeletonKey = GlobalKey();
  String name = '';
  String title = '';
  String desc = 'A skeleton is the structural frame that supports the body of most animals. There are several types of skeletons,';
  String imgUrl = '';


    @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 15000), () {
      setState(() {
        imgUrl = "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4";
        name = 'yellow';
        title = 'title content';
         desc = 'A skeleton is the structural frame that supports the body of most animals. There are several types of skeletons, including the exoskeleton, which is the stable outer shell of an organism, the endoskeleton';
        isLoading = !isLoading; 
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          title: const Text('SkeletonsDemoPage'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              _buildHeaderWidget(),
            ],
          )
        ),
      ),
    );
  }

  _buildHeaderWidget() {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      color: Colors.grey,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: imgUrl == '' ? SizedBox(
              width: 100,
              height: 100,
            ).markSkeleton(isLoading: isLoading, shapeType: SkeletionShapeEnum.circle, fillColor: Colors.black) 
            : 
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgUrl)
                )

              ),
            ).markSkeleton(isLoading: isLoading, shapeType: SkeletionShapeEnum.circle),
          ),

          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(name, textAlign: TextAlign.left).markSkeleton(isLoading: isLoading)
                      )
                    )
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(title, textAlign: TextAlign.left).markSkeleton(isLoading: isLoading)
                      )
                    )
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: Container(
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
                    )
                  ],
                 ),
               ], 
            ),
          ),


        ],
      ),
    );

  }
}