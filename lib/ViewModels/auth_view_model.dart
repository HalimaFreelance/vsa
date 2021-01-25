import 'package:visitorsa/Models/login_response.dart';
import 'package:visitorsa/services/api.dart';
import 'package:visitorsa/services/locator.dart';

import 'base_model.dart';

class AuthViewModel extends BaseModel {
  bool _emailValidate = true;
  bool _fNameValidate = true;
  bool _lNameValidate = true;
  bool _phoneValidate = true;
  bool _codeValidate = true;
  bool _passwordValidate = true;
  bool _cPassValidate = true;
  bool _nationalValidate = true;

  ////////////
  bool _pinValidate = true;
  bool _answerValidate = true;
  bool _quesValidate = true;

  bool _currencyValidate = true;
  bool _currencySubscriptionValidate = true;

  //////////////
  bool _methodIdValidate = true;
  bool _methodFieldValidate = true;
  bool _descValidate = true;

  Api _api = locator<Api>();

  Future<LoginResponse> login(
      String email, String password, String lang) async {
    setState(ViewState.Busy);
//    LoginUserResponse user =
//        new LoginUserResponse(email: email, password: password);

    Map<String, dynamic> user = {
      "email": email,
      "password": password,
      "lang": lang
    };
    var success = await _api.login(user);
    setState(ViewState.Idle);
    return success;
  }

  Future<LoginResponse> register(
      String lang,
      String confirmPass,
      String mobile_code,
      String firstName,
      String lastName,
      String email,
      String password,
      String mobile) async {
    setState(ViewState.Busy);

    Map<String, dynamic> user = {
      'name': firstName,
      'email': email,
      'password': password,
      'mobile': mobile,
      'address': lastName,
    };

    var success = await _api.register(user);
    setState(ViewState.Idle);
    return success;
  }

  bool authValidation(String email, String password) {
    bool validate = true;
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      _emailValidate = false;
      validate = false;
    } else {
      _emailValidate = true;
    }

    if (password.isEmpty) {
      _passwordValidate = false;
      validate = false;
    } else {
      _passwordValidate = true;
    }
    notifyListeners();
    return validate;
  }

  bool signUpValidation(String fName, String lName, String email, String phone,
      String password, String cPass) {
    bool validate = true;
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      _emailValidate = false;
      validate = false;
    } else {
      _emailValidate = true;
    }
    if (fName.length < 3) {
      _fNameValidate = false;
      validate = false;
    } else {
      _fNameValidate = true;
    }
    if (lName.length < 3) {
      _lNameValidate = false;
      validate = false;
    } else {
      _lNameValidate = true;
    }
    if (phone.length < 8) {
      _phoneValidate = false;
      validate = false;
    } else {
      _phoneValidate = true;
    }

    if (password.length < 8) {
      _passwordValidate = false;
      validate = false;
    } else {
      _passwordValidate = true;
      if (cPass != password) {
        _cPassValidate = false;
        validate = false;
      } else {
        _cPassValidate = true;
      }
    }
    notifyListeners();
    return validate;
  }

  String getRegisterErrors(List<String> errors) {
    String errorsResult = "";
    errors.forEach((error) {
      errorsResult += error + '\n';
    });
    return errorsResult;
  }

  bool get fNameValidate => _fNameValidate;

  bool get passwordValidate => _passwordValidate;

  bool get emailValidate => _emailValidate;

  bool get lNameValidate => _lNameValidate;

  bool get phoneValidate => _phoneValidate;

  bool get cPassValidate => _cPassValidate;

  bool get pinValidate => _pinValidate;

  bool get quesValidate => _quesValidate;

  bool get answerValidate => _answerValidate;

  bool get descValidate => _descValidate;

  bool get methodFieldValidate => _methodFieldValidate;

  bool get methodIdValidate => _methodIdValidate;

  bool get currencyValidate => _currencyValidate;

  set methodIdValidate(bool value) {
    _methodIdValidate = value;
    notifyListeners();
  }

  bool get currencySubscriptionValidate => _currencySubscriptionValidate;
}
