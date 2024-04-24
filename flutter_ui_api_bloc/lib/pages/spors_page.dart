import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/spors_bloc/spors_bloc.dart';

@RoutePage()
class SporsPage extends StatelessWidget {
  const SporsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _sporsBloc = BlocProvider.of<SporsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("League"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: () =>
                      _sporsBloc.add(const FetchSporsEvent(league: "super-lig")),
                  child: const Text("Team List")),
                  ElevatedButton(
                  onPressed: () =>
                      _sporsBloc.add(SporsIniEvent()),
                  child: const Text("Clear Page")),
            ],
          ),
          BlocBuilder<SporsBloc, SporsState>(
            builder: (context, state) {
              if (state is SporsLoadedState) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.teams!.result.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(state.teams?.result[index]["team"]),
                          subtitle: Text(state.teams!.result[index]["rank"].toString()),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is SporsLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is SporsInitial) {
                return const Center(
                  child: Text("Click Button"),
                );
              } else {
                return const Text("Error");
              }
            },
          ),
        ],
      ),
    );
  }
}
