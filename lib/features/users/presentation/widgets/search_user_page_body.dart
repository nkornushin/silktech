import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:silktech_users/core/formatters/limit_range.dart';
import 'package:silktech_users/core/widgets/input_text.dart';
import 'package:silktech_users/features/users/presentation/bloc/cubit/buttons_cubit.dart';
import 'package:silktech_users/injection_container.dart';

class SearchUserPageBody extends StatefulWidget {
  const SearchUserPageBody({super.key});

  @override
  State<SearchUserPageBody> createState() => _SearchUserPageBodyState();
}

class _SearchUserPageBodyState extends State<SearchUserPageBody> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController()..addListener(_inputUserIdListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_inputUserIdListener);
    controller.dispose();
    super.dispose();
  }

  void _inputUserIdListener() {
    getIt<ButtonsCubit>().isAllowSearch(controller.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        InputText(
          controller: controller,
          label: 'User ID',
          hintText: '1-30',
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(2),
            LimitRange(1, 30),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: BlocBuilder<ButtonsCubit, ButtonsState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.allowSearch
                          ? () => Routemaster.of(context)
                              .push('/profile/${controller.text}')
                          : null,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 18,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Search'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Routemaster.of(context).push('/users'),
                  child: const Text('List'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
