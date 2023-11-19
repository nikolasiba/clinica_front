import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:clinica/shared/widgets/custom_app_menu.dart';
import 'package:clinica/shared/widgets/separator.dart';
import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  CustomPage({
    Key? key,
    required this.body,
    this.verticalPadding = 10.0,
    this.horizontalPadding = 20.0,
    this.appBarMenu = true,
    this.innerContainer = false,
    this.backgroundColor,
  }) : super(key: key);

  final Widget body;
  double verticalPadding;
  double horizontalPadding;
  bool appBarMenu;
  bool innerContainer;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appBarMenu
              ? CustomAppMenu()
              : IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back)),
          backgroundColor: ConstColors.primaryColor,
          leading: Container(),
        ),
        backgroundColor: backgroundColor ?? Colors.grey[300],
        body: SafeArea(
            child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: innerContainer
                    ? Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: horizontalPadding,
                                  vertical: verticalPadding),
                              child: body,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: RawScrollbar(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Separator(size: 2),
                              Container(
                                  height: Responsive.of(context).height * 0.9,
                                  width: Responsive.of(context).width * .85,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.all(40),
                                  child: body),
                              const Separator(size: 2),
                              Container(
                                  color: ConstColors.primaryColor,
                                  width: Responsive.of(context).width,
                                  height: Responsive.of(context).height * .07)
                            ],
                          ),
                        ),
                      )))));
  }
}
