import 'package:apollocode_flutter_utilities/themes/theme_extensions_provider.dart';
import 'package:live_tester/src/configs/theme_provider/app_bar_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/banner_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/bottom_app_bar_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/bottom_navigation_bar_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/bottom_sheet_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/button_bar_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/card_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/checkbox_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/chip_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/data_table_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/dialog_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/divider_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/drawer_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/elevated_button_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/expansion_tile_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/floating_action_button_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/input_decoration_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/list_tile_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/navigation_bar_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/navigation_rail_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/outlined_button_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/popup_menu_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/progress_indicator_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/radio_button_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/scrollbar_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/slider_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/snack_bar_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/switch_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/tab_bar_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_button_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_selection_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/text_theme.dart';
import 'package:live_tester/src/configs/theme_provider/time_picker_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/toggle_buttons_theme_provider.dart';
import 'package:live_tester/src/configs/theme_provider/tooltip_theme_provider.dart';
import 'package:live_tester/src/utilities/figma_manager.dart';
import 'package:flutter/material.dart';

class ThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _helper = FigmaManager.instance.helper;
  final _iconTheme = const IconThemeData(
    size: 40,
  );

  late final _appBarThemeProvider = AppBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _bannerThemeProvider = BannerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _bottomAppBarThemeProvider = BottomAppBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _bottomNavigationBarThemeProvider =
      BottomNavigationBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _bottomSheetThemeProvider = BottomSheetThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _buttonBarThemeProvider = ButtonBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _cardThemeProvider = CardThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _checkboxThemeProvider = CheckboxThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _chipThemeProvider = ChipThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _dataTableThemeProvider = DataTableThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _dialogThemeProvider = DialogThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _dividerThemeProvider = DividerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _drawerThemeProvider = DrawerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _elevatedButtonThemeProvider = ElevatedButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _expansionTileThemeProvider = ExpansionTileThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _floatingActionButtonThemeProvider =
      FloatingActionButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _inputDecorationThemeProvider = InputDecorationThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _listTileThemeProvider = ListTileThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _navigationBarThemeProvider = NavigationBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _navigationRailThemeProvider = NavigationRailThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _outlinedButtonThemeProvider = OutlinedButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _popupMenuThemeProvider = PopupMenuThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _progressIndicatorThemeProvider = ProgressIndicatorThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _radioButtonThemeProvider = RadioButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _scrollbarThemeProvider = ScrollbarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _sliderThemeProvider = SliderThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _snackBarThemeProvider = SnackBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _switchThemeProvider = SwitchThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _tabBarThemeProvider = TabBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _textButtonThemeProvider = TextButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _textSelectionThemeProvider = TextSelectionThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _themeExtensionsProvider = ThemeExtensionsProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _timePickerThemeProvider = TimePickerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _toggleButtonsThemeProvider = ToggleButtonsThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );
  late final _tooltipThemeProvider = TooltipThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  ThemeData getFrom(Brightness brightness) {
    final colorScheme = _colorSchemeProvider.getFrom(brightness);
    return ThemeData(
      appBarTheme: _appBarThemeProvider.getFrom(brightness),
      backgroundColor: colorScheme.onPrimary,
      bannerTheme: _bannerThemeProvider.getFrom(brightness),
      bottomAppBarColor: colorScheme.surface,
      bottomAppBarTheme: _bottomAppBarThemeProvider.getFrom(brightness),
      bottomNavigationBarTheme: _bottomNavigationBarThemeProvider.getFrom(
        brightness,
      ),
      bottomSheetTheme: _bottomSheetThemeProvider.getFrom(brightness),
      brightness: brightness,
      buttonBarTheme: _buttonBarThemeProvider.getFrom(brightness),
      canvasColor: colorScheme.background,
      cardColor: colorScheme.surface,
      cardTheme: _cardThemeProvider.getFrom(brightness),
      checkboxTheme: _checkboxThemeProvider.getFrom(brightness),
      chipTheme: _chipThemeProvider.getFrom(brightness),
      colorScheme: colorScheme,
      dataTableTheme: _dataTableThemeProvider.getFrom(brightness),
      dialogBackgroundColor: colorScheme.surface,
      dialogTheme: _dialogThemeProvider.getFrom(brightness),
      disabledColor: colorScheme.onSurface.withOpacity(0.38),
      dividerColor: colorScheme.outline,
      dividerTheme: _dividerThemeProvider.getFrom(brightness),
      drawerTheme: _drawerThemeProvider.getFrom(brightness),
      elevatedButtonTheme: _elevatedButtonThemeProvider.getFrom(brightness),
      errorColor: colorScheme.error,
      expansionTileTheme: _expansionTileThemeProvider.getFrom(brightness),
      extensions: _themeExtensionsProvider.getFrom(brightness),
      floatingActionButtonTheme: _floatingActionButtonThemeProvider.getFrom(
        brightness,
      ),
      focusColor: colorScheme.onPrimary.withOpacity(0.12),
      highlightColor: colorScheme.onPrimary.withOpacity(0.12),
      hintColor: colorScheme.onSurfaceVariant,
      hoverColor: colorScheme.onPrimary.withOpacity(0.08),
      iconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurface,
      ),
      indicatorColor: colorScheme.primary,
      inputDecorationTheme: _inputDecorationThemeProvider.getFrom(brightness),
      listTileTheme: _listTileThemeProvider.getFrom(brightness),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      navigationBarTheme: _navigationBarThemeProvider.getFrom(brightness),
      navigationRailTheme: _navigationRailThemeProvider.getFrom(brightness),
      outlinedButtonTheme: _outlinedButtonThemeProvider.getFrom(brightness),
      popupMenuTheme: _popupMenuThemeProvider.getFrom(brightness),
      primaryColor: colorScheme.primary,
      primaryColorDark: _colorSchemeProvider.getDarkerPrimaryFrom(brightness),
      primaryColorLight: _colorSchemeProvider.getLighterPrimaryFrom(brightness),
      primaryIconTheme: _iconTheme.copyWith(
        color: colorScheme.onPrimary,
      ),
      primaryTextTheme: textTheme.apply(
        bodyColor: colorScheme.onPrimary,
        decorationColor: colorScheme.onPrimary,
        displayColor: colorScheme.onPrimary,
      ),
      progressIndicatorTheme: _progressIndicatorThemeProvider.getFrom(
        brightness,
      ),
      radioTheme: _radioButtonThemeProvider.getFrom(brightness),
      scaffoldBackgroundColor: colorScheme.background,
      scrollbarTheme: _scrollbarThemeProvider.getFrom(brightness),
      secondaryHeaderColor: colorScheme.surface,
      selectedRowColor: colorScheme.onSurfaceVariant,
      shadowColor: colorScheme.shadow,
      sliderTheme: _sliderThemeProvider.getFrom(brightness),
      snackBarTheme: _snackBarThemeProvider.getFrom(brightness),
      splashColor: _helper.isDesktop || _helper.isLaptop
          ? null
          : colorScheme.primary.withOpacity(0.12),
      splashFactory:
          _helper.isDesktop || _helper.isLaptop ? NoSplash.splashFactory : null,
      switchTheme: _switchThemeProvider.getFrom(brightness),
      tabBarTheme: _tabBarThemeProvider.getFrom(brightness),
      textButtonTheme: _textButtonThemeProvider.getFrom(brightness),
      textSelectionTheme: _textSelectionThemeProvider.getFrom(brightness),
      textTheme: textTheme.apply(
        displayColor: colorScheme.onSurface,
        bodyColor: colorScheme.onSurface,
        decorationColor: colorScheme.onSurface,
      ),
      timePickerTheme: _timePickerThemeProvider.getFrom(brightness),
      toggleableActiveColor: colorScheme.primary,
      toggleButtonsTheme: _toggleButtonsThemeProvider.getFrom(brightness),
      tooltipTheme: _tooltipThemeProvider.getFrom(brightness),
      unselectedWidgetColor: colorScheme.onSurfaceVariant,
      useMaterial3: true,
    );
  }
}
