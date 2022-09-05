import 'package:flutter/material.dart';
import 'package:receipe/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'content.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentindex=0;

  final controller=PageController(initialPage: 0);
bool isLastPage=false;
@override
  void initState() {

    super.initState();

}

@override
  void dispose() {
controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  Column(
        children: [
      Expanded(
      child: PageView.builder(
        controller: controller,
        itemBuilder:(context,index)=>buildOnboardingScreen(contents[index]),
        itemCount: contents.length,
        onPageChanged: (int index){
          currentindex=index;
          setState(() {

            isLastPage=index==2;
          });
        },

      ),


    ),

          Container(
            color: Colors.yellow[100],
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                 TextButton(onPressed: ()=>controller.jumpToPage(0)
                    // if (currentindex != contents.length ) {
                    //   controller.jumpToPage(currentindex-1);
                    // }
                 , child: Text('SKIP'),),

                  Row(
                    children: [
         TextButton(onPressed: () {
           if (isLastPage) {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>
               Login()));
           }
           else {
             controller.nextPage(
                 duration: Duration(milliseconds: 500),
                 curve: Curves.easeInOut);
           }
         }   ,child: Text(isLastPage?'GetStarted':'NEXT'),)

                    ],
                  ),
                  // Row(
                  //   children: [
                  //    TextButton(onPressed: (){
                  //         Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                  //       }
                  //
                  //
                  //
                  //
                  //
                  //         ,child: Text(isLastPage ?'Getstarted':'Next'),),
                  //
                  //
                  //   ],
                  // )

                ]



            ),
          ),
]
    )


    );
  }
    Widget buildOnboardingScreen(onbordingS boarding){
  return Container(
color: Colors.yellow[100],
    child: Column(
      children: [


       Image.asset(boarding.image,
    fit: BoxFit.cover,
    height: 500,
         width: 500,
       ),
SizedBox(height: 10,),
        Text(boarding.title,style: TextStyle(
            fontSize: 30,
        ),),
        SizedBox(height: 5,),

        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(boarding.description,style: TextStyle(
              fontSize: 20,


            ),maxLines: 1,overflow: TextOverflow.ellipsis,),
          ),
        ),
        SizedBox(height: 10,),
        SmoothPageIndicator(
effect: WormEffect(dotColor: Colors.amberAccent,
  activeDotColor: Colors.deepOrangeAccent
),

          count:contents.length ,
          controller: controller,
        ),

      ],
    ),
  );

    }


}
