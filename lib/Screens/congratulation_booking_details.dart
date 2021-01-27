import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:visitorsa/utils/app_localizations.dart';

class CongratulationBookingDetailsScreen extends StatefulWidget {
  // Order order;

  // CongratulationBookingDetailsScreen({this.order});
  CongratulationBookingDetailsScreen();

  @override
  _CongratulationBookingDetailsScreenState createState() =>
      _CongratulationBookingDetailsScreenState();
}

class _CongratulationBookingDetailsScreenState
    extends State<CongratulationBookingDetailsScreen> {
  double rating = 5.0;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFeeeeee),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('congratulation'),
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            'images/component40.svg',
                            height: 120.0,
                            width: 120.0,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)
                              .translate('your_booking_confirmed'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 20),
                        ),
                        Text(
                          AppLocalizations.of(context)
                              .translate('your_booking_request'),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text('by email: email@gamail.com',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.event,
                                color: Colors.green,
                                size: 40,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text('Saturday, january, 18,2020',
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text('From 10:00 AM to 10:00 PM',
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SvgPicture.asset(
                                  'images/icon_location.svg',
                                  color: Colors.green,
                                  height: 35.0,
                                  width: 35.0,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Duan Street Hotel",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  SmoothStarRating(
                                      allowHalfRating: false,
                                      onRated: (v) {
                                        rating = v;
                                      },
                                      starCount: 5,
                                      rating: rating,
                                      size: 18.0,
                                      isReadOnly: true,
                                      color: Colors.orange,
                                      borderColor: Colors.orange,
                                      spacing: 0.0),
                                  Text("130 duan street, Mecca",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text('Phone: 03666355553',
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SvgPicture.asset(
                                  'images/booking_bed.svg',
                                  height: 35.0,
                                  width: 35.0,
                                  color: Colors.green,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Standard Room',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "190",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$80",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('pricing_details'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(AppLocalizations.of(context)
                                  .translate('to_be_paid_now')),
                              Spacer(),
                              Text('(\$0)'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(AppLocalizations.of(context)
                                  .translate('to_be_paid_at_hotel')),
                              Spacer(),
                              Text('(\$192)',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough)),
                              Text(' \$95'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('free_return'),
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              AppLocalizations.of(context).translate(
                                  'additional_taxes_and_fees_for_information_only'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(AppLocalizations.of(context)
                                .translate('city_taxes')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                              width: double.infinity,
                              child: Text("taxes")),
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.white70,
                              child: Text(
                                AppLocalizations.of(context).translate('cancel_booking'),
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),

                        ),
                        Container(
                          height: 150,
                          child: GoogleMap(
                            // markers: _markers.values.toSet(),
                            // YOUR MARKS IN MAP
                            myLocationButtonEnabled: false,
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                          // gestureRecognizers: Set()
                          //   ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
