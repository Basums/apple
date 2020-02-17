import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import '../static/messageO/costom.dart';
// import 'dart:math';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 20.0, bottom: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.blueGrey,
                      size: 30.0,
                    ),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Surport",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25.0,
                      fontFamily: "yahei",
                      letterSpacing: 1.0,
                    )),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 30.0,
                      color: Colors.blueGrey,
                    ),
                    onPressed: (){},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,vertical: 6.0
                        ),
                        child: Text(
                          "From us",
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text("5+ Stories",
                  style: TextStyle(
                    color: Color(0xff528B8B),
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





//             Stack(
//               children: <Widget>[
//                 CardScrollWidget(currentPageIndex),
//                 Positioned.fill(
//                     child: PageView.builder(
//                       itemCount: images.length,
//                       controller: controller,
//                       reverse: true,
//                       itemBuilder: (context,index){
//                         return Container();
//                       },
//                     )
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CardScrollWidget extends StatelessWidget {
//   var currentPageIndex;
//   var padding = 20.0;
//   var verticalInset = 20.0;
//   CardScrollWidget(this.currentPageIndex);

//   @override
//   Widget build(BuildContext context) {
//     return new AspectRatio(
//         aspectRatio: widgetAspectRatio,
//         child: LayoutBuilder(builder: (context, contrains){
//             var width = contrains.maxWidth;
//             var height = contrains.maxHeight;

//             var safeWidth = width - 2 * padding;
//             var safeHeight = height - 2 * padding;

//             var heightOfPrimaryCard = safeHeight;
//             var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

//             var primaryCardLeft = safeWidth - widthOfPrimaryCard;
//             var horizontalInset = primaryCardLeft / 2;

//             List<Widget> cardList = new List();

//             for(var i=0; i<images.length; i++){
//               var delta = i -currentPageIndex;

//               bool isOnRight = delta > 0;
//               var start = padding +
//                   max(
//                       primaryCardLeft -
//                           horizontalInset * -delta * (isOnRight ? 15 : 1),
//                       0.0);
//               var cardItem = Positioned.directional(
//                 top: padding + verticalInset * max(-delta,0.0),
//                 bottom: padding + verticalInset * max(-delta,0.0),
//                 start: start,
//                   textDirection: TextDirection.rtl,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12.0),
//                   child: Container(
//                     //加阴影
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xff528B8B),
//                           offset: Offset(3.0,6.0),
//                           blurRadius: 5.0
//                         )
//                       ]
//                     ),
//                     child: AspectRatio(
//                       aspectRatio: cardAspectRatio,
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: <Widget>[
//                           Image.asset(images[i],fit: BoxFit.cover,),
//                           Align(
//                             alignment: Alignment.topCenter,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: <Widget>[
//                                 SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0,),
//                                   child: Text(titles[i],
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 25.0,
//                                     fontFamily: "yahei"
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 3.0,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0,),
//                                   child: Text(contexts[i],
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20.0,
//                                         fontFamily: "yahei"
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//               cardList.add(cardItem);
//             }
//             return Stack(
//               children: cardList,
//             );
//           }),
//     );
//   }
// }

