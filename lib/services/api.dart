import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:visitorsa/Models/login_response.dart';

import 'api_headers.dart';

class Api {
  //these apis arent implemented yet
  // preOrder , StoreOrder , favProductOrService , list of recent transactions
  static const loginURL = '/login';
  static const registerURL = '/signup';

  static const logOutURL = '/logout';
  static const preRegisterURL = '/pre_register';
  static const homeUrl = "/home";
  static const wishListUrl = "/wishlist";
  static const searchURL = '/serach/ProductsOrService';
  static const ordersUrl = "/orders";
  static const orderDetailsUrl = "/order/details";
  static const customerSupportUrl = "/customer_support";
  static const getProfileUrl = "/getUserProfileDetails";
  static const setProfileUrl = "/editUserProfileDetails";
  static const getProductOrserviceDetailsUrl = '/ProductOrServiceDetails';
  static const addReviewUrl = '/addReview';
  static const prepAddProductOrServiceURL = '/PrepAddProdouctOrService';
  static const editAddressUrl = "/editUserAddress";
  static const prepFilterURL = '/prepFilter';
  static const filterURL = '/filter';
  static const addProductOrServiceURL = '/add_product_service';
  static const getCategoriesURL = '/getCategories';
  static const prePersonalWalletCashOutURL = '/pre_person/wallet/cashout';
  static const personalWalletCashOutURL = '/person/wallet/cashout';
  static const personalWalletGetMethodsURL = '/getMethodsOfCashOut';
  static const personalWalletChangeMethodsURL = '/changeMethodOfCashOut';
  static const cashBackWalletURL = '/cashback';
  static const commissionWalletURL = '/commission/wallet';
  static const rewardWalletURL = '/reward';
  static const earningWalletURL = '/earning';
  static const transitionToPersonalURL = '/transition';
  static const convertCommissionPointsURL = '/convert/points';
  static const preUpgradeURL = '/plan/pre_upgrade';
  static const upgradeURL = '/plan/upgrade';
  static const addToFavURL = '/favProductOrService';
  static const bannerProductURL = '/getBannerProduct';
  static const getProductsURL = '/getProducts';
  static const getProductsPurchasedURL = '/products-purchased'; // pending
  static const getProductsSoldURL = '/products-saled'; // pending
  static const getComplaintsURL = '/get/user-complaints';
  static const addComplaintPreURL = '/get/orders';
  static const addComplaintURL = "/complaint/store";

  var client = new http.Client();

