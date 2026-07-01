// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class RideBooking extends StatefulWidget {
  @override
  State<RideBooking> createState() => _RideBookingState();
}

class _RideBookingState extends State<RideBooking> {
  // const RideBooking({super.key});
  bool isLoggedIn = false;
  String userName = "Hussain";
  String email = "hussain101608@gmail.com";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                // color: Colors.pinkAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFD4DADD),
                              width: 4,
                            ),

                            // image: DecorationImage(
                            //   image: AssetImage('assets/profile-avatar.jpg'),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          // width: 88,
                          // height: 88,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: isLoggedIn
                                ? const AssetImage('assets/profile-avatar.jpg')
                                : null,
                            child: !isLoggedIn
                                ? Icon(
                                    Icons.person_outline,
                                    size: 44,
                                    color: Colors.grey.shade700,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    isLoggedIn ? userName : "Guest User",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (isLoggedIn) ...[
                                    SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.mode_edit_outline_outlined,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              Text(
                                isLoggedIn
                                    ? email
                                    : "Sign in to acess all features",
                                style: TextStyle(
                                  color: const Color(0xFF595959),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    isLoggedIn
                        ? OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                isLoggedIn = !isLoggedIn;
                              });
                            },
                            icon: Icon(
                              Icons.logout,
                              color: Color(0xFFE40C0C),
                              size: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            label: Text(
                              "Sign Out",
                              style: TextStyle(
                                color: Color(0xFFE40C0C),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 55),
                              side: const BorderSide(
                                color: Color(0xFFE40C0C),
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          )
                        : OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                isLoggedIn = !isLoggedIn;
                                print(" 👽👽👽 ${isLoggedIn}");
                              });
                            },
                            label: Text(
                              "Sign In / Create Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFFE40C0C),
                              minimumSize: Size(double.infinity, 55),
                              side: BorderSide(
                                color: Color(0xFFE40C0C),
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (_, _) {
                  return Divider(height: 1, color: Colors.grey.shade300);
                },
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return ListTile(
                    leading: Icon(item.icon, size: 30),
                    title: Text(item.title),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItems {
  final String title;
  final IconData icon;
  MenuItems({required this.title, required this.icon});
}

final List<MenuItems> menuItems = [
  MenuItems(title: 'Manage Address', icon: Icons.location_on_outlined),
  MenuItems(title: 'Booking History', icon: Icons.access_time_outlined),
  MenuItems(
    title: 'Wallet & Payments',
    icon: Icons.account_balance_wallet_outlined,
  ),
];
