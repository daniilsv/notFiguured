import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 5,
    lineLength: 10,
  ),
);

final Logger silentLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 5,
  ),
);
