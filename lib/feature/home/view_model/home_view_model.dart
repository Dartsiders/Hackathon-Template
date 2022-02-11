import 'package:flutter/material.dart';
import 'package:hackathontemplate/core/models/user_model/user_model.dart';
import 'package:mobx/mobx.dart';

import '../../../core/enum/view_state_enum.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  ViewState viewState = ViewState.idle;

  @observable
  UserModel? userModel = UserModel();
}
