import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'gradient_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showMoreMenuBtn;
  final bool showBackButton;
  final bool showImportFile;
  final bool showExportFile;
  final bool showStatusFilter;
  final bool leadReport;
  final bool addGroup;
  final bool showBoxAdd;
  final bool showOption;
  final bool showShareByOwn;
  final GlobalKey? filterKey;
  final bool showAllCheck;
  final bool showAccountConvert;
  final bool showCancel;
  final bool showShareAll;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onExportCallback;
  final VoidCallback? onGroupPressed;
  final VoidCallback? onFilterPressed;
  final VoidCallback? onImportPressed;
  final VoidCallback? onCheckAllPressed;
  final VoidCallback? onCancelPressed;
  final VoidCallback? onAccountConvertPressed;
  final VoidCallback? onMoreMenuPressedCall;
  final VoidCallback? onShareAllPressed;
  final VoidCallback? onShowByOwnCallBack;
  final VoidCallback? onLeadReportCall;
  final VoidCallback? onAddBox;
  final bool showAddMeetingAttendance;
  final VoidCallback? onAddMeetAttendancePressed;
  final bool showTimeline;
  final bool showFilter;
  final bool showSearchIcon;
  final bool showExpense;
  final bool showMapType;
  final bool showPlayBtn;
  final bool showAddLabel;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showImportFile = false,
    this.showExportFile = false,
    this.showStatusFilter = false,
    this.showOption = true,
    this.onExportCallback,
    this.showAllCheck = false,
    this.showAccountConvert = false,
    this.showCancel = false,
    this.showShareAll = false,
    this.onImportPressed,
    this.onCheckAllPressed,
    this.onCancelPressed,
    this.onAccountConvertPressed,
    this.onShareAllPressed,
    this.showAddMeetingAttendance = false,
    this.onAddMeetAttendancePressed,
    this.showTimeline = false,
    this.showFilter = false,
    this.showSearchIcon = false,
    this.onSearchChanged,
    this.showExpense = false,
    this.showMapType = false,
    this.showPlayBtn = false,
    this.showAddLabel = false,
    this.showMoreMenuBtn = false,
    this.onMoreMenuPressedCall,
    this.onFilterPressed,
    this.filterKey,
    this.showShareByOwn = false,
    this.onShowByOwnCallBack,
    this.leadReport = false,
    this.onLeadReportCall,
    this.addGroup = false,
    this.onGroupPressed,
    this.showBoxAdd = false,
    this.onAddBox,
  });

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool showSearch = false;
  final TextEditingController searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      showSearch = !showSearch;
      if (!showSearch) searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.dialerGradient,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        // Use your gradient here if needed
        title: showSearch
            ? _buildSearchBar()
            : Text(widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins')),
        centerTitle: false,
        leading: widget.showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context, null);
                },
              )
            : null,
        actions: [
          if (widget.showSearchIcon && !showSearch)
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: _toggleSearch,
            ),
          if (showSearch)
            IconButton(
              icon: const Icon(Icons.close),
              color: Colors.white,
              onPressed: _toggleSearch,
            ),
          if (widget.showImportFile)
            IconButton(
              icon: const Icon(Icons.file_download),
              color: Colors.white,
              onPressed: () {
                widget.onImportPressed!();
              },
            ),
          if (widget.showExportFile)
            IconButton(
              icon: const Icon(Icons.file_upload),
              color: Colors.white,
              onPressed: () {
                //if(widget.onExportCallback != null) {
                widget.onExportCallback!();
                // }else{
                //Toasty(context).showError('CallBack is Null');
                //}
              },
            ),
          if (widget.showBoxAdd)
            IconButton(
              icon: SvgPicture.asset('assets/svg/ic_box_add.svg'),
              color: Colors.white,
              onPressed: () {
                widget.onAddBox!();
              },
            ),
          if (widget.showStatusFilter)
            IconButton(
              icon: const Icon(Icons.filter_list),
              color: Colors.white,
              onPressed: () {
                // Add your onPressed action here
              },
            ),
          if (widget.showAccountConvert)
            IconButton(
              icon: SvgPicture.asset('assets/svg/account-convert.svg'),
              color: Colors.white,
              onPressed: () {
                widget.onAccountConvertPressed!();
              },
            ),
          if (widget.showMoreMenuBtn)
            IconButton(
              icon: SvgPicture.asset('assets/svg/more_menu.svg'),
              iconSize: 0,
              padding: EdgeInsets.all(0),
              color: Colors.white,
              onPressed: () {
                widget.onMoreMenuPressedCall!();
              },
            ),
          if (widget.showShareAll)
            IconButton(
              icon: SvgPicture.asset('assets/svg/share_windows.svg'),
              color: Colors.white,
              onPressed: () {
                widget.onShareAllPressed!();
              },
            ),
          if (widget.showAllCheck)
            IconButton(
              icon: SvgPicture.asset('assets/svg/all_check.svg'),
              color: Colors.white,
              onPressed: () {
                print('all items are checked');
                widget.onCheckAllPressed!();
              },
            ),
          if (widget.showCancel)
            IconButton(
              icon: SvgPicture.asset('assets/svg/cancel.svg'),
              color: Colors.white,
              onPressed: () {
                widget.onCancelPressed!();
              },
            ),
          if (widget.showAddMeetingAttendance)
            IconButton(
              icon: const Icon(Icons.add_circle),
              color: Colors.white,
              onPressed: () {
                widget.onAddMeetAttendancePressed!();
              },
            ),
          if (widget.showTimeline)
            IconButton(
              icon: const Icon(Icons.view_timeline),
              color: Colors.white,
              onPressed: () {
                widget.onAddMeetAttendancePressed!();
              },
            ),
          if (widget.showFilter)
            IconButton(
              key: widget.filterKey,
              icon: const Icon(Icons.filter_alt_rounded),
              color: Colors.white,
              onPressed: () {
                widget.onFilterPressed!();
              },
            ),
          if (widget.showShareByOwn)
            IconButton(
              iconSize: 30,
              icon: SvgPicture.asset(
                'assets/svg/ic_share_by_own.svg',
                width: 20,
                height: 20,
              ),
              color: Colors.white,
              onPressed: () {
                widget.onShowByOwnCallBack!();
              },
            ),
          if (widget.leadReport)
            IconButton(
              icon: SvgPicture.asset('assets/svg/ic_lead_report.svg',
                  width: 28, height: 28),
              color: Colors.white,
              onPressed: () {
                widget.onLeadReportCall!();
              },
            ),
          if (widget.showOption)
            IconButton(
              icon: const Icon(Icons.more_vert),
              color: Colors.white,
              onPressed: () {
                // Add your onPressed action here
              },
            ),
          if (widget.addGroup)
            IconButton(
              iconSize: 30,
              icon: SvgPicture.asset(
                'assets/svg/ic_add_group.svg',
                width: 20,
                height: 20,
              ),
              color: Colors.white,
              onPressed: () {
                widget.onGroupPressed!();
              },
            ),
          if (widget.showMapType)
            IconButton(
              icon: const Icon(Icons.layers_sharp),
              color: Colors.white,
              onPressed: () {
                widget.onCheckAllPressed!();
              },
            ),
          if (widget.showPlayBtn)
            IconButton(
              icon: const Icon(Icons.play_circle),
              color: Colors.white,
              onPressed: () {
                widget.onAccountConvertPressed!();
              },
            ),
          if (widget.showAddLabel)
            IconButton(
              icon: SvgPicture.asset('assets/svg/add_label.svg'),
              color: Colors.white,
              onPressed: () {
                widget.onAddMeetAttendancePressed!();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: searchController,
        onChanged: widget.onSearchChanged,
        decoration: InputDecoration(
          isDense: true,
          hintText: "Search",
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xFF8C8C8C),
            fontFamily: 'Poppins',
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
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
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
