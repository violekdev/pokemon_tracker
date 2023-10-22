import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class HomeSprites extends Equatable {
  const HomeSprites({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });
  factory HomeSprites.fromMap(Map<String, dynamic> map) {
    return HomeSprites(
      frontDefault: map['front_default'] != null ? map['front_default'] as String : null,
      frontFemale: map['front_female'] != null ? map['front_female'] as String : null,
      frontShiny: map['front_shiny'] != null ? map['front_shiny'] as String : null,
      frontShinyFemale: map['front_shiny_female'] != null ? map['front_shiny_female'] as String : null,
    );
  }

  factory HomeSprites.fromJson(String source) => HomeSprites.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;

  HomeSprites copyWith({
    ValueGetter<String?>? frontDefault,
    ValueGetter<String?>? frontFemale,
    ValueGetter<String?>? frontShiny,
    ValueGetter<String?>? frontShinyFemale,
  }) {
    return HomeSprites(
      frontDefault: frontDefault != null ? frontDefault() : this.frontDefault,
      frontFemale: frontFemale != null ? frontFemale() : this.frontFemale,
      frontShiny: frontShiny != null ? frontShiny() : this.frontShiny,
      frontShinyFemale: frontShinyFemale != null ? frontShinyFemale() : this.frontShinyFemale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'frontDefault': frontDefault,
      'frontFemale': frontFemale,
      'frontShiny': frontShiny,
      'frontShinyFemale': frontShinyFemale,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Sprites(frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale)';
  }

  @override
  List<Object?> get props {
    return [
      frontDefault,
      frontFemale,
      frontShiny,
      frontShinyFemale,
    ];
  }
}
