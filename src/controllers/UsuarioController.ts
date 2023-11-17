import { Prisma } from "@prisma/client";
import {Request, Response} from 'express';
import UsuarioService from "../service/UsuarioService";

class UsuarioController{
    constructor(){

    }

    async listUsuarios(req: Request, res: Response){
        const usuarios = await UsuarioService.listUsuarios() as Prisma.UsuarioCreateInput[];

        const filteredUsuarios = usuarios.filter((usuario: Prisma.UsuarioCreateInput) => usuario.nome != null)

        return res.status(200).json({
            status: 'ok',
            users: filteredUsuarios
        })
    }  
    
    async createUsuario(req: Request, res: Response){
        const dados: Prisma.UsuarioCreateInput = req.body;
        if(dados){
            const newusuario = UsuarioService.createUsuario(dados);
            res.status(200).json({
                status: '20',
                newusuario: newusuario
            });
        }else{
            res.status(400).json({
                status: 'error',
                mensage: 'tem que colocar os dados'
            });
        }
        
    
        res.end('Incluir Usuarios');
    }

    async deleteUsuario(req: Request, res: Response){
        // serve para deletar  as informações
        res.send('Deleta Usuario');
    }

    async updateUsuario(req: Request, res: Response){
        // serve para atualizar as informações
        res.send('Atualizar Usuario');
    }
}

export default new UsuarioController;