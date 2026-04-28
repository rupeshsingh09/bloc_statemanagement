import 'package:bloc_learn/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_learn/bloc/switch_example/switch_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/switch_example/switch_event.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Build multiple state')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                // blocbuilder ka use , explain un copy
                BlocBuilder<SwitchBloc, SwitchStates>(
                  // buildWhen ka use krenge , expalin in copy , condition lgaye h ki koi ekhi build hoga
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                      value: true,
                      onChanged: (newValue) {
                        // read krenge context ko tv output aayega
                        context.read<SwitchBloc>().add(
                          EnableOrDisableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            const SizedBox(height: 50),
            // jis jis widget ko update krna hoga usko blocbuilder ke sath return krna hoga
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    // read krenge context ko tv output aayega
                    context.read<SwitchBloc>().add(
                      EnableOrDisableNotification(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
