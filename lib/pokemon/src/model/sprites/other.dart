import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_tracker/pokemon/src/model/sprites/dream_world.dart';
import 'package:pokemon_tracker/pokemon/src/model/sprites/home.dart';
import 'package:pokemon_tracker/pokemon/src/model/sprites/official_artwork.dart';

class OtherSprites extends Equatable {
  const OtherSprites({
    this.dreamWorldSprites,
    this.homeSprites,
    this.officialArtworkSprites,
  });
  factory OtherSprites.fromMap(Map<String, dynamic> map) {
    return OtherSprites(
      dreamWorldSprites: map['dream_world'] != null ? DreamWorldSprites.fromMap(map['dream_world'] as Map<String, dynamic>) : null,
      homeSprites: map['home'] != null ? HomeSprites.fromMap(map['home'] as Map<String, dynamic>) : null,
      officialArtworkSprites: map['official_artwork'] != null ? OfficialArtworkSprites.fromMap(map['official_artwork'] as Map<String, dynamic>) : null,
    );
  }

  factory OtherSprites.fromJson(String source) => OtherSprites.fromMap(json.decode(source) as Map<String, dynamic>);

  final DreamWorldSprites? dreamWorldSprites;
  final HomeSprites? homeSprites;
  final OfficialArtworkSprites? officialArtworkSprites;

  OtherSprites copyWith({
    ValueGetter<DreamWorldSprites?>? dreamWorldSprites,
    ValueGetter<HomeSprites?>? homeSprites,
    ValueGetter<OfficialArtworkSprites?>? officialArtworkSprites,
  }) {
    return OtherSprites(
      dreamWorldSprites: dreamWorldSprites != null ? dreamWorldSprites() : this.dreamWorldSprites,
      homeSprites: homeSprites != null ? homeSprites() : this.homeSprites,
      officialArtworkSprites: officialArtworkSprites != null ? officialArtworkSprites() : this.officialArtworkSprites,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dreamWorldSprites': dreamWorldSprites,
      'homeSprites': homeSprites,
      'officialArtworkSprites': officialArtworkSprites,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Sprites(dreamWorldSprites: $dreamWorldSprites, homeSprites: $homeSprites, officialArtworkSprites: $officialArtworkSprites';
  }

  @override
  List<Object?> get props {
    return [
      dreamWorldSprites,
      homeSprites,
      officialArtworkSprites,
    ];
  }
}
