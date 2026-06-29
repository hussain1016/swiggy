import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RidesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        // backgroundColor: Colors.black,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/appbar-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Hi,Guest 👋",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.red),
                      Text(
                        "Location Unavailable",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE73D4E),
                borderRadius: BorderRadius.circular(25),
              ),
              height: height * 0.13,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Where to?",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF5F6),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      height: height * 0.05,

                      child: Row(
                        children: [
                          SizedBox(width: 10),

                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.red.shade500,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Enter destination",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 12),
            child: Text(
              "Choose your ride",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: vehicleList.length,
            itemBuilder: (context, index) {
              final vehicle = vehicleList[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 5,
                ),
                child: Container(
                  height: height * 0.10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(vehicle.image, height: 70),
                      ),

                      const SizedBox(width: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            vehicle.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          Text(
                            vehicle.subtitle,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, bottom: 12),
            child: Text(
              "Ride Offers",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: RideOffersList.length,
            itemBuilder: (context, index) {
              final offerRide = RideOffersList[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 5,
                ),
                child: Container(
                  height: height * 0.10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            offerRide.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          Text(
                            offerRide.subtitle,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [Text(offerRide.coupen, style: TextStyle())],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class VehicleModel {
  final String image;
  final String title;
  final String subtitle;

  VehicleModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<VehicleModel> vehicleList = [
  VehicleModel(
    image: "assets/auto.jpg",
    title: "Auto Rickshaw",
    subtitle: "Comfortable & affordable",
  ),
  VehicleModel(
    image: "assets/bike.jpg",
    title: "Bike",
    subtitle: "Fastest in traffic,solo rides",
  ),
  VehicleModel(
    image: "assets/taxi.jpg",
    title: "Taxi",
    subtitle: "AC cab forgroups & long trips",
  ),
];

class RideOffersModel {
  final String coupen;
  final String title;
  final String subtitle;

  RideOffersModel({
    required this.coupen,
    required this.title,
    required this.subtitle,
  });
}

List<RideOffersModel> RideOffersList = [
  RideOffersModel(
    coupen: "FIRST50",
    title: "50% OFF on first ride",
    subtitle: "Valid till 28 Feb",
  ),
  RideOffersModel(
    coupen: "FREERIDE",
    title: "FREE ride up to \$100",
    subtitle: "Valid for next 24 hours",
  ),
];
