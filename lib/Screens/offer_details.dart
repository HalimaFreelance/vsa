import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitorsa/utils/app_localizations.dart';

class OfferDetailsScreen extends StatefulWidget {
  @override
  _OfferDetailsScreenState createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(children: [
                  ClipRRect(
                    borderRadius:BorderRadius.all(Radius.circular(10)) ,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Image.asset(
                        "images/test.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                          child: Icon(Icons.monetization_on,color: Colors.green,)),
                      Expanded(
                        flex: 2,
                        child: Column(children: [
                          Text("Price",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),
                          Text("From EG 6005",style: TextStyle(color: Colors.grey,fontSize: 15),)
                        ],),
                      )

                    ],),
                  )
                ],),

            ),
          ),
        ),
      ],
    );
  }
}
