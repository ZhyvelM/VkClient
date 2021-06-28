part of 'client_cubit.dart';

@immutable
abstract class ClientState {
  const ClientState();
}

class ClientInitial extends ClientState {
  const ClientInitial();
}

class toProfile extends ClientState {
  const toProfile();
}

class toWall extends ClientState {
  const toWall();
}

class toHub extends ClientState {
  const toHub();
}
