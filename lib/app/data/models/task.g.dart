// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      title: json['title'] as String?,
      icon: json['Icon'] as int?,
      color: json['color'] as String?,
      todo: (json['todo'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'title': instance.title,
      'Icon': instance.icon,
      'color': instance.color,
      'todo': instance.todo,
    };
