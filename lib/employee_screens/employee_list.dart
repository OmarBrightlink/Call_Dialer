import 'package:flutter/material.dart';
import '../constants/CustomAppBar.dart';
import '../constants/colors.dart';
import '../constants/gradient_colors.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Employee List',
          showOption: false,
          showAddMeetingAttendance: true,
          showStatusFilter: true,
          showBoxAdd: true),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppGradients.dialerGradient),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: AppColors.lightGrey, width: 1),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: TextField(
                        // controller: searchController,
                        //onChanged: _onSearchTextChanged,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Search",
                          hintStyle: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF8C8C8C),
                              fontFamily: 'Poppins'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15.0),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.search_rounded,
                              size: 24,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white
                    // gradient: const LinearGradient(
                    //   colors: [
                    //     Color(0xFFFFFFFF),
                    //     Color(0xFFF0F0F0),
                    //   ],
                    //   begin: Alignment.bottomCenter,
                    //   end: Alignment.topCenter,
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              const Text(
                                'Omar Mohammad',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    //color: Color(0xFF1D46A4),
                                    color: Colors.black),
                              ),
                              const Spacer(),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  // final employeeId = employee['cId'];
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => CallingList(employeeId),
                                  //   ),
                                  // );
                                },
                                child: const Icon(
                                  Icons.info_outline,
                                  size: 22,
                                  color: AppColors.textTheme,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  // final employeeId = employee['cId'];
                                  // logger.d('employeeId : $employeeId');
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => CallHistory(employeeId),
                                  //   ),
                                  // );
                                },
                                child: const Icon(
                                  Icons.perm_phone_msg_outlined,
                                  size: 22,
                                  color: AppColors.textTheme,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  // final employeeId = employee['cId'];
                                  // logger.d('employeeId : $employeeId');
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ImportCallFile(employeeId),
                                  //   ),
                                  // );
                                },
                                child: const Icon(
                                  Icons.file_download_outlined,
                                  size: 22,
                                  color: AppColors.textTheme,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          color: Color(0xFFD9D9D9),
                          thickness: 1.0,
                          height: 20.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'New Contact',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: Colors.black),
                                ),
                                Center(
                                  child: Text(
                                    '007',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        //color: Color(0xFF1D46A4),
                                        color: AppColors.textTheme),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Qualified',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: Colors.black),
                                ),
                                Text(
                                  '007',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: AppColors.textTheme),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Not Qualified',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: Colors.black),
                                ),
                                Text(
                                  '007',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: AppColors.textTheme),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color(0xFFD9D9D9),
                          thickness: 1.0,
                          height: 20.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Proposal',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: Colors.black),
                                ),
                                Text(
                                  '007',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: AppColors.textTheme),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Follow Up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: Colors.black),
                                ),
                                Text(
                                  '007',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: AppColors.textTheme),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Call Won',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: Colors.black),
                                ),
                                Text(
                                  '007',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      //color: Color(0xFF1D46A4),
                                      color: AppColors.textTheme),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
