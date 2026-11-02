import 'package:moviary/core/services/app_clock.dart';

class FixedClock implements AppClock {
  FixedClock(this.now);

  DateTime now;

  @override
  DateTime nowUtc() => now;
}