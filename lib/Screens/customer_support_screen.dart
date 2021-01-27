import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitorsa/utils/app_localizations.dart';

class CustomerSupportScreen extends StatefulWidget {
  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
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
              AppLocalizations.of(context).translate('customer_support'),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            elevation: 0.0,
          ),
          body: Card(
            color: Colors.transparent,
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('call_us'),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.headset_mic,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                      alignment:AppLocalizations.of(context).locale.languageCode ==
                          "en"
                          ? Alignment.centerLeft: Alignment.centerRight,
                      child: Text(
                    "monday to thursday from 8:00 AM to 6:00 PM ",
                    style: TextStyle(color: Colors.white,fontSize: 15),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Text("+778377737777",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('contact_us'),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: AppLocalizations.of(context).locale.languageCode ==
                        "en"
                        ? Alignment.centerLeft: Alignment.centerRight,
                    child: Text("Our cutomer support will get back to you shortly",
                        style: TextStyle(color: Colors.white,fontSize: 15)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Text("mail@mailAgent.com",
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
