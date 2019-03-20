//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios8106 on 3/19/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class FormularioContatoViewController: UIViewController {
    
    var dao:ContatoDao
    
    required init?(coder aDecoder: NSCoder) {
        self.dao = ContatoDao.sharedInstance()
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var endereco: UITextField!
    @IBOutlet weak var site: UITextField!
    @IBAction func pegaDadosDoFormulario(_ sender: AnyObject) {
        let contato: Contato = Contato()
        
        contato.nome = self.nome.text!
        contato.telefone = self.telefone.text!
        contato.endereco = self.endereco.text!
        contato.site  = self.site.text!
        
        dao.adiciona(contato)
        
//        for cont in dao.contatos
//        {
//            print("Nome: \(contato.nome), Telefone: \(contato.telefone), Endereço: \(contato.endereco), Site: \(contato.site)")
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

