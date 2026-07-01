import 'package:flutter/material.dart';

class RideBooking extends StatelessWidget {
  // const RideBooking({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //     return Scaffold(appBar: AppBar(
    //       automaticallyImplyLeading: false,
    //       toolbarHeight: height * 0.30,
    //       backgroundColor: Colors.pink.shade300,
    //       title: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text('Profile Details', style: TextStyle(
    //     fontWeight: FontWeight.w600,
    //     fontSize: 20,
    //     height: 1.4,
    //     letterSpacing: -0.4,
    //   ),),
    //         Row(children: [
    //           Container(
    //   width: 88,
    //   height: 88,
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //     border: Border.all(
    //       color: Color(0xFFD4DADD),
    //       width: 4,
    //     ),
    //   ),
    //   child: Container(
    //     decoration: const BoxDecoration(
    //       shape: BoxShape.circle,
    //       image: DecorationImage(
    //         image: AssetImage('assets/profile-avatar.jpg'),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    // ),
    //           Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //             Row(
    //               children: [
    //                 Text('Hussain'),
    //                 IconButton(onPressed: (){}, icon: Icon(Icons.mode_edit_outline_outlined))
    //               ],
    //             ),
    //             Text('hussain@gmail.com')
    //           ],)
    //         ],),
    //         OutlinedButton.icon(
    //   onPressed: () {
    //     // Sign out action
    //   },
    //   icon: const Icon(
    //     Icons.logout,
    //     color: Colors.red,
    //     size: 20,
    //   ),
    //   label: const Text(
    //     'Sign Out',
    //     style: TextStyle(
    //       color: Colors.red,
    //       fontSize: 16,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    //   style: OutlinedButton.styleFrom(
    //     minimumSize: const Size(double.infinity, 55),
    //     side: const BorderSide(
    //       color: Colors.red,
    //       width: 1,
    //     ),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(30),
    //     ),
    //   ),
    // )
    //       ],
    //     ),
    //     ));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            // color: Colors.pink.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFFD4DADD), width: 4),
                        image: DecorationImage(
                          image: AssetImage('assets/profile-avatar.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 88,
                      height: 88,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hussain",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.mode_edit_outline_outlined,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "hussain@gmail.com",
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

                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.logout, color: Color(0xFFE40C0C), size: 20,fontWeight: FontWeight.w500,),
                  label: Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Color(0xFFE40C0C),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                    side: const BorderSide(color: Color(0xFFE40C0C), width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
