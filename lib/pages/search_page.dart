// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Search a City',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                blocProviderCalling(data, context);
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                label: const Text(
                  'search',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 30),
                ),
                suffixIcon: GestureDetector(
                    onTap: () {
                      blocProviderCalling(cityName!, context);
                    },
                    child: const Icon(Icons.search)),
                border: const OutlineInputBorder(),
                hintText: 'Enter a city',
                hintStyle:
                    const TextStyle(color: Colors.blueGrey, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void blocProviderCalling(String data, BuildContext context) {
    cityName = data;

    BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
    BlocProvider.of<WeatherCubit>(context).cityName = cityName;

    Navigator.pop(context);
  }
}
