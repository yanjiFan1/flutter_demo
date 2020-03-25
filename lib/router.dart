import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myappflutter/pages/main/main_page.dart';
import 'package:myappflutter/pages/home/home_page.dart';
import 'package:myappflutter/pages/school/school_page.dart';
import 'package:myappflutter/pages/business/business_page.dart';
import 'package:myappflutter/pages/web_view_page.dart';

///https://www.jianshu.com/p/b9d6ec92926f

class Router {
  static const mainPage = 'app://';
  static const homePage = 'app://homepage';
  static const schoolPage = 'app://schoolpage';
  static const businessPage = 'app://businesspage';
  // static const detailPage = 'app://DetailPage';
  // static const playListPage = 'app://VideosPlayPage';
  // static const searchPage = 'app://SearchPage';
  // static const photoHero = 'app://PhotoHero';
  // static const personDetailPage = 'app://PersonDetailPage';

//  Widget _router(String url, dynamic params) {
//    String pageId = _pageIdMap[url];
//    return _getPage(pageId, params);
//  }
//
//  Map<String, dynamic> _pageIdMap = <String, dynamic>{
//    'app/': 'ContainerPageWidget',
//    detailPage: 'DetailPage',
//  };

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return WebViewPage(url, params: params);
    } else {
      switch (url) {
        // case detailPage:
        //   return DetailPage(params);
        case mainPage:
          return MainPage();
        case homePage:
          return HomePage();
        case schoolPage:
          return SchoolPage();
        case businessPage:
          return BusinessPage();
        // case photoHero:
        //   return PhotoHeroPage(
        //       photoUrl: params['photoUrl'], width: params['width']);
        // case personDetailPage:
        //   return PersonDetailPage(params['personImgUrl'], params['id']);
      }
    }
    return null;
  }

//
//  void push(BuildContext context, String url, dynamic params) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, params);
//    }));
//  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
