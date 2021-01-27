import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:visitorsa/Screens/congratulation_booking_details.dart';
import 'package:visitorsa/utils/app_localizations.dart';

class BookingDetailsNextScreen extends StatefulWidget {
  @override
  _BookingDetailsNextScreenState createState() => _BookingDetailsNextScreenState();
}

class _BookingDetailsNextScreenState extends State<BookingDetailsNextScreen> {
  double rating = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).translate('your_booking'),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  onRated: (v) {
                                    rating = v;
                                  },
                                  starCount: 5,
                                  rating: rating,
                                  size: 25.0,
                                  isReadOnly: true,
                                  color: Colors.orange,
                                  borderColor: Colors.orange,
                                  spacing: 0.0),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Duan Street Hotel",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Standard Room"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child:  Icon(
                                        Icons.calendar_today,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("81/2/2020")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("10:00 AM")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SvgPicture.asset(
                                        'images/booking_bed.svg',
                                        height: 25.0,
                                        width: 25.0,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("\$78")
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Colors.black),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('total'),
                                  style: TextStyle(
                                      fontWeight:
                                      FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                    "97",
                                    style: TextStyle(
                                        decoration:
                                        TextDecoration
                                            .lineThrough)),
                                Text("95"),
                              ],
                            ),
                          ),
                          Divider(color: Colors.black),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate(
                                        'pricing_details'),
                                style: TextStyle(
                                    fontWeight:
                                        FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(AppLocalizations.of(
                                        context)
                                    .translate(
                                        'to_be_paid_now')),
                                Spacer(),
                                Text('(\$0)'),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(AppLocalizations.of(
                                        context)
                                    .translate(
                                        'to_be_paid_at_hotel')),
                                Spacer(),
                                Text('(\$192)',
                                    style: TextStyle(
                                        decoration:
                                            TextDecoration
                                                .lineThrough)),
                                Text(' \$95'),
                              ],
                            ),
                          ),
                          Divider(color: Colors.black),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate(
                                    'additional_taxes_and_fees_for_information_only'),
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(AppLocalizations.of(
                                    context)
                                    .translate('city_taxes')),
                                Spacer(),
                                Text("taxes"),
                              ],
                            ),
                          ),
                          Divider(color: Colors.black),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate(
                                    'terms_and_conditions'),
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate(
                                    'pay_directly_at_app'),
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                'booked are displayed \nexclusive of taxes or surcharges applied by the\nhotelier. Any additional taxes should be paid directly\nat the app',
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .translate('total'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text("34",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Spacer(),
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                              new CongratulationBookingDetailsScreen()));
                                    },
                                    color: Colors.green,
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate('next'),
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
