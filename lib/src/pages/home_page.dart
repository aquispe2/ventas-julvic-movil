import 'package:app_ver_stock/src/bloc/provider.dart';
import 'package:app_ver_stock/src/models/producto_model.dart';
import 'package:app_ver_stock/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: _crearListado(),
     floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, i) => _crearItem(productos[i]));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(ProductoModel producto) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('${producto.nombre}'),
            subtitle: Text('Stock: ${producto.stock}  Stock Almacen: ${producto.stock_almacen}'),
            
          )
        ],
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.refresh),
      onPressed: () => _actualizar(context),
      backgroundColor: Colors.deepPurple,
    );
  }

  _actualizar(BuildContext context){
     Navigator.pushReplacementNamed(context, 'home');
  }
}
