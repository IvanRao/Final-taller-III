<?php

namespace controller;

use model\marcas;
use db\DbController;

class marcasController{

    public static function all(){   
        return Marcas::all();
    }

    public static function byId($id){   
        return Marcas::byId($id);
    }

    public static function delete($id){   
        $prod =  Marcas::byId($id);
        $prod->delete();
        return "Ok";
    }

    public static function create($nombreMarca,$activo){  
        $p = new Marcas();
        $p->nombreMarca = $nombreMarca;
        $p->activo = $activo;
        $p->create();
        return "OK";
    }

    public static function update($id,$nombreMarca,$activo){  
        $p = Marcas::byId($id);
        $p->nombreMarca = $nombreMarca;
        $p->activo = $activo;
        $p->update();
        return "OK";
    }

}
