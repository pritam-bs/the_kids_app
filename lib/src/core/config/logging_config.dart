import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    filter: _CustomLogFilter(),
    printer: PrettyPrinter(
      methodCount: 0, // Number of method calls to show
      errorMethodCount: 5, // Stack trace lines for errors
      lineLength: 120, // Wrap lines beyond this length
      colors: true, // Enable colors in console
      printEmojis: true, // AppLogger.d emojis for log levels
      dateTimeFormat: (time) => DateTimeFormat.onlyTimeAndSinceStart(
        time,
      ), // Include timestamp in logs
    ),
    output: _MultiOutput(),
  );

  static void v(dynamic message) => _logger.t(message);
  static void d(dynamic message) => _logger.d(message);
  static void i(dynamic message) => _logger.i(message);
  static void w(dynamic message) => _logger.w(message);
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
  static void f(dynamic message) => _logger.f(message);
}

class _CustomLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (kReleaseMode) {
      return event.level.index >= Level.info.index; // Info+
    } else if (kProfileMode) {
      return event.level.index >= Level.info.index; // Info+
    } else {
      return true; // Debug: allow all
    }
  }
}

class _CrashlyticsOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    if (event.level == Level.error) {
      FirebaseCrashlytics.instance.recordError(
        event.origin.error,
        event.origin.stackTrace,
        information: event.lines,
      );
    }
  }
}

class _MultiOutput extends LogOutput {
  final List<LogOutput> _outputs = [];

  _MultiOutput() {
    if (kReleaseMode) {
      // Release: Firebase only
      _outputs.add(_CrashlyticsOutput());
    } else if (kProfileMode) {
      // Profile: Console
      _outputs.add(ConsoleOutput());
    } else if (kDebugMode) {
      // Debug: Console + File
      _outputs.add(ConsoleOutput());
    }
  }

  @override
  void output(OutputEvent event) {
    for (final output in _outputs) {
      output.output(event);
    }
  }
}
