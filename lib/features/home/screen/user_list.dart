import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/features/Calender/screen/calender.dart';
import 'package:samay_admin_plan/features/home/widget/user_booking.dart';
import 'package:samay_admin_plan/models/salon_form_models/salon_infor_model.dart';
import 'package:samay_admin_plan/models/user_order/user_order_model.dart';
import 'package:samay_admin_plan/provider/booking_provider.dart';
import 'package:samay_admin_plan/utility/dimenison.dart';
import 'package:samay_admin_plan/widget/add_button.dart';

class UserList extends StatefulWidget {
  final SalonModel salonModel;

  const UserList({
    Key? key,
    required this.salonModel,
  }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  DateTime _currentDate = DateTime.now(); // Track the currently selected date
  final TextEditingController _dateController =
      TextEditingController(); // Controller for date input field
  bool _showCalendar = false; // Toggle to show/hide calendar

  @override
  void initState() {
    super.initState();
    // Initialize the date controller with the current date
    _dateController.text = DateFormat('dd MMMM').format(_currentDate);
    _fetchBookings(); // Fetch initial bookings on load
  }

  // Function to format the date for display
  String _formatDate(DateTime date) {
    DateTime today = DateTime.now();
    DateTime tomorrow = today.add(const Duration(days: 1));
    DateTime yesterday = today.subtract(const Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    } else {
      return DateFormat('d MMMM').format(date);
    }
  }

  Future<void> _fetchBookings() async {
    try {
      await Provider.of<BookingProvider>(context, listen: false)
          .getBookingListPro(_currentDate)
          .timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Fetching bookings timed out.");
      });
    } catch (e) {
      print('Error in fetching bookings: $e');
    }
  }

  // Function to decrease the date by one day
  void _decrementDate() {
    setState(() {
      _currentDate = _currentDate.subtract(const Duration(days: 1));
      _updateDateController();
      _fetchBookings(); // Fetch bookings after date change
      print("_decrementDate");
    });
  }

  // Function to increase the date by one day
  void _incrementDate() {
    setState(() {
      _currentDate = _currentDate.add(const Duration(days: 1));
      _updateDateController();
      _fetchBookings(); // Fetch bookings after date change
      print("_incrementDate");
    });
  }

  // Function to update the date controller text field
  void _updateDateController() {
    _dateController.text = DateFormat('dd MMMM').format(_currentDate);
  }

  @override
  Widget build(BuildContext context) {
    // BookingProvider bookingProvider = Provider.of<BookingProvider>(context);
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.dimenisonNo16,
                right: Dimensions.dimenisonNo16,
                top: Dimensions.dimenisonNo10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: Dimensions.dimenisonNo10),
                  _formatDate(_currentDate) == 'Today' ||
                          _formatDate(_currentDate) == 'Tomorrow' ||
                          _formatDate(_currentDate) == 'Yesterday'
                      ? SizedBox(
                          width: Dimensions.dimenisonNo100,
                          child: Text(
                            _formatDate(_currentDate),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.dimenisonNo16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : SizedBox(
                          width: Dimensions.dimenisonNo50,
                        ),

                  // Decrease date button
                  GestureDetector(
                    onTap: _decrementDate,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF4B4B4B),
                        borderRadius:
                            BorderRadius.circular(Dimensions.dimenisonNo5),
                      ),
                      child: const Icon(
                        Icons.arrow_left_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.dimenisonNo10),
                  // Increase date button
                  GestureDetector(
                    onTap: _incrementDate,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF4B4B4B),
                        borderRadius:
                            BorderRadius.circular(Dimensions.dimenisonNo5),
                      ),
                      child: const Icon(
                        Icons.arrow_right_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.dimenisonNo12),
                  // Date input field
                  SizedBox(
                    width: Dimensions.dimenisonNo110,
                    child: Center(
                      child: TextField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () {
                          setState(() {
                            _showCalendar = !_showCalendar;
                          });
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.dimenisonNo16,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none, // Add this line
                          enabledBorder: InputBorder.none, // Add this line
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: Dimensions.dimenisonNo12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Toggle calendar visibility
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _showCalendar = !_showCalendar;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                  ),
                  Text(widget.salonModel.name ??
                      'Salon Name'), // Safely handle null
                  const Spacer(),
                  AddButton(text: "Add Appointment", onTap: () {}),
                ],
              ),
            ),
            const Divider(thickness: 5),
            // List of users (mock data for now)
            Padding(
              padding: EdgeInsets.all(Dimensions.dimenisonNo16),
              child: FutureBuilder(
                  future: _fetchBookings(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                          child:
                              Text("Error fetching orders: ${snapshot.error}"));
                    }

                    return Consumer<BookingProvider>(
                        builder: (context, bookingProvider, value) {
                      if (bookingProvider.getBookingList.isEmpty) {
                        return const Center(
                            child:
                                Text("No orders found for the selected date"));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: bookingProvider.getBookingList.length,
                        itemBuilder: (context, index) {
                          OrderModel orderModel =
                              bookingProvider.getBookingList[index];
                          return Column(
                            children: [
                              UserBookingTap(
                                orderModel: orderModel,
                              ), // Safely handle null
                            ],
                          );
                        },
                      );
                    });
                  }),
            ),
          ],
        ),
        // Calendar visibility toggle
        if (_showCalendar)
          Positioned(
            top: 100,
            left: 100,
            child: SizedBox(
              height: 400,
              width: 360,
              child: CustomCalendar(
                salonModel: widget.salonModel,
                controller: _dateController,
                initialDate: _currentDate,
                onDateChanged: (selectedDate) {
                  setState(() {
                    _currentDate = selectedDate;
                    _updateDateController();
                    _fetchBookings(); // Fetch bookings after calendar date change

                    print("_showCalendar");
                  });
                },
              ),
            ),
          ),
      ],
    );
  }
}