import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:visitorsa/utils/AppLanguage.dart';
import 'package:visitorsa/utils/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController searchKeyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          // ListTile(
          //   leading: Icon(Icons.search, color: Colors.grey[800]),
          //   title: Text(
          //     "Search",
          //     style: TextStyle(color: Colors.grey[800]),
          //   ),
          //   trailing: Icon(
          //     Icons.arrow_forward_ios,
          //     color: Colors.lightBlue,
          //   ),
          // ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.search, color: Colors.white),
              title: Text(
                AppLocalizations.of(context).translate('search'),
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            onTap: () {
//              showSearchDialog(widget.callback, context, 3,
//                  searchKeyController: searchKeyController);
            },
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.star, color: Colors.white),
              title: Text(
                AppLocalizations.of(context).translate('golden_night'),
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            onTap: () {
//              Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => new ProfileScreen()));
            },
          ),
          InkWell(
            onTap: () {
//              Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => new BookingsScreen(1)));
            },
            child: ListTile(
              leading: Icon(Icons.favorite, color: Colors.white),
              title: Text(
                AppLocalizations.of(context).translate('my_favourites'),
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {
//              Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => new BookingsScreen(2)));
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'images/icon_booking.svg',
                height: 24.0,
                width: 24.0,
                color: Colors.white,
                allowDrawingOutsideViewBox: true,
              ),
//              Icon(Icons.call, color: Colors.grey[800]),
              title: Text(
                AppLocalizations.of(context).translate('my_bookings'),
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),

          InkWell(
            onTap: () {
//              Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => new BookingsScreen(4)));
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'images/icon_terms.svg',
                height: 24.0,
                width: 24.0,
                color: Colors.white,
                allowDrawingOutsideViewBox: true,
              ),
//              Icon(Icons.call, color: Colors.grey[800]),
              title: Text(
                AppLocalizations.of(context).translate('terms_of_use'),
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),

          InkWell(
            onTap: () {
//              Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => new ComplainRequestScreen()));
            },
            child: ListTile(
              leading: SvgPicture.asset(
                'images/icon_data.svg',
                height: 24.0,
                width: 24.0,
                color: Colors.white,
                allowDrawingOutsideViewBox: true,
              ),
//              Icon(Icons.call, color: Colors.grey[800]),
              title: Text(
                AppLocalizations.of(context).translate('data_protect'),
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),

          InkWell(
            onTap: () {
//              Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => new CustomerSupportScreen()));
            },
            child: ListTile(
              leading: Icon(Icons.call, color: Colors.white),
              title: Text(
                AppLocalizations.of(context).translate('customer_support'),
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),

          // InkWell(
          //   onTap: () {
          //   },
          //   child: ListTile(
          //     leading: Icon(Icons.language, color: Colors.grey[800]),
          //     title: Text(
          //       "Language",
          //       style: TextStyle(color: Colors.grey[800]),
          //     ),
          //     trailing: Icon(
          //       Icons.arrow_forward_ios,
          //       color: Colors.lightBlue,
          //     ),
          //   ),
          // ),
          InkWell(
            child:
                // Container(
                //     child: SimpleAccountMenu(
                //       stringList: [
                //         Text('english' , style: TextStyle(color: Colors.white ,)),
                //         Text('arabic'),
                //       ],
                //       iconColor: Colors.white,
                //       onChange: (index) {
                //         print(index);
                //       },
                //     )),
                ExpansionTile(
                    leading: Icon(Icons.language, color: Colors.white),
                    title: Text(
                      AppLocalizations.of(context).translate('lang'),
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                        onTap: () {
                          setState(() {
                            appLanguage.changeLanguage(Locale("ar"));
                          });
                        },
                        title: Text(
                            AppLocalizations.of(context).translate('arabic'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Text('English'),
                      onTap: () {
                        setState(() {
                          appLanguage.changeLanguage(Locale("en"));
                        });
                      },
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

class WalletData {
  String title;
  Icon walletIcon;

  WalletData({this.title, this.walletIcon});
}
