import 'compact_format_type.dart';

class PriceFormatterSettings {
  final String? symbol;
  final String thousandSeparator;
  final String decimalSeparator;
  final String symbolAndNumberSeparator;
  final int fractionDigits;
  final CompactFormatType compactFormatType;

  PriceFormatterSettings({
    this.symbol = '\$',
    this.thousandSeparator = ',',
    this.decimalSeparator = '.',
    this.symbolAndNumberSeparator = ' ',
    this.fractionDigits = 2,
    this.compactFormatType = CompactFormatType.long,
  });

  factory PriceFormatterSettings.fromJson(Map<String, dynamic> json) =>
      PriceFormatterSettings(
        symbol: json['symbol'] ?? '\$',
        thousandSeparator: json['thousand_separator'] ?? ',',
        decimalSeparator: json['decimal_separator'] ?? '.',
        symbolAndNumberSeparator: json['symbol_and_number_separator'] ?? ' ',
        fractionDigits: json['fraction_digits'] ?? 2,
        compactFormatType: json['compact_format_type'] == 'short'
            ? CompactFormatType.short
            : CompactFormatType.long,
      );

  PriceFormatterSettings copyWith({
    final String? symbol,
    final String? thousandSeparator,
    final String? decimalSeparator,
    final String? symbolAndNumberSeparator,
    final int? fractionDigits,
    final CompactFormatType? compactFormatType,
  }) =>
      PriceFormatterSettings(
        symbol: symbol ?? this.symbol,
        thousandSeparator: thousandSeparator ?? this.thousandSeparator,
        decimalSeparator: decimalSeparator ?? this.decimalSeparator,
        symbolAndNumberSeparator:
            symbolAndNumberSeparator ?? this.symbolAndNumberSeparator,
        fractionDigits: fractionDigits ?? this.fractionDigits,
        compactFormatType: compactFormatType ?? this.compactFormatType,
      );
}
