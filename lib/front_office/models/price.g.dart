// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      hsnCode: json['hsnCode'] as String?,
      priceWithoutTax: (json['priceWithoutTax'] as num).toDouble(),
      discountRate: (json['discountRate'] as num).toDouble(),
      taxRate: (json['taxRate'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'hsnCode': instance.hsnCode,
      'priceWithoutTax': instance.priceWithoutTax,
      'discountRate': instance.discountRate,
      'taxRate': instance.taxRate,
    };