  Future<LoginResponse> login(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: loginURL, map: body);
    if (response != null) {
      return LoginResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

//
//  Future<LoginResponse> logOut(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: logOutURL, map: body);
//    if (response != null) {
//      return LoginResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
  Future<LoginResponse> register(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: registerURL, map: body);
    if (response != null) {
      return LoginResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

//  Future<PreRegisterResponse> preRegister(Map body) async {
//    var response =
//        await ApiHeaders().getFormDataRequest(path: preRegisterURL, map: body);
//    if (response != null) {
//      return PreRegisterResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<CustomerSupportResponse> getCustomerSupportApi() async {
//    var response =
//        await ApiHeaders().getFormDataRequest(path: customerSupportUrl);
//    if (response != null) {
//      return CustomerSupportResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<HomeResponse> getHomeApi(Map body) async {
//    var response =
//        await ApiHeaders().genericPostFormDataRequest(path: homeUrl, map: body);
//
//    if (response != null) {
//      return HomeResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<GetCategoriesResponse> getCategories(Map body) async {
//    var response = await ApiHeaders()
//        .genericPostFormDataRequest(path: getCategoriesURL, map: body);
//    if (response != null) {
//      return GetCategoriesResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<PrePersonalWalletCashOutResponse> prePersonalWalletCashOut(
//      Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: prePersonalWalletCashOutURL, map: body);
//    if (response != null) {
//      return PrePersonalWalletCashOutResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<PrePersonalWalletCashOutResponse> getUserCashOutMethods(
//      Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: personalWalletGetMethodsURL, map: body);
//    if (response != null) {
//      return PrePersonalWalletCashOutResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<LoginResponse> changeUserCashOutMethods(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: personalWalletChangeMethodsURL, map: body);
//    if (response != null) {
//      return LoginResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<PersonalWalletCashOutResponse> personalWalletCashOut(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: personalWalletCashOutURL, map: body);
//    if (response != null) {
//      return PersonalWalletCashOutResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<WalletResponse> cashBackWallet(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: cashBackWalletURL, map: body);
//    if (response != null) {
//      return WalletResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<WalletResponse> commissionWallet(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: commissionWalletURL, map: body);
//    if (response != null) {
//      return WalletResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<HomeResponse> getBannerProducts(Map body) async {
//    var response = await ApiHeaders()
//        .genericPostFormDataRequest(path: bannerProductURL, map: body);
//    if (response != null) {
//      return HomeResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<WalletResponse> rewardWallet(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: rewardWalletURL, map: body);
//    if (response != null) {
//      return WalletResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<WalletResponse> earningWallet(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: earningWalletURL, map: body);
//    if (response != null) {
//      return WalletResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<TransitionResponse> transitionToPersonalWallet(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: transitionToPersonalURL, map: body);
//    if (response != null) {
//      return TransitionResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<TransitionResponse> convertCommissionWalletPoints(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: convertCommissionPointsURL, map: body);
//    if (response != null) {
//      return TransitionResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<OrdersResponse> getOrdersApi(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: ordersUrl, map: body);
//    if (response != null) {
//      return OrdersResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<OrderDetailsResponse> getOrderDetailsApi(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: orderDetailsUrl, map: body);
//    if (response != null) {
//      return OrderDetailsResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<ProfileResponse> getProfileApi(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: getProfileUrl, map: body);
//    if (response != null) {
//      return ProfileResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<PreUpgradeResponse> preUpgrade(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: preUpgradeURL, map: body);
//    if (response != null) {
//      return PreUpgradeResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<PreUpgradeResponse> upgrade(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: upgradeURL, map: body);
//    if (response != null) {
//      return PreUpgradeResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<ProfileResponse> setProfileApi(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: setProfileUrl, map: body);
//    if (response != null) {
//      showToast(response.data['msg'], Colors.green);
//      return ProfileResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<FavResponse> addProductServiceFav(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: addToFavURL, map: body);
//    if (response != null) {
////      showToast(response.data['msg'], Colors.green);
//      return FavResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<LoginResponse> setAddressApi(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: editAddressUrl, map: body);
//    if (response != null) {
//      showToast(response.data['msg'], Colors.green);
//      return LoginResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<ProductOrServiceDetailsResponse> getProductOrServiceDetailsApi(
//      Map body) async {
//    var response = await ApiHeaders().genericPostFormDataRequest(
//        path: getProductOrserviceDetailsUrl, map: body);
//    if (response != null) {
//      return ProductOrServiceDetailsResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<WishListResponse> getWishListApi(Map body) async {
//    var response =
//        await ApiHeaders().postFormDataRequest(path: wishListUrl, map: body);
//    if (response != null) {
//      return WishListResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<AddReviewResponse> addReviewApi(Map body) async {
//    var response = await ApiHeaders()
//        .genericPostFormDataRequest(path: addReviewUrl, map: body);
//    if (response != null) {
//      return AddReviewResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<SearchResponse> search(Map body) async {
//    var response = await ApiHeaders()
//        .genericPostFormDataRequest(path: searchURL, map: body);
//    print("responssse::" + response.toString());
//    if (response != null) {
//      return SearchResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<SearchResponse> getProducts(Map body) async {
//    var response = await ApiHeaders()
//        .genericPostFormDataRequest(path: getProductsURL, map: body);
//    if (response != null) {
//      return SearchResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<AddProductResponse> addProductOrService(Map body) async {
//    var response = await ApiHeaders()
//        .genericPostFormDataRequest(path: addProductOrServiceURL, map: body);
//    if (response != null) {
//      return AddProductResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<PrepFilterResponse> prepFilter(Map body) async {
//    var response = await ApiHeaders()
//        .genericPostFormDataRequest(path: prepFilterURL, map: body);
//    if (response != null) {
//      return PrepFilterResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<PrepAddProductOrService> prepAddProductOrService(Map body) async {
//    var response = await ApiHeaders().genericPostFormDataRequest(
//        path: prepAddProductOrServiceURL, map: body);
//    if (response != null) {
//      return PrepAddProductOrService.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<SearchResponse> filter(Map body) async {
//    var response = await ApiHeaders()
//        .genericPostFormDataRequest(path: filterURL, map: body);
//    if (response != null) {
//      return SearchResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//  Future<GetComplaintsResponse> getComplaints(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: getComplaintsURL, map: body);
//    if (response != null) {
//      return GetComplaintsResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//  Future<AddComplaintPreResponse> addComplaintPre(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: addComplaintPreURL, map: body);
//    if (response != null) {
//      return AddComplaintPreResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//  Future<AddComplaintPreResponse> addComplaint(Map body) async {
//    var response = await ApiHeaders()
//        .postFormDataRequest(path: addComplaintURL, map: body);
//    if (response != null) {
//      return AddComplaintPreResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
}
