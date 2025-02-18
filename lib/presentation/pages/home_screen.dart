import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/presentation/bloc/cubit/location_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _cityDetailController = TextEditingController();
  List<dynamic> predictionResponse = [];
  dynamic placeDetailsResponse = {};
  var city = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if(state is LocationSuccess){
          setState(() {
            predictionResponse = state.response;
            print("$predictionResponse");
          });
        }
        if(state is PlaceDetailSuccess){
          setState(() {
            placeDetailsResponse = state.response;
            _cityDetailController.text = city;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Weather App",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          body: SafeArea(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                    ),
                    padding:
                    const EdgeInsets.only(left: 5.0, right: 2.0, top: 10.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {

                        print("object check lllll:  $value");
                        if (value.isNotEmpty) {
                          context.read<LocationCubit>()
                              .placeAutoComplete(value);
                        } else {
                          predictionResponse = [];
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide
                              .none,
                              borderRadius: BorderRadius.circular(10.0)),
                          prefixIcon: Icon(Icons.search),
                          labelText: "Search here",
                          labelStyle: TextStyle(color: Colors.black)
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  if(predictionResponse.isNotEmpty && _searchController.text.isNotEmpty)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15),
                      child: Column(
                        children: placeDetailsResponse.map(
                              (location) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: TextButton(
                                onPressed: () {
                                  // _showBottomSheet(context);
                                  // PlaceDetails(location["place_id"]);
                                  context.read<LocationCubit>().getPlaceDetails(location['place_id']);
                                  predictionResponse = location["description"];
                                  // Logger.getInstance().logInfo("onPressLogger", "$location");
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    // showSuggestedPlace = true;
                                  });
                                },
                                child: Text(
                                  "${location["description"]}",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_weather_app/presentation/bloc/cubit/weather_cubit.dart';
// import 'package:flutter_weather_app/presentation/widget/weather_card.dart';
//
// class WeatherScreen extends StatefulWidget {
//   @override
//   _WeatherScreenState createState() => _WeatherScreenState();
// }
//
// class _WeatherScreenState extends State<WeatherScreen> {
//   final TextEditingController _cityController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Weather App")),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _cityController,
//               decoration: InputDecoration(
//                 hintText: "Enter city name",
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     final city = _cityController.text;
//                     if (city.isNotEmpty) {
//                       context.read<WeatherCubit>().fetchWeather();
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: BlocBuilder<WeatherCubit, WeatherState>(
//               builder: (context, state) {
//                 if (state is WeatherLoading) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (state is WeatherLoaded) {
//                   return WeatherCard(weather: state.weather);
//                 } else if (state is WeatherError) {
//                   return Center(child: Text(state.message));
//                 }
//                 return Center(child: Text("Enter a city name"));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
