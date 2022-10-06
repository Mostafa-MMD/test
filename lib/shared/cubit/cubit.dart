import 'package:eng_abdallah/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/todo_app/archived_tasks/archived_tasks.dart';
import '../../modules/todo_app/done_tasks/done_tasks.dart';
import '../../modules/todo_app/new_tasks/new_tasks.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavbarState());
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  void createDataBase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, Status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('error when created ${error.toString()}');
        });
      },
      onOpen: (database) {
        getData(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  insertDataBase({
    @required String title,
    @required String time,
    @required String date,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES ("$title", "$date", "$time", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getData(database);
      }).catchError((error) {
        print('when database inserting new record ${error.toString()}');
      });
      return null;
    });
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  void getData(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT *FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });
      emit(AppGetDatabaseState());
    });
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  void updateData({
    @required String status,
    @required int id,
  }) async {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      getData(database);
      emit(AppUpdateDatabaseState());
    });
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<int> deleteData({
    @required int id,
  }) async {
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],
    ).then((value) {
      emit(AppDeleteDatabaseState());
    });
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}
