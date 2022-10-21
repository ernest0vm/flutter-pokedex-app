import 'package:flutter/material.dart';

class SearchModal extends StatelessWidget {
  const SearchModal({Key? key, required this.onChange}) : super(key: key);

  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: 120,
          child: Material(
            type: MaterialType.card,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, size: 26),
                      const SizedBox(height: 13),
                      Expanded(
                        child: TextFormField(
                          onFieldSubmitted: ((value) =>
                              Navigator.of(context).pop()),
                          onChanged: (value) => onChange(value),
                          decoration: const InputDecoration(
                            isDense: true,
                            hintText: 'Search Pokemon by name/number',
                            contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(
                              fontSize: 14,
                              // color: AppColors.midBlackTextColor,
                              height: 1,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
