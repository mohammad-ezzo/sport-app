// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starxi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartXI _$StartXIFromJson(Map<String, dynamic> json) => StartXI(
      player: json['player'] == null
          ? null
          : Player.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartXIToJson(StartXI instance) => <String, dynamic>{
      'player': instance.player,
    };
