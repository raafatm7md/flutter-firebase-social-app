import 'package:flutter/material.dart';
import 'package:social_app/views/login_signup_screens/login_screen.dart';
import 'package:social_app/views/login_signup_screens/register_screen.dart';
import 'package:social_app/views/widgets/widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/10.0,),
            Image.asset('assets/pics/hello.png'),
            SizedBox(height: 30.0,),
            Text('Hello',
            style: Theme.of(context).textTheme.displayLarge,),
            SizedBox(height: 20.0,),
            Text('Welcome to MeetUp, Get ready to dive into a world of connections and creativity',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center),
            SizedBox(height: 40.0,),
            appButton(text: 'Login', onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            }),
            SizedBox(height: 20.0,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    backgroundColor: Colors.black,
                    fixedSize: Size(double.maxFinite, 50),
                    alignment: AlignmentDirectional.center,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),side: BorderSide(color: Colors.deepPurple))),
                child: Text(
                  'Sign Up',
                  style: const TextStyle(fontSize: 16),
                )),
          ],
        ),
      ),
    );
  }
}
