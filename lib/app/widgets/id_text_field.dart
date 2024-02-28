import 'package:infinimesh_timeseries_app/app/constant/appColor.dart';
import 'package:infinimesh_timeseries_app/app/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IDTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool? enableToolTip;
  final String? toolTipMessage;
  final bool? disable;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool? mandatory;
  final TextCapitalization? textCapitalization;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function()? onTap;
  const IDTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.enableToolTip = false,
    this.onTap,
    this.toolTipMessage,
    this.keyboardType,
    this.focusNode,
    this.disable,
    this.textCapitalization,
    this.validator,
    this.mandatory,
    this.inputFormatters,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0.hp),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.0.hp),
            child: TextFormField(
              keyboardType: keyboardType,
              focusNode: focusNode,
              inputFormatters: inputFormatters,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              onTap: onTap,
              enabled: (disable == true) ? false : true,
              style: Theme.of(context).textTheme.bodyLarge,
              controller: controller,
              cursorColor: Theme.of(context).colorScheme.primary,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.LIGHT_COLOR,
                hintText: hintText,
                hintStyle: GoogleFonts.exo2(
                  color: AppColor.HINT_TEXT_COLOR,
                  fontSize: (context.isTablet) ? 16 : 14,
                ),
                errorStyle: GoogleFonts.exo2(
                  fontSize: (context.isTablet) ? 13 : 10,
                  color: AppColor.DEFAULT_ERROR_COLOR,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.LIGHT_COLOR),
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.BORDER_COLOR),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColor.DEFAULT_ERROR_COLOR),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: AppColor.DEFAULT_ERROR_COLOR,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 0.8.wp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                contentPadding: EdgeInsets.all(3.0.wp),
              ),
              validator: validator,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
