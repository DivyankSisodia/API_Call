import 'package:blocapicall/bloc/user_bloc.dart';
import 'package:blocapicall/repos/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<Repos>(context),
      )..add(LaodUserEvent()), // Corrected the event name here
      child: Scaffold( 
        appBar: AppBar(
          title: const Text("Bloc Api Call"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoaded) {
              return Center(child: Text('Data is loaded'));
            }
            if (state is UserError) {
              return Center(child: Text(state.message));
            }
            return const Center();
          },
        ),
      ),
    );
  }
}
