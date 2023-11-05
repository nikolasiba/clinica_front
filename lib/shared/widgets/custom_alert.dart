import 'package:animate_do/animate_do.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      this.hasLeftButton = true,
      this.hasRightButton = false,
      this.canPop = false,
      this.hasLeftButtonText = "",
      this.hasRightButtonText = "",
      this.footer,
      this.onRightPressed,
      this.onLeftPressed,
      this.leftButtonColor,
      this.rightButtonColor,
      this.title,
      this.padding = 10.0,
      required this.content});

  final bool hasLeftButton;
  final bool hasRightButton;
  final bool canPop;
  final Function()? onLeftPressed;
  final Function()? onRightPressed;
  final Widget? title;
  final Widget content;
  final Widget? footer;
  final double padding;
  final String hasLeftButtonText;
  final String hasRightButtonText;
  final Color? leftButtonColor;
  final Color? rightButtonColor;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return canPop;
      },
      child: BounceInDown(
        duration: const Duration(milliseconds: 500),
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.all(padding),
          title: Center(child: title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        height: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 5),
                    child: content),
                // Visibility(visible: footer != null, child: footer!),
                footer ?? Container(),
                Visibility(
                  visible: (hasRightButton || hasLeftButton) && footer == null,
                  child: Row(
                    children: <Widget>[
                      Visibility(
                        visible: hasLeftButton,
                        child: Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                            child: CustomButton(
                              text: hasLeftButtonText == ""
                                  ? 'Cancelar'
                                  : hasLeftButtonText,
                              onPressed: onLeftPressed ??
                                  () => {Navigator.of(context).pop()},
                              backgroundColor:
                                  leftButtonColor ?? Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: hasRightButton,
                        child: Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                            child: CustomButton(
                              text: hasRightButtonText == ""
                                  ? 'Aceptar'
                                  : hasRightButtonText,
                              onPressed: onRightPressed ??
                                  () => {Navigator.of(context).pop()},
                              backgroundColor:
                                  rightButtonColor ?? ConstColors.primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
