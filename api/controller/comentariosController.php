<?php

namespace controller;

use model\comentarios;
use db\DbController;

class comentariosController{

    public static function all(){   
        return Comentarios::all();
    }

    public static function byId($id){   
        return Comentarios::byId($id);
    }

    public static function delete($id){   
        $prod =  Comentarios::byId($id);
        $prod->delete();
        return "Ok";
    }

    public static function create($email,$puntaje,$comentario){  
        $p = new Comentarios();
        $p->email = $email;
        $p->puntaje = $puntaje;
				$p->comentario = $comentario;
				$p->aprobado = 0;
        $p->create();
        return "OK";
    }

    public static function update($id,$email,$puntaje,$comentario,$aprobado){  
        $p = Comentarios::byId($id);
        $p->email = $email;
        $p->puntaje = $puntaje;
				$p->comentario = $comentario;
				$p->aprobado = $aprobado;
        $p->update();
        return "OK";
    }

}
