import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesma/core/common/bloc/app_manager_cubit.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/managers/string_manager/assets_manager.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget? child;

  const BackgroundWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            image: state.backgroundImagePath == null
                ? null
                : DecorationImage(
                    fit: BoxFit.fill,
                    image: FileImage(
                      File(
                        state.backgroundImagePath!,
                      ),
                    ),
                  ),
          ),
          child: Container(
            width: context.width,
            height: context.height,
            decoration:state.backgroundImagePath == null? const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AssetsManager.backgroundImage,
                ),
              ),
            ):null,
            child: SafeArea(
                child: Offstage(
              offstage: false,
              child: child,
            )),
          ),
        );
      },
    );
  }
}
