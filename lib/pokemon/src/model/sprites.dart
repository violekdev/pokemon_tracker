import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_tracker/pokemon/src/model/sprites/other.dart';

class Sprites extends Equatable {
  const Sprites({
    required this.other,
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
      other: OtherSprites.fromMap(map['other'] as Map<String, dynamic>),
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
  final OtherSprites other;

  Sprites copyWith({
    ValueGetter<String?>? backDefault,
    ValueGetter<String?>? backFemale,
    ValueGetter<String?>? backShiny,
    ValueGetter<String?>? backShinyFemale,
    ValueGetter<String?>? frontDefault,
    ValueGetter<String?>? frontFemale,
    ValueGetter<String?>? frontShiny,
    ValueGetter<String?>? frontShinyFemale,
    ValueGetter<OtherSprites>? other,
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
      other: other != null ? other() : this.other,
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
      'other': other,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Sprites(backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale, other: $other)';
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
      other,
    ];
  }
}
