import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:visitorsa/Models/login_response.dart';
import 'package:visitorsa/ViewModels/auth_view_model.dart';
import 'package:visitorsa/ViewModels/base_model.dart';
import 'package:visitorsa/services/base_view.dart';
import 'package:visitorsa/utils/app_localizations.dart';
import 'package:visitorsa/utils/show_toast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstController = new TextEditingController();
  final TextEditingController _secondController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmController = new TextEditingController();

  // TextEditingController _codeController;
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool textSetInitialVal = false;
  bool visible = false;
  String confirmedNumber = '';

  void getPhoneNumber(PhoneNumber phoneNumber) async {
    String parsableNumber;
    try {
      parsableNumber = phoneNumber.parseNumber();
      if (parsableNumber != null) _phoneController.text = parsableNumber;
    } on Exception catch (_) {
      print('ffff');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        builder: (context, model, child) => LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Stack(
                children: [
                  Image.asset(
                    "images/blur_bg.jpg",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  new Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: _buildBar(context),
                    key: _scaffoldKey,
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: new Container(
                              height: viewportConstraints.maxHeight + 150,
                              padding: EdgeInsets.all(16.0),
                              child: new Column(
                                children: <Widget>[
                                  new Container(
                                    child: new TextField(
                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                      controller: _firstController,
                                      decoration: new InputDecoration(
                                        labelText: 'First Name',
                                        hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            'images/icon_person.svg',
                                            height: 5.0,
                                            width: 5.0,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                        errorText: model.fNameValidate
                                            ? null
                                            : AppLocalizations.of(context)
                                                .translate(
                                                    'name_validate_error'),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    child: new TextField(
                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                      controller: _secondController,
                                      decoration: new InputDecoration(
                                        labelText: 'Last Name',
                                        hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            'images/icon_person.svg',
                                            height: 5.0,
                                            width: 5.0,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        errorText: model.lNameValidate
                                            ? null
                                            : AppLocalizations.of(context)
                                                .translate(
                                                    'name_validate_error'),
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    child: new TextField(
                                      controller: _emailController,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                      decoration: new InputDecoration(
                                        labelText: 'Email',
                                        errorText: model.emailValidate
                                            ? null
                                            : AppLocalizations.of(context)
                                                .translate('email_error'),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            'images/icon_mail.svg',
                                            height: 5.0,
                                            width: 5.0,
                                            color: Colors.white,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      this.number = number;
                                      print('code--' + number.dialCode);
                                      // getPhoneNumber(number);
                                    },
                                    onInputValidated: (bool value) {
                                      // print(value);
                                    },
                                    inputDecoration: new InputDecoration(
                                        errorText: model.phoneValidate
                                            ? null
                                            : AppLocalizations.of(context)
                                                .translate(
                                                    'eight_validate_error'),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelText: 'Phone'),
                                    ignoreBlank: false,
//                                          autoValidate: false,
                                    initialValue: number,
                                    textStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                    selectorTextStyle:
                                        TextStyle(color: Colors.white),
                                    textFieldController: _phoneController,
                                    inputBorder: OutlineInputBorder(),
                                  ),
                                  new Container(
                                    child: new TextField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white),
                                      decoration: new InputDecoration(
                                        labelText: 'Password',
                                        errorText: model.passwordValidate
                                            ? null
                                            : AppLocalizations.of(context)
                                                .translate(
                                                    'eight_validate_error'),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            'images/icon_padlock.svg',
                                            height: 5.0,
                                            width: 5.0,
                                            color: Colors.white,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    child: new TextField(
                                      controller: _confirmController,
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white),
                                      decoration: new InputDecoration(
                                        labelText: 'Re-enter Password',
                                        errorText: model.cPassValidate
                                            ? null
                                            : AppLocalizations.of(context)
                                                .translate(
                                                    'cpass_validation_error'),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            'images/icon_padlock.svg',
                                            height: 5.0,
                                            width: 5.0,
                                            color: Colors.white,
                                            allowDrawingOutsideViewBox: true,
                                          ),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                      obscureText: true,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ButtonTheme(
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: RaisedButton(
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      onPressed: () async {
                                        if (model.signUpValidation(
                                            _firstController.text.trim(),
                                            _secondController.text.trim(),
                                            _emailController.text.trim(),
                                            _phoneController.text.trim(),
                                            _passwordController.text,
                                            _confirmController.text)) {
//
                                          LoginResponse loginResponse =
                                              await model.register(
                                                  AppLocalizations.of(context)
                                                      .locale
                                                      .languageCode,
                                                  _confirmController.text,
                                                  number.dialCode,
                                                  _firstController.text.trim(),
                                                  _secondController.text.trim(),
                                                  _emailController.text.trim(),
                                                  _passwordController.text,
                                                  _phoneController.text.trim());

                                          if (loginResponse == null) {
                                            final snackBar = SnackBar(
                                              content: Text(AppLocalizations.of(
                                                      context)
                                                  .translate('check_network')),
                                              backgroundColor: Colors.red,
                                            );
                                            _scaffoldKey.currentState
                                                .showSnackBar(snackBar);
                                          } else if (loginResponse.status) {
                                            showToast(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        loginResponse.msg),
                                                Colors.green);
                                            // Navigator.pushAndRemoveUntil(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             HomePage()),
                                            //         (Route<dynamic> route) =>
                                            //     false);
                                          } else if (!loginResponse.status) {
                                            showToast(
                                                AppLocalizations.of(context)
                                                    .translate(
                                                        'something_went_error'),
                                                Colors.red);
                                          } else {
                                            final snackBar = SnackBar(
                                              content: Text(AppLocalizations.of(
                                                      context)
                                                  .translate('check_network')),
                                              backgroundColor: Colors.red,
                                            );
                                            _scaffoldKey.currentState
                                                .showSnackBar(snackBar);
                                          }
                                        }
                                      },
                                      padding: EdgeInsets.all(20),
                                      color: Colors.lightBlueAccent,
                                      child: Text('Next',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                      child: Align(
                                          // alignment:
                                          //     FractionalOffset.bottomCenter,
                                          child: RichText(
                                    textAlign: TextAlign.center,
                                    text: new TextSpan(
                                      text:
                                          'by creating or logging to an account you agree to out ',
                                      children: <TextSpan>[
                                        new TextSpan(
                                            text: 'terms and conditions',
                                            style: new TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                            )),
                                        new TextSpan(text: ' and '),
                                        new TextSpan(
                                          text: 'privacy policy',
                                          style: new TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap =
                                                () => print('Tap Here onTap'),
                                        ),
                                      ],
                                    ),
                                  ))),
                                ],
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstController.dispose();
    _secondController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    // _codeController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Sign up"),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
