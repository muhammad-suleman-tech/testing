// import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:intl/intl.dart';
// import 'package:testingproject/vph_web_date_picker.dart';


// class VPHWebDate extends StatefulWidget {
//   VPHWebDate({
//     super.key,
//     required this.labelText,
//     required this.selectedDateTO,
//     required this.dateToController,
//     required this.selectedDateFrom,
//     required this.dateFromController,
//     this.containerHeight,
//     this.containerWidth,
//     this.isShowHeading = true,
//     this.isDateChangeAble = true,
//     this.fontSizeForAll,
//     this.fontSizeForLabel,
//     this.onChange,
//     this.firstDate,
//     this.isRequired = false,
//     this.disableBorderRadius = false,
//   });
//   final String labelText;
//   final double? containerWidth;
//   late DateTime selectedDateTO;
//   final DateTime? firstDate;
//   late DateTime selectedDateFrom;
//   final double? containerHeight;
//   final bool isDateChangeAble;
//   final Function? onChange;
//   final double? fontSizeForAll;
//   final double? fontSizeForLabel;
//   late TextEditingController dateToController;
//   late TextEditingController dateFromController;
//   final bool isShowHeading;
//   final bool isRequired;
//   final bool disableBorderRadius;

//   @override
//   State<VPHWebDate> createState() => _VPHWebDateState();
// }

// class _VPHWebDateState extends State<VPHWebDate> {
//   late TextEditingController _controller;
//   late DateTime _selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = DateTime.now();
//     _controller = TextEditingController(text: _selectedDate.toString().split(' ')[0]);
//   }

//   Future<void> _selectDate(BuildContext context, bool flag) async {
//     final pickedDate = await showWebDatePicker(
//       width: 250,
//       context: context,
//       initialDate: flag ? widget.selectedDateTO : widget.selectedDateFrom,
//       firstDate: widget.firstDate ?? DateTime(1970),
//       lastDate: DateTime(2101),
//       weekendDaysColor: Colors.red,
      
//       //width: 300,
//       // withoutActionButtons: true,
//       // weekendDaysColor: Colors.red,
//       // firstDayOfWeekIndex: 1,
      
//     );
//     if (pickedDate != null) {
//       flag
//           ? setState(() {
//               widget.selectedDateTO = pickedDate;
//               widget.dateToController.text = DateFormat('MM/dd/yyyy').format(widget.selectedDateTO);
//             })
//           : setState(() {
//               widget.selectedDateFrom = pickedDate;
//               widget.dateFromController.text = DateFormat('MM/dd/yyyy').format(widget.selectedDateFrom);
//             });
//     }

//     if (isDebug) printLog("date to ${widget.dateToController.text}");
//     if (isDebug) printLog("Date from ${widget.dateFromController.text}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     final textFieldKey = GlobalKey();
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         if (widget.isShowHeading)
//           Row(
//             children: [
//               DropDownTheme.headerText(
//                 widget.labelText,
//               ),
//               if (widget.isRequired)
//                 Text(
//                   " *",
//                   style: TextFiledTheme.textStyleHeaderRequired(12),
//                 ),
//             ],
//           ),
//         // onTap: () => {widget.isDateChangeAble ? _selectDate(context, false) : null},

//         SizedBox(
//             width: widget.containerWidth,
//             height: widget.containerHeight ?? Branding.tFHeight,
//             child: TextField(
//               key: textFieldKey,
//               controller: widget.dateFromController,
//               readOnly: false,
//               onChanged: widget.onChange as void Function(String?)?,
//               // onTap: ,
//               style: TextStyle(
//                 color: bodyTextDark,
//                 fontSize: widget.fontSizeForAll ?? 12,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: AppTexts.montserratFontFaimly,
//               ),
//               enabled: widget.isDateChangeAble,
//               keyboardType: TextInputType.text,
//               inputFormatters: [DateTextFormatter()],
//               decoration: InputDecoration(
//                 hintText: "MM/DD/YYYY",
//                 isDense: true,
//                 constraints: BoxConstraints(minHeight: widget.containerHeight ?? Branding.tFHeight, minWidth: 30.w),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.cWE, vertical: 0),
//                 disabledBorder: OutlineInputBorder(
//                   borderRadius: widget.disableBorderRadius ? BorderRadius.circular(0) : BorderRadius.circular(Branding.tFborderR),
//                   borderSide: BorderSide(
//                     width: 1.cWE,
//                     color: borderColor,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: widget.disableBorderRadius ? BorderRadius.circular(0) : BorderRadius.circular(Branding.tFborderR),
//                   borderSide: BorderSide(
//                     color: borderColor,
//                     width: 1.cWE,
//                     // style: BorderStyle.none,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: widget.disableBorderRadius ? BorderRadius.circular(0) : BorderRadius.circular(Branding.tFborderR),
//                   borderSide: BorderSide(
//                     color: borderColor, // Set the color of the border when focused
//                     width: 1.cWE,
//                   ),
//                 ),
//                 labelStyle: TextStyle(
//                   color: titleColor,
//                   fontSize: widget.fontSizeForLabel ?? 12,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w400,
//                 ),
//                 floatingLabelStyle: TextStyle(
//                   color: titleColor,
//                   fontSize: widget.fontSizeForAll ?? 11,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w400,
//                 ),
//                 helperStyle: TextStyle(
//                   color: titleColor,
//                   fontSize: widget.fontSizeForAll ?? 11,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w400,
//                 ),
//                 hintStyle: TextStyle(
//                   color: placeHolderColor,
//                   fontSize: widget.fontSizeForAll ?? 12,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w400,
//                 ),
//                 filled: true,
//                 fillColor: widget.isDateChangeAble ? AppColors.white : lightBackgroundColor,
//                 suffixIcon: InkWell(
//                   onTap: () async {
//                     if (widget.isDateChangeAble) {
//                       await _selectDate(context, false); // Open the date picker and update the date
//                       if (widget.onChange != null) {
//                         // Trigger the onChange callback after updating the date
//                         widget.onChange!(widget.dateFromController.text);
//                       }
//                     }
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 6),
//                     child: SvgPicture.asset(
//                       AppAssets.calendarIcon,
//                       color: primaryColor,
//                     ),
//                   ),
//                 ),
//               ),
//             )),
//       ],
//     );
//   }
// }
