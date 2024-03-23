import 'package:fake_fireman/model/task_model.dart';
import 'package:fake_fireman/presentation/page/new_task_screen.dart';
import 'package:fake_fireman/presentation/page/task_screen.dart';
import 'package:fake_fireman/presentation/page/update_task_screen.dart';
import 'package:fake_fireman/routes/pages.dart';
import 'package:fake_fireman/splash_screen.dart';
import 'package:flutter/material.dart';
import '../page_not_found.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Pages.initial:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Pages.home:
      return MaterialPageRoute(
        builder: (context) => const TasksScreen(),
      );
    case Pages.createNewTask:
      return MaterialPageRoute(
        builder: (context) => const NewTaskScreen(),
      );
    case Pages.updateTask:
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}
