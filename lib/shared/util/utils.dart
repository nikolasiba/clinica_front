import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Utils {
  static final device = _Device._();
  static final data = _Data._();
}

class _Device {
  _Device._();

  void showDialogCustom(
      {String? title,
      required BuildContext context,
      required String message,
      bool isWarning = true,
      bool hasRightButton = true,
      bool hasLeftButton = false,
      Function()? onRightPressed,
      Function()? onLeftPressed,
      String? leftButtonText,
      String? rightButtonText}) {
    showDialog(
      
      context: context,
      builder: (BuildContext alertContext) => CustomDialog(
        hasRightButton: hasRightButton,
        hasLeftButton: hasLeftButton,
        onRightPressed: onRightPressed,
        onLeftPressed: onLeftPressed,
        hasLeftButtonText: leftButtonText ?? '',
        hasRightButtonText: rightButtonText ?? '',
        //Advertencia
        title: Text(
            title ??
                (isWarning
                    ? 'Advertencia'
                    : 'No se que titulo ponerle a este dialogo'),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        content: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Text(
            message,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}

class _Data {
  _Data._();
}
