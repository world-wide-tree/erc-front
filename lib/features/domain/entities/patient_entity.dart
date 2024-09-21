import 'package:ERC/core/common/routes.dart';
import 'package:ERC/features/domain/entities/ecr_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';

class PatientEntity extends Equatable {
  final String id;
  final String name;
  final String age;
  final String pol;
  final EcrEntity ecr;

  const PatientEntity({
    required this.id,
    required this.name,
    required this.age,
    required this.pol,
    required this.ecr,
  });
  @override
  List<Object> get props => [
        id,
      ];

  PlutoRow getRow(PatientEntity e) {
    return PlutoRow(cells: {
      'name': PlutoCell(value: e.name),
      'age': PlutoCell(value: e.age),
      'sex': PlutoCell(value: e.pol),
      'phone_number': PlutoCell(value: '+998 93 038 19 45'),
      'address': PlutoCell(value: e.id),
      'more': PlutoCell(value: e),
    });
  }

  List<PlutoColumn> getColumn(BuildContext context) {
    return [
      PlutoColumn(
        enableColumnDrag: false,
        enableRowDrag: false,
        title: "   ${'name'.tr()}",
        field: 'name',
        enableRowChecked: false,
        readOnly: true,
        enableDropToResize: true,
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          if (rendererContext.cell.value != null) {
            return Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(),
              child: Text(rendererContext.cell.value.toString()),
            );
          }
          return const Text("");
        },
      ),
      PlutoColumn(
        enableColumnDrag: false,
        enableRowDrag: false,
        readOnly: true,
        title: "   ${'age'.tr()}",
        field: 'age',
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          if (rendererContext.cell.value != null) {
            return Container(
              padding: EdgeInsets.all(5),
              child: Text(rendererContext.cell.value.toString()),
            );
          }
          return const Text("");
        },
      ),
      PlutoColumn(
        enableColumnDrag: false,
        enableRowDrag: false,
        title: "   ${'sex'.tr()}",
        field: 'sex',
        readOnly: true,
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          if (rendererContext.cell.value != null) {
            return Container(
              padding: EdgeInsets.all(5),
              child: Text(rendererContext.cell.value.toString().tr()),
            );
          }
          return const Text("");
        },
      ),
      PlutoColumn(
        enableColumnDrag: false,
        enableRowDrag: false,
        title: "   ${'phone_number'.tr()}",
        field: 'phone_number',
        readOnly: true,
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          if (rendererContext.cell.value != null) {
            return Container(
              padding: EdgeInsets.all(5),
              child: Text(rendererContext.cell.value.toString()),
            );
          }
          return const Text("");
        },
      ),
      PlutoColumn(
        enableColumnDrag: false,
        enableRowDrag: false,
        title: "   ${'address'.tr()}",
        field: 'address',
        readOnly: true,
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          if (rendererContext.cell.value != null) {
            return Container(
              padding: EdgeInsets.all(5),
              child: Text(rendererContext.cell.value.toString()),
            );
          }
          return const Text("");
        },
      ),
      PlutoColumn(
        enableColumnDrag: false,
        enableRowDrag: false,
        title: "   ${'more'.tr()}",
        field: 'more',
        enableRowChecked: false,
        readOnly: true,
        enableDropToResize: true,
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          if (rendererContext.cell.value != null) {
            return Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(),
              child: TextButton(
                onPressed: () {
                  context.go(Routes.aboutPatientScreen);
                },
                child: Text(
                  'more'.tr(),
                ),
              ),
            );
          }
          return const Text("");
        },
      ),
    ];
  }
}
