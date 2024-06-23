import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/matierial/matieral_response_model/matieral_response_model.dart';
import 'package:open/fetures/matierial/presention/manager/cubit/matierals_cubit_cubit.dart';

class GridviewLec extends StatefulWidget {
  const GridviewLec({super.key});

  @override
  State<GridviewLec> createState() => _GridviewLecState();
}

class _GridviewLecState extends State<GridviewLec> {
  List<MatieralResponseModel> mmm = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: BlocListener<MatieralsCubitCubit, MatieralsCubitState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is MatieralsCubitsucess) {
            setState(() {
              mmm = state.matieral;
            });
          }
        },
        child: BlocBuilder<MatieralsCubitCubit, MatieralsCubitState>(
          builder: (context, state) {
            if (state is MatieralsCubitsucess) {
              return GridView.builder(
                  itemCount: state.matieral.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 3.5),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: const Color(0xffBBBBBB).withOpacity(.55)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Icon(Icons.folder)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                    child: Text(
                                        state.matieral[index].lectureName!)),
                              ],
                            ),
                          ),
                        ),
                      ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
