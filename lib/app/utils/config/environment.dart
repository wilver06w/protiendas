enum Environment { dev, prod, devProd }

extension EnvironmentExtension on Environment {
  String get value {
    switch (this) {
      case Environment.dev:
        return 'dev';
      case Environment.prod:
        return 'prod';
      case Environment.devProd:
        return 'devProd';
    }
  }
}
