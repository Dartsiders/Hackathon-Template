import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'accident_viewmodel.g.dart';

class AccidentViewModel = _AccidentViewModelBase with _$AccidentViewModel;

abstract class _AccidentViewModelBase with Store {
  @observable
  Position? currentLocation;

  @action
  Future<void> getCurrentLocation() async {
    currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
