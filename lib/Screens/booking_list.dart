import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:visitorsa/Screens/booking_details.dart';
import 'package:visitorsa/Screens/item_details.dart';

class BookingList extends StatefulWidget {
  @override
  _BookingListState createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
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
                      builder: (context) => new BookingDetailsScreen()));
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5.5,
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 15,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 16),
                        child: SvgPicture.asset(
                          'images/green_calender.svg',
                          height: 30.0,
                          // width: 5.0,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("saturday, January, 18 2020",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                            Text("From 10:00 AM to 10:00 PM",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 4),
                        child: index==0?Row(
                          children: [
                            Icon(Icons.clear,color: Colors.red,),
                            SizedBox(width: 4,),
                            Text("Canceled",
                                style: TextStyle(
                                    color: Colors.red, fontSize: 15)),
                            SizedBox(width: 4,),

                          ],
                        ):Row(
                          children: [
                            SvgPicture.asset(
                              'images/booking_confirm.svg',
                              height: 30.0,
                              // width: 5.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                            SizedBox(width: 4,),
                            Text("Confirmed",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15)),
                            SizedBox(width: 4,),

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
