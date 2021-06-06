import 'package:logger/logger.dart';

class SimpleLogger extends Logger{
  final String message;
  final LogFilter logFilter;

  SimpleLogger(this.message, LogFilter filter)
      :logFilter = filter,
       super(filter: filter );
}

class SimpleLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
  
}
