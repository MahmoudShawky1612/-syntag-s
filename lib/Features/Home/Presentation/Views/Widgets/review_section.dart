// lib/Features/Home/Presentation/Views/Widgets/review_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/Features/Home/Data/Model/food_model.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/rate_cubit.dart';
import 'package:recipe/Features/Home/Presentation/Manager/Cubit/rate_states.dart';

class ReviewSection extends StatefulWidget {
  final List<FoodItem> foodItem;
  final int index;

  const ReviewSection({super.key, required this.foodItem, required this.index});

  @override
  _ReviewSectionState createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final TextEditingController _ratingController = TextEditingController();

  Future<void> _submitRating() async {
    final rating = int.tryParse(_ratingController.text);
    if (rating != null && rating > 0 && rating <= 5) {
      try {
        await context.read<RateCubit>().rateFood(widget.foodItem[widget.index].id, rating);

        _ratingController.clear();

      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting rating: $error')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid rating (1-5)')),
      );
    }
  }

  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStars;

    return Row(
      children: [
        ...List.generate(fullStars, (index) => const Icon(Icons.star, color: Colors.amber)),
        ...List.generate(halfStars, (index) => const Icon(Icons.star_half, color: Colors.amber)),
        ...List.generate(emptyStars, (index) => const Icon(Icons.star_border, color: Colors.amber)),
      ],
    );
  }

  Widget _buildPreviousRatings(List<int> previousRatings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: previousRatings.map((rating) {
        return Row(
          children: [
            _buildStarRating(rating.toDouble()),
            const SizedBox(width: 8),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RateCubit, RateStates>(
      listener: (context, state) {
        if (state is SuccessRateState) {
          setState(() {
            widget.foodItem[widget.index] = state.food.first;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Average Rating:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildStarRating(widget.foodItem[widget.index].averagerating),
            const SizedBox(height: 20),
            const Text(
              'Previous Ratings:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildPreviousRatings(widget.foodItem[widget.index].rates),
            const SizedBox(height: 10),
            TextField(
              controller: _ratingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Add your rating (1-5)',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _submitRating,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}