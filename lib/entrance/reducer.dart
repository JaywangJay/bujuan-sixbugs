import 'package:bujuan/constant/constants.dart';
import 'package:bujuan/utils/sp_util.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<EntranceState> buildReducer() {
  return asReducer(
    <Object, Reducer<EntranceState>>{
      EntranceAction.pageChange: _onPageChange,
      EntranceAction.miniNavBarSwitch: _onMiniNavBarSwitch,
    },
  );
}


EntranceState _onPageChange(EntranceState state, Action action) {
  final int selectIndex = action.payload;
  if (state.selectIndex != selectIndex) {
    return state.clone()..selectIndex = selectIndex;
  }
  return state;
}


EntranceState _onMiniNavBarSwitch(EntranceState state, Action action) {
  final bool miniNav = !state.miniNav;
  SpUtil.putBool(Constants.MINI_NAV, miniNav);
  return state.clone()..miniNav = miniNav;
}
