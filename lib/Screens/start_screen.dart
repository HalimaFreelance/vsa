import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:visitorsa/Screens/signin_screen.dart';
import 'package:visitorsa/Screens/signup_screen.dart';
import 'package:visitorsa/utils/app_localizations.dart';
import 'package:visitorsa/utils/colors.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _clicked=0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/blur_bg.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "VISITORSA.com",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      AppLocalizations.of(context)
                          .translate('lets_get_started'),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Text(
                      AppLocalizations.of(context).translate('start_msg'),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Center(
                          child: new Text(
                              AppLocalizations.of(context).translate('login'),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _clicked==0?AppColors.darkGreen:_clicked==1?AppColors.lightGreen:AppColors.darkGreen),
                      ),
                      onTap: () {
                        {
                          setState(() {
                            _clicked=1;
                          });
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new SignInScreen()));
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Center(
                          child: new Text(
                              AppLocalizations.of(context).translate('sign_up'),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: _clicked==0?AppColors.darkGreen:_clicked==2?AppColors.lightGreen:AppColors.darkGreen//# Color(0xFFf5f5f5)
                            ),
                      ),
                      onTap: () {
                        setState(() {
                          _clicked=2;
                        });
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SignUpScreen()));
                      },
                    ),
                    Expanded(
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: new TextSpan(
                              text:
                                  'by creating or logging to an account you agree to out ',
                              children: <TextSpan>[
                                new TextSpan(
                                    text: AppLocalizations.of(context)
                                        .translate('terms_and_conditions'),
                                    style: new TextStyle(
                                      decoration: TextDecoration.underline,
                                    )),
                                new TextSpan(text: ' and '),
                                new TextSpan(
                                  text: AppLocalizations.of(context)
                                      .translate('privacy_policy'),
                                  style: new TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
