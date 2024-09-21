import 'package:ERC/features/domain/entities/patient_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';

class PatientsDataPlutoTable extends StatefulWidget {
  final List<PatientEntity> listData;
  const PatientsDataPlutoTable({
    Key? key,
    required this.listData,
  }) : super(key: key);

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<PatientsDataPlutoTable> {
  List<PlutoColumn> columns = [];
  List<PlutoRow> rows = [];
  List<PatientEntity> listData = [];
  int currentPage = 1;
  int pageCount = 0;
  int dataCount = 0;

  @override
  void initState() {
    super.initState();
    listData = widget.listData;
    if (listData.isNotEmpty) {
      dataCount = widget.listData.length;
      rows = List<PlutoRow>.from(listData.map((e) => e.getRow(e)))
          .toList()
          .reversed
          .toList();
      columns = listData.first.getColumn(context).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: columns,
      rows: rows.isNotEmpty ? rows : [],
      mode: PlutoGridMode.readOnly,
      configuration: PlutoGridConfiguration(
        style: PlutoGridStyleConfig(
          columnHeight: PlutoGridSettings.rowHeight,
          gridBorderColor: Colors.grey.withOpacity(0.3),
          // columnCheckedColor: Colors.transparent,
          cellCheckedColor: Colors.transparent,
          rowCheckedColor: Colors.transparent,
          enableCellBorderHorizontal: false,
          defaultColumnFilterPadding: EdgeInsets.all(10),
          gridPopupBorderRadius: BorderRadius.circular(12),
          defaultColumnTitlePadding: EdgeInsets.only(right: 5),
          borderColor: Colors.grey.withOpacity(0.3),
          gridBorderRadius: BorderRadius.circular(12),
          oddRowColor: Colors.blueGrey.withOpacity(0.1),
          evenRowColor: Colors.blueAccent.withOpacity(0.1),
          enableRowColorAnimation: true,
          activatedColor: Colors.transparent,
          columnTextStyle: TextStyle(),
          iconColor: Colors.grey,
          // cellTextStyle: TextField.materialMisspelledTextStyle,
          // columnTextStyle: TextField.materialMisspelledTextStyle,
          gridBackgroundColor: Colors.transparent,
          rowColor: Colors.transparent,
        ),
        localeText: PlutoGridLocaleText(
          unfreezeColumn: 'unfreezeColumn'.tr(),
          freezeColumnToStart: 'freezeColumnToStart'.tr(),
          freezeColumnToEnd: 'freezeColumnToEnd'.tr(),
          autoFitColumn: 'autoFitColumn'.tr(),
          hideColumn: 'hideColumn'.tr(),
          setColumns: 'setColumns'.tr(),
          setFilter: 'setFilter'.tr(),
          resetFilter: 'resetFilter'.tr(),
          setColumnsTitle: 'setColumnsTitle'.tr(),
          filterColumn: 'filterColumn'.tr(),
          filterType: 'filterType'.tr(),
          filterValue: 'filterValue'.tr(),
          filterAllColumns: 'filterAllColumns'.tr(),
          filterContains: 'filterContains'.tr(),
          filterEquals: 'filterEquals'.tr(),
          filterStartsWith: 'filterStartsWith'.tr(),
          filterEndsWith: 'filterEndsWith'.tr(),
          filterGreaterThan: 'filterGreaterThan'.tr(),
          filterGreaterThanOrEqualTo: 'filterGreaterThanOrEqualTo'.tr(),
          filterLessThan: 'filterLessThan'.tr(),
          filterLessThanOrEqualTo: 'filterLessThanOrEqualTo'.tr(),
          sunday: 'sunday'.tr(),
          monday: 'monday'.tr(),
          tuesday: 'tuesday'.tr(),
          wednesday: 'wednesday'.tr(),
          thursday: 'thursday'.tr(),
          friday: 'friday'.tr(),
          saturday: 'saturday'.tr(),
          hour: 'hour'.tr(),
          minute: 'minute'.tr(),
          loadingText: 'loadingText'.tr(),
        ),
        columnSize: PlutoGridColumnSizeConfig(
          autoSizeMode: PlutoAutoSizeMode.none,
          resizeMode: PlutoResizeMode.none,
        ),
      ),
    );
  }
}
