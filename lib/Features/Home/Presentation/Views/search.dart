import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/search_cubit.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/search_states.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void search(String query) {
    if (query.isNotEmpty) {
      context.read<SearchFoodCubit>().searchFood(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipes'),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Type to search...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: search,
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchFoodCubit, SearchFoodStates>(
              builder: (context, state) {
                if (state is LoadingSearchFoodState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SuccessSearchFoodState) {
                  if (state.food.isEmpty) {
                    return const Center(child: Text('No food results found.'));
                  }
                  return ListView.builder(
                    itemCount: state.food.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                          state.food[index].image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(state.food[index].name),
                        onTap: () {
                          // Handle the recipe selection here
                        },
                      );
                    },
                  );
                } else if (state is ErrorSearchFoodState) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('Unexpected state!'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
