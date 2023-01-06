import 'package:apollocode_flutter_utilities/widgets/togglables/material_checkbox.dart';

/// State of a [MaterialCheckbox].
///
/// For a dual state checkbox, the state can be [selected] or [unselected]. For
/// a tristate checkbox, a third state is added: [partiallySelected].
enum CheckboxState {
  /// Partially selected state of a tristate checkbox.
  ///
  /// The checkbox will display a dash inside its box.
  ///
  /// This state is not used by a dual state checkbox.
  partiallySelected,

  /// Fully selected state of a tristate or a dual state checkbox.
  ///
  /// The checkbox will display a check mark icon inside its box.
  selected,

  /// Unselected state of a tristate or a dual state checkbox,
  ///
  /// The checkbox won't display anything inside its box.
  unselected;

  /// Default state of a tristate or a dual state checkbox.
  ///
  /// This default state is the initial state of any checkbox that doesn't have
  /// any state provided.
  static CheckboxState get defaultState => CheckboxState.unselected;

  /// A flag that indicates if the checkbox should display itself as selected or
  /// not.
  ///
  /// If the checkbox should be displayed as selected, the box will be filled.
  /// Otherwise, the box will stay empty.
  bool get isSelected {
    switch (this) {
      case CheckboxState.partiallySelected:
        return true;
      case CheckboxState.selected:
        return true;
      case CheckboxState.unselected:
        return false;
    }
  }

  /// The next state the checkbox should have after an user tapped it.
  ///
  /// The user can't tap on the checkbox to give it a partially selected state.
  /// A fully selected checkbox will be unselected after an user tapped it. An
  /// unselected checkbox will be fully selected after an user tapped it. And a
  /// partially selected checkbox will be unselected after an user tapped it.
  ///
  /// The only way for the next state of a checkbox to be partially selected is
  /// to provide the state to the checkbox.
  CheckboxState get nextState {
    switch (this) {
      case CheckboxState.partiallySelected:
        return CheckboxState.unselected;
      case CheckboxState.selected:
        return CheckboxState.unselected;
      case CheckboxState.unselected:
        return CheckboxState.selected;
    }
  }
}
