
import 'dart:convert';

import 'package:app_ver_stock/src/models/producto_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider{

  final String _url ="http://192.168.100.88:80/api_ventas_cocha/public/api";
  //final String _url ="https://stark-mountain-29753.herokuapp.com/api";

  

  Future<List<ProductoModel>> cargarProductos () async {
    final url = '$_url/producto/obtener-todos';
    final  resp =  await http.get(url);
    var  decodeData = json.decode(resp.body) ;
    final jsonListProducto =  decodeData['productos'];

    List<ProductoModel> lst = new List<ProductoModel>();
    for(Map i in jsonListProducto){
      final objProducto = ProductoModel.fromJson(i);
      lst.add(objProducto);
      
    }
    print('prodcutos');
    print(lst);
    
    return lst;

  }
}