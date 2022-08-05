// import 'package:flutter/material.dart';
// import 'package:flutter_app/layout.todo_app.ArchivedTasks/ArchivedTasksScreen.dart';
// import 'package:flutter_app/Done%20Tasks/Done_TasksScreen.dart';
// import 'package:flutter_app/new%20tasks/NewTasksScreen.dart';
//  // import 'package:sqflite/sqflite.dart';
// class HomeLayout extends StatefulWidget {
//   @override
//   _HomeLayoutState createState() => _HomeLayoutState();
// }
//
// class _HomeLayoutState extends State<HomeLayout> {
//
//   int currentIndex = 0;
//
//   List<Widget> screens = [
//     NewTasksScreen(),
//     DoneTasksScreen(),
//     ArchivedTasksScreen(),
//   ];
//
//   List<String> titles =
//   [
//     'New Tasks',
//     'layout.todo_app.Done Tasks',
//     'Archived Tasks',
//   ];
//
//   // Database database;
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   bool isBottomSheetShown = false;
//   IconData fabIcon = Icons.edit;
//   var titleController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     createDatabase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         title: Text(
//           titles[currentIndex],
//         ),
//       ),
//       body: screens[currentIndex],
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async
//         {
//           if (isBottomSheetShown) {
//             Navigator.pop(context);
//             isBottomSheetShown = false;
//             setState(() {
//               fabIcon = Icons.edit;
//             });
//           } else {
//             scaffoldKey.currentState.showBottomSheet(
//                   (context) =>
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children:
//                     [
//                       defaultFormField(
//                         controller: titleController,
//                         type: TextInputType.text,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return 'title must not be empty';
//                           }
//                           return null;
//                         },
//                         label: 'Task Title',
//                         prefix: Icons.title,
//                       ),
//                     ],
//                   ),
//             );
//             isBottomSheetShown = true;
//             setState(() {
//               fabIcon = Icons.add;
//             });
//           }
//
//           scaffoldKey.currentState.showBottomSheet(
//                 (context) =>
//                 Container(
//                   width: double.infinity,
//                 ),
//           );
//         },
//         child: Icon(
//           Icons.add,
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar
//         (
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//           currentIndex = index;
//           print(index);
//         },
//         items:
//         [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.menu,
//             ),
//             label: 'tasks',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.check_circle_outline,
//             ),
//             label: 'Done',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.archive_outlined,
//             ),
//             label: 'Archived',
//           ),
//         ],
//       ),
//     );
//   }
//
//   defaultFormField({controller, type, validate, label, prefix}) {}
//
//   Future<String> getName() async
//   {
//     return 'Abdelrhman Samy';
//   }
//
//   void createDatabase() async
//   {
//     var database = await openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database, version) async
//       {
//         print('database created');
//         await database.execute(
//             'CREATE TABLE tasks(id INTEGER PRIMARY KEY (title TEXT, date TEXT, status TEXT)');
//       },
//       onOpen: (database) {
//         print('database opened');
//       },
//     );
//   }
//
//   void insertToDatabase() {
//     var database;
//     database.transaction((txn) {
//       txn.rawInsert(
//         'INSERT INTO TASKS(title, date, time, state) VALUES("first task","0022","555","new")',
//       )
//           .then((value) {
//         print('$value inserted successfully');
//       }).catchError((error) {
//         print('Error when inserting New Record ${error.toString()}');
//       });
//
//       return null;
//     });
//   }
//
//   openDatabase(String s, {int version, Future<Null> Function(database, version)
//   onCreate, Null Function(database)
//   onOpen}) {}
//
// }
