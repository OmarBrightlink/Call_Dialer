import 'package:call_dialer/employee_screens/employee_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/CustomAppBar.dart';
import '../constants/colors.dart';
import '../constants/gradient_colors.dart';
import '../dio/api_service.dart';
import '../dio/dio_client.dart';

class EmployeeHomeNav extends StatefulWidget {
  const EmployeeHomeNav({super.key});

  @override
  State<EmployeeHomeNav> createState() => _EmployeeHomeNavState();
}

class _EmployeeHomeNavState extends State<EmployeeHomeNav> {
  late ApiService apiService;
  final logger = Logger();
  List<Map<String, dynamic>> callDialer = [];
  int selectedDataSetIndex = -1;
  List<ChartSection> chartSections = [];

  @override
  void initState() {
    super.initState();
    apiService = ApiService(DioClient());
    //getCompleted_Total_Lead();
    fetchCallDialer('This Year');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Call dialer',
        addGroup: true,
        onGroupPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EmployeeList(),
            ),
          );
          // if (result == null) {
          //   getGroupList();
          // }
        },
        showOption: false,
      ),
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
                  Card(
                    margin: const EdgeInsets.only(right: 5),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                              "assets/svg/ic_pyramid_lines.svg")),
                    ),
                  ),
                ],
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Card(
                          color: AppColors.dialerIntegrationCard,
                          margin: const EdgeInsets.all(0),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.dialerIntegrationBg,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: AppColors.dialerIntegrationBorder,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      "assets/svg/ic_integration.svg",
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Facebook",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 150,
                                    child: Text(
                                      "Seamless Facebook Integration for Enhanced User Engagement.",
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        child: Card(
                          color: AppColors.indiaMartCard,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.indiaMartBorder,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: AppColors.indiaMartBg,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      "assets/svg/ic_scan.svg",
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "India Mart",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 150,
                                    child: Text(
                                      "Effortless IndiaMART Integration for Streamlined Business Connections.",
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: AppColors.reportCard,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.reportBoarderBorder,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColors.reportBg,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    "assets/svg/ic_report.svg",
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "View Report",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Comprehensive Report View for Informed Decision-Making.",
                                    style: TextStyle(fontSize: 14),
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        child: Card(
                          color: AppColors.downloadCard,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.downloadBorder,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: AppColors.downloadBg,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      "assets/svg/ic_download_building.svg",
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Download",
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 150,
                                    child: Text(
                                      "Quick and Easy Download for Your Convenience",
                                      style: TextStyle(fontSize: 14),
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      color: Color.fromRGBO(219, 216, 216, 1), width: 1),
                ),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                elevation: 5,
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: chartSections
                            .asMap()
                            .map((index, section) {
                              final isSelected = index == selectedDataSetIndex;
                              return MapEntry(
                                index,
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDataSetIndex = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.grey.shade200
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(46),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeInToLinear,
                                          padding: EdgeInsets.all(
                                              isSelected ? 8 : 6),
                                          // width: isSelected ? 14 : 12,
                                          // height: isSelected ? 14 : 12,
                                          decoration: BoxDecoration(
                                            color: section.color,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        AnimatedDefaultTextStyle(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeInToLinear,
                                          style: TextStyle(
                                            color: isSelected
                                                ? section.color
                                                : Colors.black,
                                            fontWeight: isSelected
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            fontSize: isSelected ? 14 : 12,
                                          ),
                                          child: Text(section.status),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                            .values
                            .toList(),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(20),
                        child: PieChart(
                          PieChartData(
                            sections: chartSections.map((section) {
                              final index = chartSections.indexOf(section);
                              return PieChartSectionData(
                                value: section.count,
                                title: section.count.toInt().toString(),
                                color: section.color,
                                radius: selectedDataSetIndex == index ? 50 : 40,
                                titleStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }).toList(),
                            centerSpaceRadius: 50,
                            sectionsSpace: 2,
                            pieTouchData: PieTouchData(
                              touchCallback: (FlTouchEvent event,
                                  PieTouchResponse? response) {
                                if (!event.isInterestedForInteractions ||
                                    response == null) {
                                  return;
                                }

                                final touchedIndex = response
                                    .touchedSection?.touchedSectionIndex;
                                if (touchedIndex != null) {
                                  setState(() {
                                    selectedDataSetIndex = touchedIndex;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>?> fetchCallDialer(String filter) async {
    final jwtToken = await getToken();
    if (jwtToken != null) {
      try {
        final response = await apiService.getCountByStatus(jwtToken, filter);
        logger.d('response : $response');
        if (response.isNotEmpty) {
          setState(() {
            callDialer = response;
            logger.d('call dialer : $callDialer');
            chartSections = response
                .where((item) => item['count'] > 0) // Exclude zero counts
                .map((item) => ChartSection(
                      count: item['count'].toDouble(),
                      status: item['status'],
                      color: getRandomColor(),
                    ))
                .toList();
          });
        }
        return response;
      } catch (e) {
        logger.e(e.toString());
        return null;
      }
    }
    return null;
  }

  Color getRandomColor() {
    return Colors.primaries[chartSections.length % Colors.primaries.length];
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwtToken');
  }
}

class ChartSection {
  final double count;
  final String status;
  final Color color;

  ChartSection({
    required this.count,
    required this.status,
    required this.color,
  });
}
