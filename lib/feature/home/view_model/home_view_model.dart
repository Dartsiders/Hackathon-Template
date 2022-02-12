import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:hackathontemplate/core/models/user_model/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../core/enum/view_state_enum.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  ViewState viewState = ViewState.idle;

  @observable
  UserModel? userModel = UserModel();

  @observable
  PersistentTabController homeTabController = PersistentTabController();

  @observable
  GroupButtonController mainGroupButtonController = GroupButtonController(
    selectedIndex: 0,
  );

  @observable
  int mainGroupButtonSelectedIndex = 0;
}
