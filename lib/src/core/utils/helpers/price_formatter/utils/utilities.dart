part of 'package:protiendas/src/core/utils/helpers/price_formatter/price_formatter.dart';

enum FastCalcType {
  addition,
  substraction,
  multiplication,
  division,
  percentageAddition,
  percentageSubstraction
}

class _Utilities {
  final double? amount;
  final PriceFormatterSettings settings;

  _Utilities({this.amount = 0.0, PriceFormatterSettings? settings})
      : settings = settings ??= PriceFormatterSettings();

  String get baseFormat => NumberFormat.currency(
        symbol: '',
        decimalDigits: settings.fractionDigits,
        locale: 'en_US',
      ).format(amount);

  String get refineSeparator => baseFormat
      .replaceAll(',', '(,)')
      .replaceAll('.', '(.)')
      .replaceAll('(,)', settings.thousandSeparator)
      .replaceAll('(.)', settings.decimalSeparator);
  String get spacer => settings.symbolAndNumberSeparator;

  NumberFormat get baseCompact =>
      settings.compactFormatType == CompactFormatType.short
          ? NumberFormat.compact()
          : NumberFormat.compactLong();
}
