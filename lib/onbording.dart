import 'package:flutter/material.dart';
import 'package:receipe/home.dart';
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
        },

      ),


    ),

          Container(
            color: Colors.yellow[100],
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ElevatedButton(onPressed: (){
                    print('drtfgyuhij');
                    if (currentindex != contents.length ) {
                      controller.jumpToPage(currentindex-1);
                    }



                  }, child: Text('SKIP'),),

                  Row(
                    children: [
                      ElevatedButton(onPressed: (){
                        print ('dfdfd');
                        if(currentindex!=contents.length-1){
                          controller.jumpToPage(currentindex+ 1);
                        }else{

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                        }



                      },child: Text('Next')),
                    ],
                  )

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
    height: 400,
         width: 500,
       ),
SizedBox(height: 10,),
        Text(boarding.title,style: TextStyle(
            fontSize: 30,
        ),),
        SizedBox(height: 10,),

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
