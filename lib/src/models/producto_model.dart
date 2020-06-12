// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    int productoId;
    String nombre;
    String descripcion;
    int precio;
    int stock;
    int stock_almacen;

    ProductoModel({
        this.productoId,
        this.nombre,
        this.descripcion,
        this.precio,
        this.stock,
        this.stock_almacen
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        productoId: json["producto_id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        stock: json["stock"],
        stock_almacen: json["stock_almacen"]
    );

    Map<String, dynamic> toJson() => {
        "producto_id": productoId,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "stock": stock,
        "stock_almacen":stock_almacen
    };
}
