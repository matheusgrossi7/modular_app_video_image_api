import 'animations_parameters_interface.dart';

class AnimationsParameters extends AnimationsParametersI {
  @override
  Duration get duration => const Duration(milliseconds: 300);

  @override
  Duration get fadeInDuration => const Duration(milliseconds: 210);

  @override
  Duration get fadeOutDuration => const Duration(milliseconds: 90);
}
