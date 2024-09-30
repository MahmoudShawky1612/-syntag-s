import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Features/Search/Presentation/Manager/Cubit/search_cubit.dart';
import 'package:recipe/Features/Search/Presentation/Manager/Cubit/search_states.dart';
import '../../../Home/Presentation/Views/Widgets/detailed_dish.dart';
import '../../../Home/Presentation/Views/Widgets/back_button.dart';

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
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.4, // Adjust opacity if you want a semi-transparent effect
              child: Image.asset(
                'assets/images/unnamed.png',      // Path to your background image
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                GoBackButton(),
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Type to search...',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8), // Semi-transparent background for the search bar
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      suffixIcon: const Icon(Icons.search),
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
                            final foodItem = state.food;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                tileColor: Colors.black.withOpacity(0.7), // Semi-transparent tile color
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    state.food[index].image,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  state.food[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailedDish(
                                        foodItem: foodItem,
                                        index: index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      } else if (state is ErrorSearchFoodState) {
                        return const Center(child: Text('No Recipes Found....'));
                      } else {
                        return const Center(child: Text('Type to search for recipes'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
