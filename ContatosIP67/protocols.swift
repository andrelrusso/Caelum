//
//  File.swift
//  ContatosIP67
//
//  Created by ios8106 on 3/21/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import Foundation

protocol FormularioContatoViewControllerDelegate {
    
    func contatoAtualizado(_ contato:Contato)
    func contatoAdicionado(_ contato:Contato)
}
