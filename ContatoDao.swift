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
    
    func adiciona(_ contato:Contato){
        contatos.append(contato)
        
        for contato in contatos{
            print(contato)
        }
    }
    
    static func sharedInstance() -> ContatoDao{
        if defaultDAO == nil{
            defaultDAO = ContatoDao()
        }
        return defaultDAO
    }
    override private init(){
        self.contatos = Array()
        super.init()
    }
}

