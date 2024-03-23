import 'package:fake_fireman/presentation/bloc/tasks_bloc.dart';
import 'package:fake_fireman/routes/app_router.dart';
import 'package:fake_fireman/routes/pages.dart';
import 'package:fake_fireman/tasks/data/local/data_sources/tasks_data_provider.dart';
import 'package:fake_fireman/tasks/data/repository/task_repository.dart';
import 'package:fake_fireman/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaintenanceScreen extends StatelessWidget {
  final SharedPreferences preferences;

  const MaintenanceScreen({Key? key, required this.preferences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          TaskRepository(taskDataProvider: TaskDataProvider(preferences)),
      child: BlocProvider(
        create: (context) => TasksBloc(context.read<TaskRepository>()),
        child: MaterialApp(
          title: 'Task Manager',
          debugShowCheckedModeBanner: false,
          initialRoute: Pages.initial,
          onGenerateRoute: onGenerateRoute,
          theme: ThemeData(
            fontFamily: 'Sora',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            canvasColor: Colors.transparent,
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}

// Example of how to use this MaintenanceScreen widget in your navigation logic:

// In your bottom navigation bar onTap function:
// case 1:
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => MaintenanceScreen(preferences: preferences)),
//   );
//   break;
