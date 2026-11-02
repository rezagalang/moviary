/// Injectable time source. All persisted timestamps are UTC.
abstract interface class AppClock {
  DateTime nowUtc();
}

class SystemClock implements AppClock {
  const SystemClock();

  @override
  DateTime nowUtc() => DateTime.now().toUtc();
}
