class NavigationState {
  final int selectedItem;
  final List<int> listItem;

  int get selectedTab => listItem[selectedItem];

  const NavigationState._({
    this.selectedItem = 0,
    this.listItem = const [],
  });

  const NavigationState.initial() : this._();

  NavigationState copyWith({
    final int? selectedItem,
    final List<int>? listItem,
  }) {
    return NavigationState._(
      listItem: listItem ?? this.listItem,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }
}
