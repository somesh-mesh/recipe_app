import 'package:demo_flutter/model/response_model/search_data_model.dart';
import 'package:demo_flutter/screens/search_recipe/search_recipe_cubit.dart';
import 'package:demo_flutter/utils/constant_strings.dart';
import 'package:demo_flutter/utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchRecipe extends StatefulWidget {
  String? searchKeyWord;

  SearchRecipe({super.key, this.searchKeyWord});

  @override
  State<SearchRecipe> createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  List<Recipe>? results;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    //  context.read<SearchRecipeCubit>().getSearchedData(widget.searchKeyWord);
    context
        .read<SearchRecipeCubit>()
        .complexSearchMethod(query: widget.searchKeyWord.toString())
        .then((value) => {
              setState(() {
                results = value.results;
                isLoading = false;
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchRecipeCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(ConstantString.recipeDetails),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<SearchRecipeCubit, SearchRecipeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else {
            return results?.isEmpty ?? true
                ? _buildNoDataFound()
                : _buildRecipeList();
          }
        },
      ),
    );
  }

  Widget _buildNoDataFound() {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          ConstantString.noDataFound,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeList() {
    return ListView.builder(
      itemCount: results?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouterName.recipeDetails,
                arguments: results?[index].id);
          },
          child: Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  results?[index].image.toString() ?? "",
                  height: 150.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    results?[index].title.toString() ?? "",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
