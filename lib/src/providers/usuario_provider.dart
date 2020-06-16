import 'dart:convert';

import 'package:http/http.dart' as http;
class UsuarioProvider {

  Future<bool> login (String usuario, String pass)  async {
    var response = await http.post('http://192.168.0.119/ventas-julvic-backend/public/api/usuario/autenticar',
     body: {'ci': pass, 'usuario_pc': usuario});

     Map<String,dynamic> decodeResp = json.decode(response.body);
    if(decodeResp["code"]!=200){
      return false;
    }else{
      return true;
    }
    
  }
}