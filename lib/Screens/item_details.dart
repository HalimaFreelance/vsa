import 'dart:async';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:visitorsa/Screens/reviews_container.dart';
import 'package:visitorsa/utils/app_localizations.dart';

import 'triangle.dart';

class ItemDetails extends StatefulWidget {
  ItemDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  TextEditingController _searchController = new TextEditingController();

  @override
  initState() {
    super.initState();
    _searchController.addListener(() {
      final search = _searchController.text;
      _searchController.value = _searchController.value.copyWith(
        text: search,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    final _scrollController = ScrollController();

    Widget imageCarousel(List images) {
      // print("hh" + images.toString());
      // removeUserData();

      return Container(
        height: (MediaQuery.of(context).size.height / 2) - 120,
        child: Container(
          color: Colors.white,
          child: new Carousel(
            boxFit: BoxFit.cover,
            images: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: GestureDetector(
                          child: Image.network(i, fit: BoxFit.fill),
                          onTap: () {}));
                },
              );
            }).toList(),
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 500),
            dotSize: 7.0,
            indicatorBgPadding: 2.0,
            dotHorizontalPadding: 0.9,
            dotBgColor: Colors.transparent,
            dotIncreasedColor: Color(0xff24a041),
          ),
        ),
      );
    }

    // return Scaffold(
    //   body: ListView(
    //     controller: _scrollController,
    //     children: [
    //       Column(
    //         children: [
    //           imageCarousel(images),
    //         ],
    //       )
    //     ],
    //   ),
    //   // This trailing comma makes auto-formatting nicer for build methods.
    // );
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false)),
            actions: [
              SizedBox(
                width: 8,
              ),
              Icon(Icons.share),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.favorite),
              SizedBox(
                width: 8,
              )
            ],
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: imageCarousel(images),
            ),
          )
        ];
      },
      body: ListView.builder(
          itemExtent: 2000, // don't remove it
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmoothStarRating(
                        allowHalfRating: false,
                        onRated: (value) {},
                        starCount: 5,
                        rating: 5,
                        size: 15.0,
                        isReadOnly: true,
                        color: Colors.deepOrangeAccent,
                        borderColor: Colors.deepOrangeAccent,
                        spacing: 0.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Text(
                      "Duane Street hotel",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, right: 8.0, left: 8.0, bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "2.4 miles from city center",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: new TextStyle(color: Colors.black),
                      controller: _searchController,
                      autofocus: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(5.0),
                            ),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: "Check-in",
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Color(0xff0f331d),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, left: 8.0, bottom: 8.0, top: 20),
                            child: Wrap(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 400,
                                      child: ListView.builder(
                                        itemCount: 5,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFf4f4f4),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  width: 280.0,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 16.0,
                                                                left: 16.0,
                                                                right: 16.0,
                                                                bottom: 4),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              "9 AM",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFa8a8a8),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: Color(
                                                                    0xFFa8a8a8)),
                                                            Text(
                                                              "6 PM",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFFa8a8a8),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Icon(
                                                                Icons
                                                                    .access_time,
                                                                color: Color(
                                                                    0xFFa8a8a8)),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        child: Divider(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        'Standard Room',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF727272),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "\$112",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF727272),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "per night",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF727272),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Divider(
                                                        color: Colors.grey,
                                                        thickness: 1,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xFF8fcfaa),
                                                              borderRadius:
                                                                  new BorderRadius
                                                                      .all(const Radius
                                                                          .circular(
                                                                      10.0))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  'Details on the offer',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Details on the offer',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                      'Details on the offer',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Details on the offer',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                      'Details on the offer',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Details on the offer',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                      'Details on the offer',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Details on the offer',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                      'Details on the offer',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xff24a041),
                                                                borderRadius:
                                                                    new BorderRadius
                                                                        .only(
                                                                  bottomLeft:
                                                                      const Radius
                                                                              .circular(
                                                                          30.0),
                                                                  bottomRight:
                                                                      const Radius
                                                                              .circular(
                                                                          30.0),
                                                                )),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          child: Center(
                                                            child: Text(
                                                              "Book now",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: AppLocalizations.of(context)
                                                    .locale
                                                    .languageCode ==
                                                "en"
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Text(
                                          "Description",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: AppLocalizations.of(context)
                                                    .locale
                                                    .languageCode ==
                                                "en"
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: AppLocalizations.of(context)
                                                    .locale
                                                    .languageCode ==
                                                "en"
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Text(
                                          "Hotel amenities",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'images/knife.svg',
                                            height: 15.0,
                                            // width: 5.0,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Restaurants",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'images/parking.svg',
                                            height: 15.0,
                                            // width: 5.0,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Parking",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'images/knife.svg',
                                            height: 15.0,
                                            // width: 5.0,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Restaurants",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: AppLocalizations.of(context)
                                                    .locale
                                                    .languageCode ==
                                                "en"
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Text(
                                          "Hotel Conditions",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: AppLocalizations.of(context)
                                                    .locale
                                                    .languageCode ==
                                                "en"
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SmoothStarRating(
                                          allowHalfRating: false,
                                          onRated: (value) {},
                                          starCount: 5,
                                          rating: 5,
                                          size: 15.0,
                                          isReadOnly: true,
                                          color: Colors.deepOrangeAccent,
                                          borderColor: Colors.deepOrangeAccent,
                                          spacing: 0.0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, left: 8.0),
                                      child: Text(
                                        "Duane Street hotel",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0,
                                          right: 8.0,
                                          left: 8.0,
                                          bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "2.4 miles from city center",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0,
                                          right: 8.0,
                                          left: 8.0,
                                          bottom: 8),
                                      child: Text(
                                        "+27646776767676",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: AppLocalizations.of(context)
                                                    .locale
                                                    .languageCode ==
                                                "en"
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Text(
                                          "Reviews",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                     ReviewsContainer(),
                                    SizedBox(height: 8,),
                                    Container(
                                      width: double.infinity,
                                      child: RaisedButton(
                                        child: Text(
                                          AppLocalizations.of(context).translate('see_offers'),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Color(
                                            0xff24a041),
                                        onPressed: ()  {
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: ClipPath(
                            clipper: TriangleClipper(),
                            child: Container(
                              color: Colors.white,
                              height: 20,
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }
}
