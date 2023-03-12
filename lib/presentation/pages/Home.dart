import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asbeza/model/item.dart';

import '../../bloc/item_bloc.dart';
import '../../bloc/item_event.dart';
import '../../bloc/item_state.dart';
import 'cartPage.dart';

class item extends StatefulWidget {
  const item({super.key});

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asbeza'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.account_box,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: Center(
        child: BlocBuilder<itemBloc, itemState>(builder: (context, state) {
          if (state is itemInitialState) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<itemBloc>(context)
                        .add(GetDataButtonPressed());
                  },
                  child: const Text('Get Activity')),
            );
          } else if (state is itemLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is itemFailState) {
            return Text(state.message);
          } else if (state is itemSuccessState) {
            return ListView.builder(
              itemCount: state.activity.length,
              itemBuilder: (BuildContext context, int index) {
                final items = state.activity[index];

                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Row(
                      children: [
                        Center(
                          child: Card(
                            color: Colors.white38,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Image.network(
                                      items.image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .4,
                                                child: Text(
                                                  items.title,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .1,
                                                child: Text(
                                                  '${items.price}', // Replace with actual price
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              ElevatedButton(
                                                onPressed: () {
                                                  BlocProvider.of<itemBloc>(
                                                          context)
                                                      .add(CartHistoryEvent(
                                                          asbeza: items));
                                                  // Implement add to cart functionality
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.green),
                                                child: Text('Add to Cart'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Card(
                        //   color: Colors.white38,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(10.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         SizedBox(

                        //           width:MediaQuery.of(context).size.width*.4,
                        //           child: Image.network(
                        //             items.image,
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //         Center(
                        //           child: Padding(
                        //             padding: const EdgeInsets.all(8.0),
                        //             child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 SizedBox(
                        //                   width: MediaQuery.of(context).size.width* .4,
                        //                   child: Text(
                        //                     items.title,

                        //                     style:
                        //                      TextStyle(fontSize: 18)
                        //                   ,

                        //                   ),
                        //                 ),
                        //                 SizedBox(height: 5),
                        //                 Text(
                        //                   'Description',
                        //                   style: TextStyle(color: Colors.grey),
                        //                 ),
                        //                 SizedBox(height: 5),
                        //                 Text(
                        //                   '\$10.00', // Replace with actual price
                        //                   style: TextStyle(fontSize: 16),
                        //                 ),
                        //                 SizedBox(height: 10),
                        //                 ElevatedButton(
                        //                   onPressed: () {
                        //                     Navigator.push(
                        //                         context,
                        //                         MaterialPageRoute(
                        //                             builder: (context) =>
                        //                                 CartPage()));
                        //                     // Implement add to cart functionality
                        //                   },
                        //                   style: ElevatedButton.styleFrom(
                        //                       primary: Colors.green),
                        //                   child: Text('Add to Cart'),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        }),
      ),
    );
  }
}
