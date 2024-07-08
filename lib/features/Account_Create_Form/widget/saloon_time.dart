// ignore_for_file: must_be_immutable, annotate_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_admin_plan/constants/global_variable.dart';

import 'package:samay_admin_plan/utility/dimenison.dart';

class SalonTimeSection extends StatefulWidget {
  TextEditingController openController;
  TextEditingController closeController;
  SalonTimeSection(
      {Key? key, required this.openController, required this.closeController})
      : super(key: key);

  @override
  State<SalonTimeSection> createState() => _SalonTimeSectionState();
}

class _SalonTimeSectionState extends State<SalonTimeSection> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize the openController with the current time if it's empty
    if (widget.openController.text.isEmpty) {
      widget.openController.text = _formatTimeOfDay(TimeOfDay.now());
    }
    // Initialize the closingController with the current time if it's empty
    if (widget.closeController.text.isEmpty) {
      widget.closeController.text = _formatTimeOfDay(TimeOfDay.now());
    }
  }

  // Format TimeOfDay to a string with hours, minutes, and seconds in AM/PM format
  String _formatTimeOfDay(TimeOfDay time) {
    final hours = time.hourOfPeriod == 0
        ? 12
        : time.hourOfPeriod; // Convert hour 0 to 12 for 12 AM/PM
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hours.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')} $period';
  }

  // Show TimePicker and update the controller
  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = _formatTimeOfDay(picked);
      });
    }
  }

//!-------------------------------------------
// Function for selection current Time
  TimeOfDay _selectedTimeOpen = TimeOfDay(hour: 9, minute: 0);

  //Function for set time
  Future<void> _selectTimesOpen(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTimeOpen);
    if (picked != null && picked != _selectedTimeOpen) {
      setState(() {
        _selectedTimeOpen = picked;
        GlobalVariable.OpenTime = _selectedTimeOpen;
      });
    }
  }

// Function for selection current Time
  TimeOfDay _selectedTimeClose = TimeOfDay(hour: 9, minute: 0);

  //Function for set time
  Future<void> _selectTimesClose(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTimeClose);
    if (picked != null && picked != _selectedTimeClose) {
      setState(() {
        _selectedTimeClose = picked;
        GlobalVariable.CloseTime = _selectedTimeClose;
      });
    }
  }

  Widget build(BuildContext context) {
    // final globalVariables = Provider.of<GlobalVariables>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select the timing of salon. ",
          style: TextStyle(
            color: Colors.black,
            fontSize: Dimensions.dimenisonNo16,
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
        ),
        SizedBox(
          height: Dimensions.dimenisonNo5,
        ),
        Padding(
          padding: EdgeInsets.only(left: Dimensions.dimenisonNo16),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Opening Time ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo16,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.dimenisonNo20),
                    child: Icon(
                      CupertinoIcons.stopwatch,
                      size: Dimensions.dimenisonNo16,
                    ),
                  ),
                  Container(
                    width: Dimensions.dimenisonNo100,
                    height: Dimensions.dimenisonNo30,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEEEFF3),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.black),
                        borderRadius:
                            BorderRadius.circular(Dimensions.dimenisonNo5),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        _selectTimesOpen(context).then((value) {
                          return null;
                        });
                      },
                      child: Center(
                        child: Text(
                          _selectedTimeOpen.format(context),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.dimenisonNo16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // TextFormField(
                    //   controller: widget.openController,
                    //   readOnly: true,
                    //   onTap: () {
                    //     setState(() {
                    //       _selectTime(context, widget.openController)
                    //           .then((value) {
                    //         Provider.of<GlobalVariables>(context, listen: false)
                    //             .setOpeningTime(
                    //                 "${widget.openController.text}");

                    //         //           GlobalVariable.openTimeGlo =
                    //         //               ;
                    //       });
                    //     });
                    //   },
                    //   // onTap: () => _selectTime(context),
                    //   cursorHeight: Dimensions.dimenisonNo16,
                    //   style: TextStyle(fontSize: Dimensions.dimenisonNo12),
                    //   keyboardType: TextInputType.phone,
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.symmetric(
                    //         horizontal: Dimensions.dimenisonNo10,
                    //         vertical: Dimensions.dimenisonNo10),
                    //     border: OutlineInputBorder(
                    //       borderRadius:
                    //           BorderRadius.circular(Dimensions.dimenisonNo16),
                    //     ),
                    //   ),
                    //   validator: (val) {
                    //     if (val == null || val.isEmpty) {
                    //       return 'Enter your Time';
                    //     }
                    //     return null;
                    //   },
                    // ),
                  ),
                  Text(GlobalVariable.OpenTime.format(context).toString())
                ],
              ),
              SizedBox(
                height: Dimensions.dimenisonNo10,
              ),
              Row(
                children: [
                  Text(
                    'Closing Time  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.dimenisonNo16,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.dimenisonNo22,
                  ),
                  Icon(
                    CupertinoIcons.stopwatch,
                    size: Dimensions.dimenisonNo16,
                  ),
                  SizedBox(
                    width: Dimensions.dimenisonNo20,
                  ),
                  Container(
                    width: Dimensions.dimenisonNo100,
                    height: Dimensions.dimenisonNo30,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEEEFF3),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.black),
                        borderRadius:
                            BorderRadius.circular(Dimensions.dimenisonNo5),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        _selectTimesClose(context);
                      },
                      child: Center(
                        child: Text(
                          _selectedTimeClose.format(context),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.dimenisonNo16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
