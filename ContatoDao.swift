//
//  ContatoDao.swift
//  ContatosIP67
//
//  Created by ios8106 on 3/19/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit
import Foundation

class ContatoDao: NSObject {
    static private var defaultDAO: ContatoDao!
    var contatos: Array<Contato>
    
    override private init(){
        self.contatos = Array()
        super.init()
    }
    
    static func sharedInstance() -> ContatoDao{
        if defaultDAO == nil{
            defaultDAO = ContatoDao()
        }
        return defaultDAO
    }
    
    
    func adiciona(_ contato:Contato){
        contatos.append(contato)
        
//        for contato in contatos{
//            print(contato)
//        }
    }
    
    func listaTodos() -> [Contato]{
        return contatos
    }
    
    func buscaContatoNaPosicao(_ posicao:Int) -> Contato {
        return contatos[posicao]
    }
    
    func remove(_ posicao:Int){
        contatos.remove(at: posicao)
    }
    
}

