
import 'dart:io';

import 'package:cjhms/common/constant.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';


class CookiesUtil{

  ///  获取cookies
  static Future<Options> getCookiesForRequest(Options options) async{
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cookieJar = new PersistCookieJar(dir:tempPath);
    var cookies = cookieJar.loadForRequest(Uri.parse(Constant.BASE_USER_URL));
    cookies.removeWhere((cookie) => cookie.value == invalidCookieValue && cookie.expires.isBefore(DateTime.now()));
    String cookie = getCookies(cookies);
    if (cookie.isNotEmpty) {
      options.headers[HttpHeaders.cookieHeader] = cookie;
    }
    return options;
  }

  static String getCookies(List<Cookie> cookies) {
    return cookies.map((cookie) => cookie.toString()).join('; ');
  }

  ///  设置cookie
  static const invalidCookieValue = "_invalid_";
  static void setCookies(Response response) async {
    bool needNormalize = true;
    try {
      Cookie.fromSetCookieValue("k=;");
    } catch (e) {
      needNormalize = true;
    }
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cookieJar=new PersistCookieJar(dir:tempPath);
    if (response != null && response.headers != null) {
      List<String> cookies = response.headers[HttpHeaders.setCookieHeader];
      if (cookies != null) {
        if (needNormalize) {
          var _cookies = normalizeCookies(cookies);
          cookies..clear()..addAll(_cookies);
        }
        cookieJar.saveFromResponse(Uri.parse(Constant.BASE_USER_URL),
          cookies.map((str) => Cookie.fromSetCookieValue(str)).toList(),
        );
      }
    }
  }

  static List<String> normalizeCookies(List<String> cookies) {
    if (cookies != null) {
      const String expires = " Expires=Thu, 01 Jan 1970 00:00:00 GMT";
      return cookies.map((cookie) {
        var _cookie = cookie.split(";");
        var kv = _cookie.first?.split("=");
        if (kv != null && kv[1].isEmpty) {
          kv[1] = invalidCookieValue;
          _cookie[0] = kv.join('=');
          if (_cookie.length > 1) {
            int i = 1;
            while (i < _cookie.length) {
              if (_cookie[i].trim().toLowerCase().startsWith("expires")) {
                _cookie[i] = expires;
                break;
              }
              ++i;
            }
            if (i == _cookie.length) {
              _cookie.add(expires);
            }
          }
        }
        return _cookie.join(";");
      }).toList();
    }
    return [];
  }

}