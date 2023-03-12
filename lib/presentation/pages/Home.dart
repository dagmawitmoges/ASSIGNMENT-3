import 'package:asbeza/presentation/pages/profile.dart';
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
  int _count = 1;

  void _increment(){
    setState((){
      _count++;
    });
  }

  void _decrement(){
    if(_count < 2){
      return;
    }
    setState(() {
      _count--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asbeza'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white24,
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white24),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(Icons.person_2_outlined),
            label: Text('Profile'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white24),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            icon: Icon(Icons.shopping_bag_outlined),
            label: Text('Cart'),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<itemBloc, itemState>(builder: (context, state) {
          if (state is itemInitialState) {
            return Column(
              children: [
                Image.network(
                    'https://media.istockphoto.com/id/1224326999/photo/pepper-bag-full-of-groceries.jpg?s=612x612&w=0&k=20&c=TAiEPlrW85SMUv3tL0YB8FGKytOlxlc1OdilADMvUVM='),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50,30,0,0),
                      child: Text('Go crazy over our insanely affordable prices.',style: TextStyle(fontSize: 40,fontWeight:FontWeight.bold),),
                    ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white30,
                          fixedSize: Size(320, 80)),
                      onPressed: () {
                        BlocProvider.of<itemBloc>(context)
                            .add(GetDataButtonPressed());
                      },
                      child: const Text('Get Your Asbeza')),
                ),
              ],
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
                          child: SizedBox(
                            child: Card(
                              color: Colors.white38,
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                     width: MediaQuery.of(context).size.width*.4,
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
                                                Column(
                                                  children: [
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
                                                 Row(
                                                   children: [
                                                     IconButton(onPressed: (() {
                                    _decrement();
                                  }), icon: const Icon(Icons.remove_circle), color: Colors.green, iconSize: 30,),
                                                  Text("${_count}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                  ),IconButton(onPressed: (() {
                                    _increment();
                                  }), 
                                  icon: const Icon(Icons.add_circle), 
                                  color: Colors.green, iconSize: 30,),

                                   ],
                                                 ),
                                   
                                  
                                   ],
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
                        ),
                       
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
