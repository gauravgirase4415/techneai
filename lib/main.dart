import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/car_view_model.dart';
import 'view/car_details_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homeScreen(),
      ),
    ),
  );
}

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CarViewModel>(context, listen: false);
    return Scaffold(

      appBar: AppBar(title: const Text('Car Master'),
          centerTitle: true,
      ),
      body: FutureBuilder(
        future: viewModel.carData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CarDetailsView(cars: viewModel.cars);
          }
        },
      ),
    );
  }
}

