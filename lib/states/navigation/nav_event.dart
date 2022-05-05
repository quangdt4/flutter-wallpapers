abstract class NavigationEvent {
  const NavigationEvent();
}

class TabChange extends NavigationEvent {
  final int selectedTab;

  const TabChange({required this.selectedTab});
}
