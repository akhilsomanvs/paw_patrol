import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_patrol/data/local/dao/pet_dao.dart';
import 'package:paw_patrol/data/local/db_manager.dart';
import 'package:paw_patrol/data/local/repositories/pet_repository_impl.dart';
import 'package:paw_patrol/style/bloc/theme_bloc.dart';
import 'package:paw_patrol/views/bloc/petAdoptionBloc/pet_adoption_bloc.dart';
import 'package:paw_patrol/views/bloc/petListBloc/pet_list_bloc.dart';
import 'package:paw_patrol/views/screens/details_screen.dart';
import 'package:paw_patrol/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<PetListBloc>(
          create: (BuildContext context) => PetListBloc(PetRepositoryImpl(PetDaoImpl(DBManager.database)))..add(PetListInitialEvent()),
        ),
        BlocProvider<PetAdoptionBloc>(
          create: (BuildContext context) => PetAdoptionBloc(PetRepositoryImpl(PetDaoImpl(DBManager.database)))..add(GetAdoptionListEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, themeData) => MaterialApp(
          title: 'Paw Patrol',
          theme: themeData,
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
