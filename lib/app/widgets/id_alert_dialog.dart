import 'package:auto_size_text/auto_size_text.dart';
import 'package:infinimesh_timeseries_app/app/constant/appColor.dart';
import 'package:infinimesh_timeseries_app/app/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IDAlertDialog extends StatelessWidget {
  final String title;
  final String label;
  final String content;
  final bool? enableButton;
  final Function()? onPressed;
  final String? buttonText;

  const IDAlertDialog({
    required this.label,
    required this.title,
    required this.content,
    this.enableButton = false,
    this.onPressed,
    this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: AppColor.DARK_COLOR,
      contentPadding: EdgeInsets.only(
        top: 1.0.hp,
        bottom: (enableButton == true) ? 1 : 10.0.hp,
        left: 3.0.wp,
        right: 3.0.wp,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(3.0.wp)),
      ),
      title: Column(
        children: [
          Icon(
            (label == 'error')
                ? Icons.cancel
                : (label == 'success')
                    ? Icons.check_circle
                    : (label == 'warning')
                        ? Icons.error
                        : (label == 'info')
                            ? Icons.info
                            : (label == 'progress')
                                ? Icons.arrow_circle_down_rounded
                                : Icons.check,
            size: (context.isTablet) ? 10.0.wp : 12.0.wp,
            color: (label == 'error')
                ? AppColor.DEFAULT_ERROR_COLOR
                : (label == 'success')
                    ? AppColor.DEFAULT_SUCCESS_COLOR
                    : (label == 'warning')
                        ? AppColor.DEFAULT_WARNING_COLOR
                        : (label == 'info')
                            ? AppColor.DEFAULT_INFO_COLOR
                            : (label == 'progress')
                                ? AppColor.DEFAULT_PROGRESS_COLOR
                                : AppColor.PRIMARY_COLOR,
          ),
          SizedBox(height: 1.0.hp),
          Text(
            title,
            style: GoogleFonts.exo2(
              fontWeight: FontWeight.w600,
              fontSize: (context.isTablet) ? 20 : 16,
              color: (label == 'error')
                  ? AppColor.DEFAULT_ERROR_COLOR
                  : (label == 'success')
                      ? AppColor.DEFAULT_SUCCESS_COLOR
                      : (label == 'warning')
                          ? AppColor.DEFAULT_WARNING_COLOR
                          : (label == 'info')
                              ? AppColor.DEFAULT_INFO_COLOR
                              : (label == 'progress')
                                  ? AppColor.DEFAULT_PROGRESS_COLOR
                                  : AppColor.PRIMARY_COLOR,
            ),
          ),
        ],
      ),
      content: SizedBox(
        height: 10.0.hp,
        width: (context.isTablet) ? 60.0.wp : 80.0.wp,
        child: Center(
          child: AutoSizeText(
            content,
            minFontSize: 12,
            textAlign: TextAlign.center,
            style: GoogleFonts.exo2(
              fontWeight: FontWeight.w400,
              fontSize: (context.isTablet) ? 16 : 14,
            ),
          ),
        ),
      ),
      actions: (enableButton == true)
          ? [
              TextButton(
                onPressed: onPressed,
                child: Text(
                  buttonText ?? '',
                  style: GoogleFonts.exo2(
                    fontSize: (context.isTablet) ? 8.0.sp : 12.0.sp,
                    color: AppColor.PRIMARY_COLOR,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ]
          : null,
    );
  }
}
