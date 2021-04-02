import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 1)
class Person{

  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  int intAge;
  
  Person({ required this.name, required this.age, this.intAge = 20});

  @override
  String toString() {
    // TODO: implement toString
    return "$name $age $intAge";
  }
}