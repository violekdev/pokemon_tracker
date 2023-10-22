import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class OfficialArtworkSprites extends Equatable {
  const OfficialArtworkSprites({
    this.frontDefault,
    this.frontShiny,
  });
  factory OfficialArtworkSprites.fromMap(Map<String, dynamic> map) {
    return OfficialArtworkSprites(
      frontDefault: map['front_default'] != null ? map['front_default'] as String : null,
      frontShiny: map['front_shiny'] != null ? map['front_shiny'] as String : null,
    );
  }

  factory OfficialArtworkSprites.fromJson(String source) => OfficialArtworkSprites.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? frontDefault;
  final String? frontShiny;

  OfficialArtworkSprites copyWith({
    ValueGetter<String?>? frontDefault,
    ValueGetter<String?>? frontShiny,
  }) {
    return OfficialArtworkSprites(
      frontDefault: frontDefault != null ? frontDefault() : this.frontDefault,
      frontShiny: frontShiny != null ? frontShiny() : this.frontShiny,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'frontDefault': frontDefault,
      'frontShiny': frontShiny,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Sprites(frontDefault: $frontDefault, frontShiny: $frontShiny';
  }

  @override
  List<Object?> get props {
    return [
      frontDefault,
      frontShiny,
    ];
  }
}
