import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinica/shared/colors/colors.dart';
import 'package:clinica/shared/util/responsive.dart';
import 'package:flutter/material.dart';

class TableCustomWg extends StatelessWidget {
  final List<DataColumn>? listColumns;
  final List<DataRow>? listRow;
  final List<String>? listDataColumns;
  final double? widgthRow;
  final List<List<String>>? listDataRow;
  final Color? colorTextColumn;
  final Color? colorTextRow;
  final bool colorPrimary;

  const TableCustomWg(
      {super.key,
      this.listColumns,
      this.listRow,
      this.listDataColumns,
      this.listDataRow,
      this.colorTextColumn,
      this.widgthRow,
      this.colorPrimary = false,
      this.colorTextRow});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: DataTable(
            // dataRowMaxHeight: Responsive.of(context).width * 0.05,
            headingRowHeight: Responsive.of(context).height * 0.09,
            columnSpacing: 5,
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => colorPrimary
                  ? ConstColors.primaryColor
                  : ConstColors.secundayColor,
            ),
            dividerThickness: 2.0,
            border: TableBorder(
              bottom: BorderSide(color: Colors.grey.shade300, width: 2),
            ),
            columns: listColumns ?? getColumns(listDataColumns!),
            rows: listRow ?? getRowTable(context, listDataRow!)));
  }

  List<DataColumn> getColumns(List<String> list) {
    List<DataColumn> listAuxiliar = [];
    if (list.isEmpty) {
      return listAuxiliar;
    } else {
      for (var element in list) {
        listAuxiliar.add(
          DataColumn(
            label: Flexible(
              child: Center(
                child: Text(
                  element,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'OpenSans',
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      }
    }
    return listAuxiliar;
  }

  List<DataRow> getRowTable(context, List<List<String>> list) {
    List<DataRow> listAuxiliar = [];
    if (list.isEmpty) {
      return listAuxiliar;
    } else {
      for (var childrens in list) {
        listAuxiliar.add(DataRow(
            color: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return Colors.white;
            }),
            cells: [
              for (var i = 0; i < childrens.length; i++)
                DataCell(
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: widgthRow ?? double.minPositive,
                    child: Center(
                      child: AutoSizeText(
                        childrens[i].toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'OpenSans',
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              // DataCell(
              //   Flexible(
              //     fit: FlexFit.loose,
              //     flex: 1,
              //     child: Center(
              //       child: FittedBox(
              //         fit: BoxFit.cover,
              //         child: Text(
              //           childrens[i].toString(),
              //           style: TextStyles.subHeadLineStyle(
              //               isBold: true,
              //               color: colorTextRow ?? Colores.primaryGray),
              //           textAlign: TextAlign.start,
              //           softWrap: true,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ]));
      }
    }

    return listAuxiliar;
  }
}
