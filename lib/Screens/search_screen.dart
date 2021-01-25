import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:visitorsa/Screens/search_details_screen.dart';
import 'package:visitorsa/Screens/search_result_screen.dart';
import 'package:visitorsa/utils/app_localizations.dart';
import 'package:visitorsa/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

enum SingingCharacter { bestFare, business }

class _SearchScreenState extends State<SearchScreen> {
  SingingCharacter _character = SingingCharacter.bestFare;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 45.0, right: 20.0, top: 50),
                child: ButtonsTabBar(
                  backgroundColor: AppColors.lightGreen,
                  unselectedBorderColor: Colors.blueAccent,
                  unselectedBackgroundColor: Color(0xFF808080).withOpacity(0.7),
                  unselectedLabelStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      text: "Hotels",
                    ),
                    Tab(
                      text: "Cars",
                    ),
                    Tab(
                      text: "Airlines",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    //hotel body
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: size.height / 2.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                new SearchDetailsScreen()));
                                  },
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: null,
                                    autofocus: false,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: SvgPicture.asset(
                                          'images/icon_mail.svg',
                                          height: 5.0,
                                          width: 5.0,
                                          allowDrawingOutsideViewBox: true,
                                        ),
                                      ),
                                      hintText: AppLocalizations.of(context)
                                          .translate('location'),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showCupertinoModalBottomSheet(
                                      expand: true,
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => Container(
                                        height: 100,
                                        color: Colors.red,
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            new SearchDetailsScreen()));
                                              },
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                controller: null,
                                                autofocus: false,
                                                enabled: false,
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  prefixIcon: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: SvgPicture.asset(
                                                      'images/icon_mail.svg',
                                                      height: 5.0,
                                                      width: 5.0,
                                                      allowDrawingOutsideViewBox:
                                                          true,
                                                    ),
                                                  ),
                                                  hintText: AppLocalizations.of(
                                                          context)
                                                      .translate('location'),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(20.0,
                                                          10.0, 20.0, 10.0),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _modalBottomSheetMenu();
                                              },
