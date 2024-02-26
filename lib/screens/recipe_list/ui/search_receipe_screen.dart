import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_flutter/model/local_db/data_base_helper.dart';
import 'package:demo_flutter/screens/recipe_list/ui/search_receipe_screen_cubit.dart';
import 'package:demo_flutter/utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRecipeListScreen extends StatefulWidget {
  final DatabaseHelper databaseHelper; // Add DatabaseHelper as a parameter

  const SearchRecipeListScreen({Key? key, required this.databaseHelper}) : super(key: key);

  @override
  State<SearchRecipeListScreen> createState() => _SearchRecipeListScreenState();
}

class _SearchRecipeListScreenState extends State<SearchRecipeListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // Pass the databaseHelper to SearchReceipeScreenCubit
    context.read<SearchReceipeScreenCubit>().initDatabase(widget.databaseHelper);
    context.read<SearchReceipeScreenCubit>().getReciepeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchReceipeScreenCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Beautiful Search List'),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<SearchReceipeScreenCubit, SearchReceipeScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is SearchReceipeScreenLoading
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
              : WillPopScope(
            onWillPop: _onWillPop,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.green),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouterName.searchRecipe,
                              arguments: _searchController.text);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.results?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToRecipeDetailsScreen(
                              cubit.results?[index].id);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        cubit.results?[index].image ?? ""),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cubit.results?[index].title ?? "",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> navigateToRecipeDetailsScreen(int? recipeId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showConnectivitySnackBar('No Internet Connection', Colors.red);
    } else {
      Navigator.pushNamed(context, RouterName.recipeDetails,
          arguments: recipeId);
    }
  }

  Future<bool> _onWillPop() async {
    showConnectivitySnackBar('Press again to exit', Colors.red);
    await Future.delayed(const Duration(seconds: 2));
    return false;
  }

  void showConnectivitySnackBar(String message, Color backgroundColor) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
