import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/ride_pref.dart';
import 'package:week_3_blabla_project/repository/ride_preferences_repository.dart';

class RidesPrefsProvider extends ChangeNotifier {  
  final RidePreferencesRepository repository;
  RidesPrefsProvider(this.repository);

  RidePreference? _currentPreference;
  ///cache
  List<RidePreference> pastRidePref = [] ;

  // Current preference
  RidePreference? get currentPreference {
    print('Get  current  pref : $_currentPreference');
    return _currentPreference;
  }

  void setCurrentPreference(RidePreference preference) {
    if(_currentPreference != preference){
      _currentPreference = preference;
        print('Set current pref to $_currentPreference');
        addPreference(preference);
        notifyListeners();
    }
  }

  // Past preferences
  List<RidePreference> getPastPreferences() {
    return repository.getPastPreferences().reversed.toList();
  }

  void addPreference(RidePreference preference) {
    repository.addPreference(preference);
    notifyListeners();
    return ;
  }
}