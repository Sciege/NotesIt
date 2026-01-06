// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todolist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodolistModelImpl _$$TodolistModelImplFromJson(Map<String, dynamic> json) =>
    _$TodolistModelImpl(
      id: (json['id'] as num).toInt(),
      todoList: json['todoList'] as String,
      description: json['description'] as String,
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$$TodolistModelImplToJson(_$TodolistModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todoList': instance.todoList,
      'description': instance.description,
      'isDone': instance.isDone,
    };
