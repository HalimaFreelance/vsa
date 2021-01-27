import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:visitorsa/Screens/booking_details_next.dart';
import 'package:visitorsa/utils/app_localizations.dart';
import 'package:visitorsa/utils/colors.dart';

class BookingDetailsScreen extends StatefulWidget {
  @override
  _BookingDetailsScreenState createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  double rating = 5.0;
  TextEditingController _arr = new TextEditingController();
  TextEditingController _req = new TextEditingController();


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
                  Align(
                    alignment:AppLocalizations.of(context).locale.languageCode ==
                        "en"
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Your Arrival Hotel",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    keyboardType:
                    TextInputType.text,
                    controller: _arr,
                    autofocus: false,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding:
                        const EdgeInsets.all(
                            15.0),
                        child: Icon(Icons.access_time,color: Colors.green,),
                      ),
                      hintText: AppLocalizations.of(
                          context)
                          .translate('time_to_arr'),
                      hintStyle: TextStyle(
                          color: Colors.grey),
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0,
                          10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey,width: 2),
                          borderRadius:
                          BorderRadius.circular(
                              10.0)),
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    keyboardType:
                    TextInputType.text,
                    controller: _req,
                    autofocus: false,

                    decoration: InputDecoration(

                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding:
                        const EdgeInsets.all(
                            15.0),
                        child: Icon(Icons.info_outline,color: Colors.green,),
                      ),
                      hintText: AppLocalizations.of(
                          context)
                          .translate('have_sp_req'),
                      hintStyle: TextStyle(
                          color: Colors.grey),
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0,
                          10.0, 20.0, 10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(
                              10.0)),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text("The hotel will do their best to accommodate your request"),
                  SizedBox(height: 8,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new BookingDetailsNextScreen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: Center(
                        child: new Text(
                            AppLocalizations.of(context).translate('next'),
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: AppColors.lightGreen),
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
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _req.dispose();
    _arr.dispose();
  }
}
