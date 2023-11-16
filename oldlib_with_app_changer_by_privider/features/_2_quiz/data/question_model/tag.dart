import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  final String? name;

  const Tag({this.name});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  @override
  List<Object?> get props => [name];
}
