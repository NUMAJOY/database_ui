import 'package:objectbox/objectbox.dart';

@Entity()
class entity_student{
  @Id()
  int id=0;
  String name;
  int age;
  String address;
  entity_student({this.id=0,
  required this.name,required this.age,required this.address});



}