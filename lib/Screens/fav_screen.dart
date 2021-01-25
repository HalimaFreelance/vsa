import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:visitorsa/Screens/item_details.dart';
import 'package:visitorsa/Screens/signin_screen.dart';
import 'package:visitorsa/Screens/signup_screen.dart';
import 'package:visitorsa/utils/app_localizations.dart';
import 'package:visitorsa/utils/colors.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
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
                      builder: (context) => new ItemDetails()));
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.4,
                  child: Image.asset(
                    "images/test.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 12,
                  color: Color(0xFF201f1f).withOpacity(0.6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "World plaza trade china center ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  "1000 km from makka",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 4),
                        child: Column(
                          children: [
                            SmoothStarRating(
                              color: Colors.orange,
                              rating: 4,
                              starCount: 5,
                              size: 14,
                            ),
                            Text("2000 views",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
