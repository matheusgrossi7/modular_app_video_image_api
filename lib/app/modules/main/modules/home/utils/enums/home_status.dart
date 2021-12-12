// MobX does not accept enum as observable, so this class was created

class HomeStatus {
  static int get loading => 0;
  static int get success => 1;
  static int get error => 2;
}
