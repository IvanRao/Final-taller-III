<?php

namespace controller;

use model\categorias;
use db\DbController;

class categoriasController{

    public static function all(){   
        return Categorias::all();
    }

    public static function byId($id){   
        return Categorias::byId($id);
    }

    public static function delete($id){   
        $prod =  Categorias::byId($id);
        $prod->delete();
        return "Ok";
    }

    public static function create($nombreCategoria,$activo,$categoriaPadre){  
        $p = new Categorias();
        $p->nombreCategoria = $nombreCategoria;
        $p->activo = $activo;
        $p->categoriaPadre = $categoriaPadre;
        $p->create();
        return "OK";
    }

    public static function update($id,$nombreCategoria,$activo,$categoriaPadre){  
        $p = Categorias::byId($id);
        $p->nombreCategoria = $nombreCategoria;
        $p->activo = $activo;
        $p->categoriaPadre = $categoriaPadre;
        $p->update();
        return "OK";
    }

}
