import 'package:geolocator/geolocator.dart';
import 'package:hackathontemplate/core/services/location/location_service.dart';
import 'package:mobx/mobx.dart';
part 'accident_viewmodel.g.dart';

class AccidentViewModel = _AccidentViewModelBase with _$AccidentViewModel;

abstract class _AccidentViewModelBase with Store {
  final LocationService _locationService = LocationService();

  @observable
  Position? currentLocation;

  @action
  void setCurrentLocation() {
    currentLocation = _locationService.getCurrentPosition() as Position?;
    print(currentLocation!.latitude);
  }
}
