import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:visitorsa/Screens/item_details.dart';
import 'package:visitorsa/Screens/offer_details.dart';
import 'package:visitorsa/Screens/signin_screen.dart';
import 'package:visitorsa/Screens/signup_screen.dart';
import 'package:visitorsa/utils/app_localizations.dart';
import 'package:visitorsa/utils/colors.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
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
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context).translate('search_offer'),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            elevation: 0.0,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text("From",style: TextStyle(color: Colors.grey,fontSize: 18)),
                                SizedBox(height: 8,),
                                Text("Haram",style: TextStyle(color: Colors.green,fontSize: 16)),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.airplanemode_active,
                            color: Colors.green,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text("To",style: TextStyle(color: Colors.grey,fontSize: 18)),
                                SizedBox(height: 8,),
                                Text("Mecca",style: TextStyle(color: Colors.green,fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(1.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new OfferDetailsScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 5,
                                child: Image.asset(
                                  "images/test.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              16,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightGreen,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Text(
                                          '300.00 SAR',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
