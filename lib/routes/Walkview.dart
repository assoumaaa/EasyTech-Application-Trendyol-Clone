import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:week6_starter/routes/routesControl.dart';
import 'package:week6_starter/routes/start.dart';
import 'package:week6_starter/utils/color.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SafeArea(
        child: IntroductionScreen(

          done: Text('Get Started', style: TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.whiteBackground)),
          onDone: () => goHome(context),
          showSkipButton: true,
          skip: Text('Skip', style: TextStyle(color:AppColors.whiteBackground ),),
          onSkip: () => goHome(context),
          next: Icon(Icons.arrow_forward, color: AppColors.whiteBackground,),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme
              .of(context)
              .primaryColor,
          skipFlex: 0,
          nextFlex: 0,

          pages: [
            PageViewModel(
              image: Image.network(
                  "https://www.yatilabs.com/blog/storage/2021/03/UI-UX-guide.png"),
              title: 'Welcome to EasyTech app',
              body: "Let's start with basics",
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Categories',
              body: 'Here you can find specific products you want',
              image: Image.network(
                  "https://www.yatilabs.com/blog/storage/2021/03/UI-UX-guide.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Favorite page',
              body: 'In this page you can see the products you liked',
              image: Image.network(
                  "https://www.yatilabs.com/blog/storage/2021/03/UI-UX-guide.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Cart',
              body: 'Whenever you want to buy something just check your cart!',
              image: Image.network(
                  "https://www.yatilabs.com/blog/storage/2021/03/UI-UX-guide.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Profile',
              body: 'Create your profile to fully benefit from our app!',
              image: Image.network(
                  "https://www.yatilabs.com/blog/storage/2021/03/UI-UX-guide.png"),
              decoration: getPageDecoration(),
            ),
          ],

          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  PageDecoration getPageDecoration() =>
      PageDecoration(
        titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 21),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(23),
        pageColor: AppColors.whiteBackground,
      );

  //function to goes to HomePage if u click skip or done
  void goHome(context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => RouteControl()),
      );

  DotsDecorator getDotDecoration() =>
      DotsDecorator(
        color: AppColors.textFieldGreyBorder,
        //activeColor: Colors.orange,
        size: Size(10, 11),
        activeSize: Size(21, 11),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
      );
}
