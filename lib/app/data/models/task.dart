import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task extends Equatable {
  const Task({
    required this.title,
    required this.icon,
    required this.color,
    this.todos,
  });

  final String title;
  static const String titleKey = "title";

  @JsonKey(name: 'Icon')
  final int icon;
  static const String iconKey = "Icon";

  final String color;
  static const String colorKey = "color";

  final List<String>? todos;
  static const String todosKey = "todos";

  Task copyWith({
    String? title,
    int? icon,
    String? color,
    List<String>? todos,
  }) {
    return Task(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      todos: todos ?? this.todos,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  String toString() {
    return "$title, $icon, $color, $todos, ";
  }

  @override
  // todos: implement props
  List<Object?> get props => [title, icon, color];
}
