import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class DreamWorldSprites extends Equatable {
  const DreamWorldSprites({
    this.frontDefault,
    this.frontFemale,
  });
  factory DreamWorldSprites.fromMap(Map<String, dynamic> map) {
    return DreamWorldSprites(
      frontDefault: map['front_default'] != null ? map['front_default'] as String  : null,
      frontFemale: map['front_female'] != null ? map['front_female'] as String : null,
    );
  }

  factory DreamWorldSprites.fromJson(String source) => DreamWorldSprites.fromMap(json.decode(source) as Map<String, dynamic>);
  final String? frontDefault;
  final String? frontFemale;

  DreamWorldSprites copyWith({
    ValueGetter<String?>? frontDefault,
    ValueGetter<String?>? frontFemale,
  }) {
    return DreamWorldSprites(
      frontDefault: frontDefault != null ? frontDefault() : this.frontDefault,
      frontFemale: frontFemale != null ? frontFemale() : this.frontFemale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': frontDefault,
      'front_female': frontFemale,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Sprites(front_default: $frontDefault, front_female: $frontFemale';
  }

  @override
  List<Object?> get props {
    return [
      frontDefault,
      frontFemale,
    ];
  }
}
