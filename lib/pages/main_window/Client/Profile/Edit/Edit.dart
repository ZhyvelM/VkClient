import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkontakte/model/screens/ProfileModel.dart';
import 'package:vkontakte/pages/main_window/Client/Profile/profile_cubit/profile_cubit.dart';
import 'package:vkontakte/util.dart' as util;

class Edit extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _statusEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    profileModel.getStatus(util.userId).then((value) => _statusEditingController.text = value);
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Row(
          children: [
            TextButton(
                onPressed: () {
                  profileCubit.toProfile();
                },
                child: Text("Cancel")),
            Spacer(),
            TextButton(
              onPressed: () async {
                profileModel.setStatus(_statusEditingController.text);
                profileCubit.toProfile();
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            ListTile(
              title: TextFormField(
                controller: _statusEditingController,
                decoration: InputDecoration(hintText: "Status"),
                validator: (String inValue) {
                  if (inValue.length == 0) {
                    return "Enter status";
                  }
                  return null;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
