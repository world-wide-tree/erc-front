import 'package:ERC/core/common/routes.dart';
import 'package:ERC/core/widgets/patient_data_table_widget.dart';
import 'package:ERC/features/domain/entities/ecr_entity.dart';
import 'package:ERC/features/domain/entities/patient_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  TextEditingController searcher = TextEditingController();
  @override
  void dispose() {
    searcher.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Align(
              alignment: Alignment.center,
              child: Text(
                'ERC',
                style: TextStyle(
                  color: Colors.blue[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
          actions: [
            SizedBox(
              width: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                controller: searcher,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      width: 300,
                      height: 200,
                      child: Dialog(
                        child: Container(
                          width: 300,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Center(
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        patients.add(PatientEntity(
                                            id: '',
                                            name: "Axror",
                                            age: "24",
                                            pol: "male",
                                            ecr: EcrEntity(id: '1')));
                                      });
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                    child: Text(
                                      'add'.tr(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'add_patient'.tr(),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                  Colors.blue[200],
                ),
                fixedSize: MaterialStatePropertyAll(
                  Size.fromWidth(160),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  context.go(Routes.loginScreen);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ))
          ],
        ),
        body: PatientsDataPlutoTable(listData: patients));
  }
}

List<PatientEntity> patients = [
  PatientEntity(
      id: '1',
      name: 'Alishan',
      age: '22',
      pol: 'male',
      ecr: EcrEntity(id: '1')),
  PatientEntity(
      id: '2', name: 'Jasur', age: '22', pol: 'male', ecr: EcrEntity(id: '2')),
  PatientEntity(
      id: '3', name: 'Amal', age: '22', pol: 'male', ecr: EcrEntity(id: '3')),
  PatientEntity(
      id: '4', name: 'Ruslan', age: '22', pol: 'male', ecr: EcrEntity(id: '4')),
  PatientEntity(
      id: '5', name: 'Doston', age: '23', pol: 'male', ecr: EcrEntity(id: '5')),
  PatientEntity(
      id: '6', name: 'Aziz', age: '22', pol: 'male', ecr: EcrEntity(id: '6')),
];

// Widget createTable(
//     int lenght, List<PatientEntity> patients, BuildContext context) {
//   List<DataRow> rows = [];
//   for (int i = 0; i < lenght; ++i) {
//     rows.add(DataRow(cells: [
//       DataCell(
//         Container(width: 100, child: Text(patients[i].name)),
//       ),
//       DataCell(Container(width: 100, child: Text(patients[i].pol))),
//       DataCell(Container(width: 30, child: Text(patients[i].age))),
//       DataCell(ElevatedButton(
//         child: Text('more'.tr()),
//         onPressed: () {},
//       )),
//     ]));
//   }
//   return DataTable(
//     sortColumnIndex: 1,
//     border: TableBorder(
//       bottom: BorderSide(
//         style: BorderStyle.solid,
//         width: 0.5,
//         color: Colors.grey,
//       ),
//     ),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//     ),
//     headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
//     headingRowColor: MaterialStatePropertyAll(Colors.blue[50]),
//     dataRowMaxHeight: 80,
//     columnSpacing: 2,
//     columns: [
//       DataColumn(label: Text('name'.tr())),
//       DataColumn(label: Text('phone_number'.tr())),
//       DataColumn(label: Text(' '.tr())),
//       DataColumn(label: Text(' '.tr())),
//     ],
//     rows: rows,
//   );
// }