//                                              child: TextFormField(
//                                                keyboardType:
//                                                    TextInputType.emailAddress,
//                                                controller: null,
//                                                autofocus: false,
//                                                enabled: false,
//                                                decoration: InputDecoration(
//                                                  fillColor: Colors.white,
//                                                  filled: true,
//                                                  prefixIcon: Padding(
//                                                    padding:
//                                                        const EdgeInsets.all(
//                                                            15.0),
//                                                    child: SvgPicture.asset(
//                                                      'images/icon_mail.svg',
//                                                      height: 5.0,
//                                                      width: 5.0,
//                                                      allowDrawingOutsideViewBox:
//                                                          true,
//                                                    ),
//                                                  ),
//                                                  hintText: AppLocalizations.of(
//                                                          context)
//                                                      .translate('when'),
//                                                  hintStyle: TextStyle(
//                                                      color: Colors.grey),
//                                                  contentPadding:
//                                                      EdgeInsets.fromLTRB(20.0,
//                                                          10.0, 20.0, 10.0),
//                                                  border: OutlineInputBorder(
//                                                      borderRadius:
//                                                          BorderRadius.circular(
//                                                              10.0)),
//                                                ),
//                                              ),
                                            ),
                                            TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              controller: null,
                                              autofocus: false,
                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: SvgPicture.asset(
                                                    'images/icon_mail.svg',
                                                    height: 5.0,
                                                    width: 5.0,
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                  ),
                                                ),
                                                hintText:
                                                    AppLocalizations.of(context)
                                                        .translate('people'),
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        20.0, 10.0, 20.0, 10.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: null,
                                    autofocus: false,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: SvgPicture.asset(
                                          'images/icon_mail.svg',
                                          height: 5.0,
                                          width: 5.0,
                                          allowDrawingOutsideViewBox: true,
                                        ),
                                      ),
                                      hintText: AppLocalizations.of(context)
                                          .translate('when'),
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: null,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'images/icon_mail.svg',
                                        height: 5.0,
                                        width: 5.0,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    hintText: AppLocalizations.of(context)
                                        .translate('people'),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                ButtonTheme(
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () async {
//                                  if (model.authValidation(
//                                      emailController.text.trim(),
//                                      passwordController.text)) {
//                                    LoginResponse loginResponse =
//                                    await model.login(
//                                        emailController.text
//                                            .trim(),
//                                        passwordController.text,
//                                        AppLocalizations.of(
//                                            context)
//                                            .locale
//                                            .languageCode);
//                                    if (loginResponse == null) {
//                                      final snackBar = SnackBar(
//                                        content: Text(
//                                            AppLocalizations.of(
//                                                context)
//                                                .translate(
//                                                'check_network')),
//                                        backgroundColor: Colors.red,
//                                      );
//                                      _scaffoldKey.currentState
//                                          .showSnackBar(snackBar);
//                                    } else if (loginResponse
//                                        .status &&
//                                        loginResponse.user !=
//                                            null) {
//                                      saveLoginData(json.encode(
//                                          loginResponse.user));
//                                      Globals.userData =
//                                          loginResponse;
//                                      showToast(
//                                          AppLocalizations.of(
//                                              context)
//                                              .translate(
//                                              'auth_response_success'),
//                                          Colors.green);
//                                      Navigator.pushAndRemoveUntil(
//                                          context,
//                                          MaterialPageRoute(
//                                              builder: (context) =>
//                                                  HomePage()),
//                                              (Route<dynamic> route) =>
//                                          false);
//                                    } else if (!loginResponse
//                                        .status) {
//                                      showToast(
//                                          AppLocalizations.of(
//                                              context)
//                                              .translate(
//                                              'auth_response_error'),
//                                          Colors.red);
//                                    } else {
//                                      final snackBar = SnackBar(
//                                        content: Text(
//                                            AppLocalizations.of(
//                                                context)
//                                                .translate(
//                                                'check_network')),
//                                        backgroundColor: Colors.red,
//                                      );
//                                      _scaffoldKey.currentState
//                                          .showSnackBar(snackBar);
//                                    }
//                                  }
//                                              Navigator.pushAndRemoveUntil(
//                                                  context,
//                                                  MaterialPageRoute(
//                                                      builder: (context) =>
//                                                          HomePage()),
//                                                  (Route<dynamic> route) =>
//                                                      false);
                                    },
                                    padding: EdgeInsets.all(20),
                                    color: AppColors.lightGreen,
                                    child: Text(
                                        AppLocalizations.of(context)
                                            .translate('search'),
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
//                        color: Colors.white,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // cars body
                    Center(
                      child: Icon(Icons.directions_transit),
                    ),

                    //airlines body
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: null,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'images/icon_mail.svg',
                                        height: 5.0,
                                        width: 5.0,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    hintText: AppLocalizations.of(context)
                                        .translate('from'),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: null,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'images/icon_mail.svg',
                                        height: 5.0,
                                        width: 5.0,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    hintText: AppLocalizations.of(context)
                                        .translate('to'),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: null,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'images/icon_mail.svg',
                                        height: 5.0,
                                        width: 5.0,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    hintText: AppLocalizations.of(context)
                                        .translate('departure'),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: null,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'images/icon_mail.svg',
                                        height: 5.0,
                                        width: 5.0,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    hintText: AppLocalizations.of(context)
                                        .translate('return'),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: null,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: SvgPicture.asset(
                                        'images/icon_mail.svg',
                                        height: 5.0,
                                        width: 5.0,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    hintText: AppLocalizations.of(context)
                                        .translate('people'),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                new Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => setState(() => _character =
                                            SingingCharacter.bestFare),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0) //         <--- border radius here
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                _character ==
                                                        SingingCharacter.bestFare
                                                    ? Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                      )
                                                    : Icon(
                                                        Icons.check_circle,
                                                        color: Colors.grey,
                                                      ),
                                                SizedBox(width: 4),
                                                Text(
                                                  AppLocalizations.of(context)
                                                      .translate('best_fare'),
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 4),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => setState(() => _character =
                                            SingingCharacter.business),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0) //         <--- border radius here
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                _character ==
                                                        SingingCharacter.bestFare
                                                    ? Icon(
                                                        Icons.check_circle,
                                                        color: Colors.grey,
                                                      )
                                                    : Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                      ),
                                                SizedBox(width: 4),
                                                Text(
                                                  AppLocalizations.of(context)
                                                      .translate('business'),
                                                  style:
                                                      TextStyle(color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
//                                Container(
//                                  color: Colors.red,
//                                  width: MediaQuery.of(context).size.width,
//                                  child: Row(
//                                    children: [
//                                      TextFormField(
//                                        keyboardType:
//                                            TextInputType.emailAddress,
//                                        controller: null,
//                                        autofocus: false,
//                                        decoration: InputDecoration(
//                                          fillColor: Colors.white,
//                                          filled: true,
//                                          prefixIcon: Padding(
//                                            padding: const EdgeInsets.all(15.0),
//                                            child: SvgPicture.asset(
//                                              'images/icon_mail.svg',
//                                              height: 5.0,
//                                              width: 5.0,
//                                              allowDrawingOutsideViewBox: true,
//                                            ),
//                                          ),
//                                          hintText: AppLocalizations.of(context)
//                                              .translate('people'),
//                                          hintStyle:
//                                              TextStyle(color: Colors.grey),
//                                          contentPadding: EdgeInsets.fromLTRB(
//                                              20.0, 10.0, 20.0, 10.0),
//                                          border: OutlineInputBorder(
//                                              borderRadius:
//                                                  BorderRadius.circular(10.0)),
//                                        ),
//                                      ),
//                                      TextFormField(
//                                        keyboardType:
//                                            TextInputType.emailAddress,
//                                        controller: null,
//                                        autofocus: false,
//                                        decoration: InputDecoration(
//                                          fillColor: Colors.white,
//                                          filled: true,
//                                          prefixIcon: Padding(
//                                            padding: const EdgeInsets.all(15.0),
//                                            child: SvgPicture.asset(
//                                              'images/icon_mail.svg',
//                                              height: 5.0,
//                                              width: 5.0,
//                                              allowDrawingOutsideViewBox: true,
//                                            ),
//                                          ),
//                                          hintText: AppLocalizations.of(context)
//                                              .translate('people'),
//                                          hintStyle:
//                                              TextStyle(color: Colors.grey),
//                                          contentPadding: EdgeInsets.fromLTRB(
//                                              20.0, 10.0, 20.0, 10.0),
//                                          border: OutlineInputBorder(
//                                              borderRadius:
//                                                  BorderRadius.circular(10.0)),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
                                ButtonTheme(
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new SearchResultScreen()));
//                                  if (model.authValidation(
//                                      emailController.text.trim(),
//                                      passwordController.text)) {
//                                    LoginResponse loginResponse =
//                                    await model.login(
//                                        emailController.text
//                                            .trim(),
//                                        passwordController.text,
//                                        AppLocalizations.of(
//                                            context)
//                                            .locale
//                                            .languageCode);
//                                    if (loginResponse == null) {
//                                      final snackBar = SnackBar(
//                                        content: Text(
//                                            AppLocalizations.of(
//                                                context)
//                                                .translate(
//                                                'check_network')),
//                                        backgroundColor: Colors.red,
//                                      );
//                                      _scaffoldKey.currentState
//                                          .showSnackBar(snackBar);
//                                    } else if (loginResponse
//                                        .status &&
//                                        loginResponse.user !=
//                                            null) {
//                                      saveLoginData(json.encode(
//                                          loginResponse.user));
//                                      Globals.userData =
//                                          loginResponse;
//                                      showToast(
//                                          AppLocalizations.of(
//                                              context)
//                                              .translate(
//                                              'auth_response_success'),
//                                          Colors.green);
//                                      Navigator.pushAndRemoveUntil(
//                                          context,
//                                          MaterialPageRoute(
//                                              builder: (context) =>
//                                                  HomePage()),
//                                              (Route<dynamic> route) =>
//                                          false);
//                                    } else if (!loginResponse
//                                        .status) {
//                                      showToast(
//                                          AppLocalizations.of(
//                                              context)
//                                              .translate(
//                                              'auth_response_error'),
//                                          Colors.red);
//                                    } else {
//                                      final snackBar = SnackBar(
//                                        content: Text(
//                                            AppLocalizations.of(
//                                                context)
//                                                .translate(
//                                                'check_network')),
//                                        backgroundColor: Colors.red,
//                                      );
//                                      _scaffoldKey.currentState
//                                          .showSnackBar(snackBar);
//                                    }
//                                  }
//                                              Navigator.pushAndRemoveUntil(
//                                                  context,
//                                                  MaterialPageRoute(
//                                                      builder: (context) =>
//                                                          SearchOffersScreen()),
//                                                  (Route<dynamic> route) =>
//                                                      false);
                                    },
                                    padding: EdgeInsets.all(20),
                                    color: AppColors.lightGreen,
                                    child: Text(
                                        AppLocalizations.of(context)
                                            .translate('search_flights'),
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
//                        color: Colors.white,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showMaterialModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 350.0,
            color: Colors.red,
            //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp
            // canvasColor
//              child: new Container(
//                  decoration: new BoxDecoration(
//                      color: Colors.white,
//                      borderRadius: new BorderRadius.only(
//                          topLeft: const Radius.circular(10.0),
//                          topRight: const Radius.circular(10.0))),
//                  child: new Center(
//                    child: new Text("This is a modal sheet"),
//                  )),
          );
        });
  }
}
