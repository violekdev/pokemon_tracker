import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Stats extends Equatable {
  const Stats({
    required this.stat,
    this.baseStat,
    this.effort,
  });
  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStat: map['base_stat'] != null ? map['base_stat'] as int : null,
      effort: map['effort'] != null ? map['effort'] as int : null,
      stat: Stat.fromMap(map['stat'] as Map<String, dynamic>),
    );
  }

  factory Stats.fromJson(String source) => Stats.fromMap(json.decode(source) as Map<String, dynamic>);
  final int? baseStat;
  final int? effort;
  final Stat stat;

  Stats copyWith({
    ValueGetter<int?>? baseStat,
    ValueGetter<int?>? effort,
    ValueGetter<Stat>? stat,
  }) {
    return Stats(
      baseStat: baseStat != null ? baseStat() : this.baseStat,
      effort: effort != null ? effort() : this.effort,
      stat: stat != null ? stat() : this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'baseStat': baseStat,
      'effort': effort,
      'stat': stat,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Sprites(baseStat: $baseStat, effort: $effort, stat: $stat)';
  }

  @override
  List<Object?> get props {
    return [
      baseStat,
      effort,
      stat,
    ];
  }
}

class Stat extends Equatable {
  const Stat({
    this.name,
    this.url,
  });
  factory Stat.fromMap(Map<String, dynamic> map) {
    return Stat(
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  factory Stat.fromJson(String source) => Stat.fromMap(json.decode(source) as Map<String, dynamic>);
  final String? name;
  final String? url;

  Stat copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? url,
  }) {
    return Stat(
      name: name != null ? name() : this.name,
      url: url != null ? url() : this.url,
    );
  }

  String statName(String statName) {
    switch (statName) {
      case 'HP':
        return 'HP';
      case 'ATTACK':
        return 'ATK';
      case 'DEFENSE':
        return 'DEF';
      case 'SPECIAL-ATTACK':
        return 'SATK';
      case 'SPECIAL-DEFENSE':
        return 'SDEF';
      case 'SPEED':
        return 'SPD';
      default:
        return statName;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Sprites(name: $name, url: $url)';
  }

  @override
  List<Object?> get props {
    return [
      name,
      url,
    ];
  }
}
