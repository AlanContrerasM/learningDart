import 'package:flutter/material.dart';

//camelCase
const age = 27;
const twiceTheAge = age * 2;
// var name = 'Alex';
void function1() {}

String getFullName(String firstName, String lastName) {
  // return firstName + ' ' + lastName;
  return '$firstName $lastName';
}

String getFullName2(String firstName, String lastName) =>
    '$firstName $lastName';

enum AnimalType { cat, dog, bunny }

void test() {
  final name = 'Foo';
  if (name == 'Foo') {
    print('Yes, this is Foo');
  } else if (name != 'Bar') {
    print("I'm not Bar, escape \" ");
  } else {
    print("No, this is not Foo");
  }
  final age = 20;
  final halfOfAge = age / 2;
  print(halfOfAge);
  var age2 = 21;
  final ageMinusOne = --age2; //age2++ --age2
  print(ageMinusOne);

  //lists
  var names = ['Foo', 'Bar', 'Baz'];
  print(names[1] + name.length.toString());

  //set
  var stringSet = {'Foo', 'Bar', 'Baz'}; //does not accept duplicate values
  stringSet.add('Foo');
  stringSet.add('Bar');
  stringSet.add('New');
  print(stringSet);

  const things = ['Foo', 1];
  print(things);
  print(int.parse(things[1].toString()) * 4);

  //Map
  var person = {
    'age': 20,
    'name': 'Foo',
    'something': 14,
    'another': 'Woo',
    'extra': 'Hey'
  };
  person['lastName'] = 'Bar';
  print(person);

  //null safety
  String? name1 = null;
  name1 = 'Foo';
  List<String?>? nameList = ['Foo', 'Bar', null];
  nameList.add('new');
  print(nameList);
  //cherry picking non-null values
  const String? firstName = null;
  const String? middleName = 'Bar';
  const String? lastName = "vaz";
  const firstNonValue = firstName ?? middleName ?? lastName;
  print(firstNonValue);

  //null aware assignment operator
  String? dogName = firstName;
  dogName ??= middleName;
  print(dogName);

  //conditional invocation
  List<String>? nameList2 = null;
  nameList2?.add('value');
  final numberOfNames = nameList2?.length ?? 0;
  print(numberOfNames);

  //enumerations
  test2(AnimalType.dog);
}

void test2(AnimalType animalType) {
  //enumerations, classes, and objects
  //enum was defined outisde the function
  if (animalType == AnimalType.dog) {
    print("Dogs are cool");
  }
  switch (animalType) {
    case AnimalType.bunny:
      print("Bunnies");
      break;
    case AnimalType.cat:
      print("Kitty");
      break;
    case AnimalType.dog:
      print("puppies");
  }
  testClassesObjects();
}

//classes and Objects
class Person {
  void run() {
    print("running");
  }

  void breathe() {
    print("breathing");
  }
}

//class with object, Methods
class Person2 {
  //pointer on name ctrl + .  -> create constructor for final fields.
  final String name;
  final String lastName;
  Person2(this.name, this.lastName);
  void printName() {
    print("I will now print the name of this person");
    print(name);
  }
}

void testClassesObjects() {
  final person = Person();
  person.breathe();
  person.run();
  final foo = Person2("Foo", "Bar");
  print(foo.name); //valid
  foo.printName();
  testInheritance();
}

//inheritance and subclassing
class LivingThing {
  void breathe() {
    print("Living thing is breathing");
  }

  void move() {
    print("I am moving");
  }
}

class Cat extends LivingThing {}

//abstract class
abstract class Mammals {
  void getPregnant() {}
}

class Dog implements Mammals {
  @override
  void getPregnant() {
    // TODO: implement getPregnant
  }
}

void testInheritance() {
  final crookshanks = Cat();
  crookshanks.breathe();
  crookshanks.move();
  testCustomOperators();
}

//factory constructor
class Car {
  final String model;
  Car(this.model);

  factory Car.Corvette() {
    return Car("Corvette");
  }
}

//Custom operators
//Custom operators
class Car2 extends Car {
  Car2(String model) : super(model);

  @override
  bool operator ==(covariant Car2 other) => other.model == model;
  @override
  int get hashCode => model.hashCode;
}

void testCustomOperators() {
  final car1 = Car2('Fusion');
  final car2 = Car2('Fusion');
  if (car1 == car2) {
    print("equal");
  } else {
    print("Not equal");
  }
  testExtensions();
}

//class Extensions.
extension Run on Person2 {
  void run() {
    print("Person $name is running");
  }

  String get fullName => '$name $lastName';
}

void testExtensions() {
  final alan = Person2('Alan', 'Con');
  alan.run();
  print(alan.fullName);
  testFuture();
}

//Future , has to do with async await. data to be returned in the future.
Future<int> heavyFutureThatMultipliesByTwo(int a) {
  return Future.delayed(Duration(seconds: 2), () => a * 2);
}

void testFuture() async {
  final result = await heavyFutureThatMultipliesByTwo(10);
  print(result);
  testStream();
}

//Streams
Stream<String> getName() {
  return Stream.value('Foo');
  // return Stream.periodic(const Duration(seconds: 1), (value) => 'Foo');
}

void testStream() async {
  // await for (final value in getName()) {
  //   print(value);
  // }
  print("Stream finished working");
  testGenerator();
}

//Generators
Iterable<int> getOneTwoThree() sync* {
  //could be list, generates a List asynchronously
  yield 1;
  yield 2;
  yield 3;
}

void testGenerator() async {
  for (final value in getOneTwoThree()) {
    print(value);
    if (value == 2) {
      break;
    }
  }
  testGenerics();
}

//Generics
class PairOfStrings {
  final String value1;
  final String value2;

  PairOfStrings(this.value1, this.value2);
}

class PairOfInts {
  final int value1;
  final int value2;

  PairOfInts(this.value1, this.value2);
}

class Pair<A, B> {
  final A value1;
  final B value2;

  Pair(this.value1, this.value2);
}

void testGenerics() {
  final names = Pair('foo', 20);
  //names.value2 is fine, supposed to be int.
}

void main() {
  //stuff written by us
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //by us
    print(getFullName("Alan", "Contreras"));
    test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
