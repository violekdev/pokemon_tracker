import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Sprites extends Equatable {
  const Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });
  factory Sprites.fromMap(Map<String, dynamic> map) {
    return Sprites(
      backDefault: map['back_default'] != null ? map['back_default'] as String  : null,
      backFemale: map['back_female'] != null ? map['back_female'] as String : null,
      backShiny: map['back_shiny']!= null ? map['back_shiny'] as String : null,
      backShinyFemale: map['back_shiny_female']!= null ? map['back_shiny_female'] as String : null,
      frontDefault: map['front_default']!= null ? map['front_default'] as String : null,
      frontFemale: map['front_female']!= null ? map['front_female'] as String : null,
      frontShiny: map['front_shiny']!= null ? map['front_shiny'] as String : null,
      frontShinyFemale: map['front_shiny_female'] != null ? map['front_shiny_female'] as String : null,
    );
  }

  factory Sprites.fromJson(String source) => Sprites.fromMap(json.decode(source) as Map<String, dynamic>);
  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;

  Sprites copyWith({
    ValueGetter<String?>? backDefault,
    ValueGetter<String?>? backFemale,
    ValueGetter<String?>? backShiny,
    ValueGetter<String?>? backShinyFemale,
    ValueGetter<String?>? frontDefault,
    ValueGetter<String?>? frontFemale,
    ValueGetter<String?>? frontShiny,
    ValueGetter<String?>? frontShinyFemale,
  }) {
    return Sprites(
      backDefault: backDefault != null ? backDefault() : this.backDefault,
      backFemale: backFemale != null ? backFemale() : this.backFemale,
      backShiny: backShiny != null ? backShiny() : this.backShiny,
      backShinyFemale: backShinyFemale != null ? backShinyFemale() : this.backShinyFemale,
      frontDefault: frontDefault != null ? frontDefault() : this.frontDefault,
      frontFemale: frontFemale != null ? frontFemale() : this.frontFemale,
      frontShiny: frontShiny != null ? frontShiny() : this.frontShiny,
      frontShinyFemale: frontShinyFemale != null ? frontShinyFemale() : this.frontShinyFemale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'backDefault': backDefault,
      'backFemale': backFemale,
      'backShiny': backShiny,
      'backShinyFemale': backShinyFemale,
      'frontDefault': frontDefault,
      'frontFemale': frontFemale,
      'frontShiny': frontShiny,
      'frontShinyFemale': frontShinyFemale,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Sprites(backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale)';
  }

  @override
  List<Object?> get props {
    return [
      backDefault,
      backFemale,
      backShiny,
      backShinyFemale,
      frontDefault,
      frontFemale,
      frontShiny,
      frontShinyFemale,
    ];
  }
}
