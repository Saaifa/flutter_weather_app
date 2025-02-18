import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/data/repositories/weather_repository.dart';
import 'package:flutter_weather_app/data/source/weather_api_service.dart';
import 'package:flutter_weather_app/domain/repository/location_repository.dart';
import 'package:flutter_weather_app/domain/usecase/place_detail_use_case.dart';
import 'package:flutter_weather_app/domain/usecase/search_location_use_case.dart';
import 'package:flutter_weather_app/presentation/bloc/cubit/location_cubit.dart';
import 'package:flutter_weather_app/presentation/bloc/cubit/weather_cubit.dart';
import 'package:flutter_weather_app/presentation/pages/home_screen.dart';

import 'data/repositories/location_repository.dart';
import 'data/source/google_place_api_service.dart';

void main() {

  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key,});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final WeatherRepository weatherRepository = ;
  final SearchLocationUseCase searchLocationUseCase = SearchLocationUseCase(LocationRepositoryImpl(GooglePlaceApiService(Dio())));
  final PlaceDetailUseCase placeDetailUseCase = PlaceDetailUseCase(LocationRepositoryImpl(GooglePlaceApiService(Dio())));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              WeatherCubit(repository: WeatherRepository(WeatherApiService())),
        ),
        BlocProvider(
          create: (context) => LocationCubit(searchLocationUseCase, placeDetailUseCase),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   // This is the theme of your application.
        //   //
        //   // TRY THIS: Try running your application with "flutter run". You'll see
        //   // the application has a purple toolbar. Then, without quitting the app,
        //   // try changing the seedColor in the colorScheme below to Colors.green
        //   // and then invoke "hot reload" (save your changes or press the "hot
        //   // reload" button in a Flutter-supported IDE, or press "r" if you used
        //   // the command line to start the app).
        //   //
        //   // Notice that the counter didn't reset back to zero; the application
        //   // state is not lost during the reload. To reset the state, use hot
        //   // restart instead.
        //   //
        //   // This works for code too, not just values: Most code changes can be
        //   // tested with just a hot reload.
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        home: HomeScreen(),
      ),
    );
  }
}

