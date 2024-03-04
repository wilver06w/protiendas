enum Environment { dev, prod }

extension EnvironmentExtension on Environment {
  String get value {
    switch (this) {
      case Environment.dev:
        return 'dev';
      case Environment.prod:
        return 'prod';
    }
  }
}
