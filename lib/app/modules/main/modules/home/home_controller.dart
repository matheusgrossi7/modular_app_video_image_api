import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  ObservableList<String> imagesUrls = [
    "https://images.pexels.com/photos/10346632/pexels-photo-10346632.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10401243/pexels-photo-10401243.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10348578/pexels-photo-10348578.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10346632/pexels-photo-10346632.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10401243/pexels-photo-10401243.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10348578/pexels-photo-10348578.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10346632/pexels-photo-10346632.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10401243/pexels-photo-10401243.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10348578/pexels-photo-10348578.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  ].asObservable();
}
