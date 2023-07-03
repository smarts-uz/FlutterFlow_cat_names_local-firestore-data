import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _catNames = prefs.getStringList('ff_catNames') ?? _catNames;
    });
    _safeInit(() {
      _favoriteCatNames =
          prefs.getStringList('ff_favoriteCatNames') ?? _favoriteCatNames;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _catNames = [
    'Milo',
    'Felix',
    'Simba',
    'Charlie',
    'Tiger',
    'Phoenix'
  ];
  List<String> get catNames => _catNames;
  set catNames(List<String> _value) {
    _catNames = _value;
    prefs.setStringList('ff_catNames', _value);
  }

  void addToCatNames(String _value) {
    _catNames.add(_value);
    prefs.setStringList('ff_catNames', _catNames);
  }

  void removeFromCatNames(String _value) {
    _catNames.remove(_value);
    prefs.setStringList('ff_catNames', _catNames);
  }

  void removeAtIndexFromCatNames(int _index) {
    _catNames.removeAt(_index);
    prefs.setStringList('ff_catNames', _catNames);
  }

  void updateCatNamesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _catNames[_index] = updateFn(_catNames[_index]);
    prefs.setStringList('ff_catNames', _catNames);
  }

  List<String> _favoriteCatNames = [];
  List<String> get favoriteCatNames => _favoriteCatNames;
  set favoriteCatNames(List<String> _value) {
    _favoriteCatNames = _value;
    prefs.setStringList('ff_favoriteCatNames', _value);
  }

  void addToFavoriteCatNames(String _value) {
    _favoriteCatNames.add(_value);
    prefs.setStringList('ff_favoriteCatNames', _favoriteCatNames);
  }

  void removeFromFavoriteCatNames(String _value) {
    _favoriteCatNames.remove(_value);
    prefs.setStringList('ff_favoriteCatNames', _favoriteCatNames);
  }

  void removeAtIndexFromFavoriteCatNames(int _index) {
    _favoriteCatNames.removeAt(_index);
    prefs.setStringList('ff_favoriteCatNames', _favoriteCatNames);
  }

  void updateFavoriteCatNamesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _favoriteCatNames[_index] = updateFn(_favoriteCatNames[_index]);
    prefs.setStringList('ff_favoriteCatNames', _favoriteCatNames);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
