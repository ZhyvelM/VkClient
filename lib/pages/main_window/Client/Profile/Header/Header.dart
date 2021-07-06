import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vkontakte/model/User.dart';
import 'package:vkontakte/model/screens/ProfileModel.dart';
import 'package:vkontakte/pages/main_window/Client/Profile/profile_cubit/profile_cubit.dart';
import 'package:vkontakte/util.dart' as util;

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext inContext) {
    Future<User> _profile = profileModel.getProfile(util.userId);
    return FutureBuilder<User>(
      future: _profile,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(snapshot.data.photo100),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(),
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${snapshot.data.firstName} ${snapshot.data.lastName}",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${snapshot.data.status}"),
                    ElevatedButton(
                        onPressed: () {
                          final profileCubit = BlocProvider.of<ProfileCubit>(inContext);
                          profileCubit.toEdit();
                        },
                        child: Text("Edit"))
                  ],
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
