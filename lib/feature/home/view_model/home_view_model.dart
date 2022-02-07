import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/enum/view_state_enum.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;



abstract class _HomeViewModelBase with Store {

  @observable
  ViewState viewState = ViewState.idle;


  
}