import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../response_model/car_response_model.dart';

class CarDetailsView extends StatelessWidget {
  final List<Car> cars;

  const CarDetailsView({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white10,
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Add More"),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    margin: const EdgeInsets.all(16.0),
                    elevation: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Car RC Number: ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 8.0),
                                      Text('Car name:',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                      Text('Model:',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 8.0),
                                      Text('Capacity:',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 8.0),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(car.rcNumber,
                                          style:
                                          const TextStyle(fontSize: 16.0)),
                                      Text(car.model,
                                          style:
                                          const TextStyle(fontSize: 16.0)),
                                      Text(car.model,
                                          style:
                                          const TextStyle(fontSize: 16.0)),
                                      Text(car.capacity.toString(),
                                          style:
                                          const TextStyle(fontSize: 16.0)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 8.0),
                              const Text('Attachments:',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5.0),
                              for (var i = 0; i < car.attachments.length; i++)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('${i + 1}:',
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 8.0),
                                        Text(car.attachments[i].attachmentType,
                                            style: const TextStyle(
                                                fontSize: 14.0)),
                                      ],
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                              itemCount: car.attachments.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Card(
                                    elevation: 2,
                                    child: Image.network(
                                      car.attachments[index].attachmentUrls[0],
                                      fit: BoxFit.contain,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                .expectedTotalBytes !=
                                                null
                                                ? loadingProgress
                                                .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 8.0),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}