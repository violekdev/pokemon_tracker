import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:pokemon_tracker/app/core/core.dart';

class Types extends Equatable {
  const Types({
    required this.type,
    // required this.typeIcon,
  });

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      type: Type.fromMap(map['type'] as Map<String, dynamic>),
    );
  }

  factory Types.fromJson(String source) => Types.fromMap(json.decode(source) as Map<String, dynamic>);
  // int? slot;
  final Type type;

  Types copyWith({
    ValueGetter<Type>? type,
  }) {
    return Types(
      type: type != null ? type() : this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Types(type: $type)';

  @override
  List<Object?> get props => [type];
}

class Type extends Equatable {
  const Type({
    required this.name,
    required this.url,
  });

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      name: map['name'] as String,
      url: PokemonAssetsUrl.pokeTypesIcons[map['name'] as String]!,
    );
  }

  factory Type.fromJson(String source) => Type.fromMap(json.decode(source) as Map<String, dynamic>);
  final String name;
  final String url;

  Type copyWith({
    String? name,
    String? url,
  }) {
    return Type(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Type(name: $name, url: $url)';

  @override
  List<Object> get props => [name, url];
}
