import 'dart:async';

class Validators{
  final validarPassword = StreamTransformer<String,String>.fromHandlers(
    handleData: (password, sink){
      if(password.length>=6){
        sink.add(password);
      }else{
        sink.addError('Mas de 6 caracteres porfavor');
      }
    }
  );

    final validarUsuario = StreamTransformer<String,String>.fromHandlers(
    handleData: (usuario, sink){
      if(usuario.length>=6){
        sink.add(usuario);
      }else{
        sink.addError('Mas de 6 caracteres porfavor');
      }
    }
  );
}