import 'dart:async';

import 'package:app_ver_stock/src/bloc/validators.dart';

import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
  final _usuarioController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //recuoerar datos del stream
  Stream<String> get usuarioStream    => _usuarioController.stream.transform(validarUsuario);
  Stream<String> get passwordStream    => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => 
       CombineLatestStream.combine2(usuarioStream, passwordStream, (e, p) => true);


  //insertar valores  al Stream
  Function(String) get changeUser   => _usuarioController.sink.add;
  Function(String) get changePassword   => _passwordController.sink.add;

  
  //obtener ultim valor igrsado a lso streams
  String get usuario => _usuarioController.value;
  String get pasword => _passwordController.value;

  
  dispose(){
    _usuarioController?.close();
    _passwordController?.close();
  }
}
