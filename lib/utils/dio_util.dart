import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cjhms/api/api.dart';
import 'package:cjhms/common/constant.dart';
import 'package:cjhms/utils/cookies_util.dart';
import 'package:cjhms/utils/global.dart';
import 'package:dio/dio.dart';

/// <BaseResp<T> 返回 status code msg data.
class BaseResp<T> {
  int code;
  int total;
  String message;
  T data;

  BaseResp(this.code, this.message, this.data, this.total);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"msg\":\"$message\"");
    sb.write(",\"data\":\"$data\"");
    sb.write(",\"total\":\"$total\"");
    sb.write('}');
    return sb.toString();
  }
}

/// 请求方法.
class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

///Http配置.
class HttpConfig {
  /// constructor.
  HttpConfig({
    this.code,
    this.message,
    this.data,
    this.options,
  });

  /// BaseResp [int code]字段 key, 默认：code.
  String code;

  /// BaseResp [String msg]字段 key, 默认：message.
  String message;

  /// BaseResp [T data]字段 key, 默认：data.
  String data;

  /// Options.
  Options options;
}

/// 单例 DioUtil.
/// debug模式下可以打印请求日志. DioUtil.openDebug().
/// dio详细使用请查看dio官网(https://github.com/flutterchina/dio).
class DioUtil {

  static final DioUtil _singleton = DioUtil._init();
  static Dio _dio;

  /// BaseResp [int code]字段 key, 默认：code.
  String _codeKey = "code";

  /// BaseResp [String msg]字段 key, 默认：message.
  String _msgKey = "message";

  /// BaseResp [T data]字段 key, 默认：data.
  String _dataKey = "data";

  /// BaseResp [int total]字段 key, 默认：total.
  String _totalKey = "total";

  /// Options.
  Options _options = getDefOptions();

  /// 是否是debug模式.
  static bool _isDebug = false;

  static DioUtil getInstance() {
    return _singleton;
  }

  DioUtil._init() {
    _dio = new Dio(_options);
  }

  /// 打开debug模式.
  static void openDebug() {
    _isDebug = true;
  }

  /// set Config.
  void setConfig(HttpConfig config) {
    _codeKey = config.code ?? _codeKey;
    _msgKey = config.message ?? _msgKey;
    _dataKey = config.data ?? _dataKey;
    _mergeOption(config.options);
    if (_dio != null) {
      _dio.options = _options;
    }

    //  配置拦截器
    _dio.interceptor.request.onSend = (Options options) {
      bool needAuth = options.extra[Constant.NEED_TOKEN_FIELD];
      //  需要auth认证
      if (needAuth) {
        return CookiesUtil.getCookiesForRequest(options);
      }else{
        return options;
      }
    };
  }



  /// 网络请求
  /// [method]  请求方法
  /// [path]  请求url
  /// [data]  携带数据
  /// [options]  请求options配置
  /// <BaseResp<T> 返回值 .
  Future<BaseResp<T>> request<T>(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Response response = await _dio.request(path,
        data: data,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    _printHttpLog(response);
    int _code;
    int _total;
    String _msg;
    T _data;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      if(path.compareTo(Api.USER_LOGIN) == 0 || path.compareTo(Api.REFRESH_TOKEN) == 0){
        //  如果是登录，直接设置cookies
        //  如果是刷新token，直接设置cookies
        CookiesUtil.setCookies(response);
      }
      try {
        if (response.data is Map) {
          _code = (response.data[_codeKey] is String)
              ? int.tryParse(response.data[_codeKey])
              : response.data[_codeKey];
          _total = response.data[_totalKey];
          _msg = response.data[_msgKey];
          _data = response.data[_dataKey];
        } else {
          Map<String, dynamic> _dataMap = _decodeData(response);
          _code = (_dataMap[_codeKey] is String)
              ? int.tryParse(_dataMap[_codeKey])
              : _dataMap[_codeKey];
          _total = (_dataMap[_totalKey] is String)
              ? int.tryParse(_dataMap[_totalKey])
              : _dataMap[_totalKey];
          _msg = _dataMap[_msgKey];
          _data = _dataMap[_dataKey];
        }
        return new BaseResp(_code, _msg, _data, _total);
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: response,
      message: "service error",
      type: DioErrorType.RESPONSE,
    ));
  }


  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response == null || response.data == null ||
        response.data.toString().isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }

  /// check Options.
  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }

  /// merge Option.
  void _mergeOption(Options opt) {
    _options.method = opt.method ?? _options.method;
    _options.headers = (new Map.from(_options.headers))
      ..addAll(opt.headers);
    _options.baseUrl = opt.baseUrl ?? _options.baseUrl;
    _options.connectTimeout = opt.connectTimeout ?? _options.connectTimeout;
    _options.receiveTimeout = opt.receiveTimeout ?? _options.receiveTimeout;
    _options.responseType = opt.responseType ?? _options.responseType;
    _options.data = opt.data ?? _options.data;
    _options.extra = (new Map.from(_options.extra))
      ..addAll(opt.extra);
    _options.contentType = opt.contentType ?? _options.contentType;
    _options.validateStatus = opt.validateStatus ?? _options.validateStatus;
    _options.followRedirects = opt.followRedirects ?? _options.followRedirects;
  }

  /// print Http Log.
  void _printHttpLog(Response response) {
    if (!_isDebug) {
      return;
    }
    try {
      print("----------------Http Log----------------" +
          "\n[statusCode]:   " +
          response.statusCode.toString() +
          "\n[request   ]:   " +
          _getOptionsStr(response.request));
      _printDataStr("reqdata ", response.request.data);
      _printDataStr("response", response.data);
    } catch (ex) {
      print("Http Log" + " error......");
    }
  }

  /// get Options Str.
  String _getOptionsStr(Options request) {
    return "method: " +
        request.method +
        "  baseUrl: " +
        request.baseUrl +
        "  path: " +
        request.path;
  }

  /// print Data Str.
  void _printDataStr(String tag, Object value) {
    String da = value.toString();
    while (da.isNotEmpty) {
      if (da.length > 512) {
        print("[$tag  ]:   " + da.substring(0, 512));
        da = da.substring(512, da.length);
      } else {
        print("[$tag  ]:   " + da);
        da = "";
      }
    }
  }

  /// get Def Options.
  static Options getDefOptions() {
    Options options = new Options();
    options.contentType =
        ContentType.parse("application/json");
    options.connectTimeout = 1000 * 10;
    options.receiveTimeout = 1000 * 20;
    return options;
  }

  ///  用于baseurl切换， 以及判断是否需要携带token
  static Options changeBaseUrlOptions(bool isYun) {
    Options options = new Options();
    options.baseUrl = isYun ? Constant.BASE_USER_URL : Constant.BASE_DATA_URL;
    options.extra.addAll({Constant.NEED_TOKEN_FIELD: Global.needAuth});
    return options;
  }
}
