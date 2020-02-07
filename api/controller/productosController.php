<?php

namespace controller;

use model\productos;
use db\DbController;
use controller\FileController;

class productosController{

    public static function all(){   
        return Productos::all();
    }

    public static function byId($id){   
        return Productos::byId($id);
    }

    public static function delete($id){   
        $prod =  Productos::byId($id);
        $prod->delete();
        return "Ok";
    }

    public static function create($nombre,$descripcion,$modelo,$precio,$activo,$puntaje,$marca_id,$categoria_id,$imagen){  
        $p = new Productos();
        $p->nombre = $nombre;
        $p->descripcion = $descripcion;
        $p->modelo = $modelo;
        $p->precio = $precio;
        $p->activo = $activo;
        $p->puntaje = $puntaje;
        $p->marca_id = $marca_id;
        $p->categoria_id = $categoria_id;
        $p->create();
        FileController::write($imagen,$p->id);
        return "OK";
    }

    public static function update($id,$nombre,$descripcion,$modelo,$precio,$activo,$puntaje,$marca_id,$categoria_id,$imagen){  
        $p = Productos::byId($id);
        $p->nombre = $nombre;
        $p->descripcion = $descripcion;
        $p->modelo = $modelo;
        $p->precio = $precio;
        $p->activo = $activo;
        $p->puntaje = $puntaje;
        $p->marca_id = $marca_id;
        $p->categoria_id = $categoria_id;
        $p->update();
        if ($imagen != null) {
        FileController::write($imagen,$p->id);
        }else{};
        return "OK";
    }

}
