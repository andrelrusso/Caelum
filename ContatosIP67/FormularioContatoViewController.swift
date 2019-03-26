//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios8106 on 3/19/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit
import CoreLocation

class FormularioContatoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var dao:ContatoDao
    var contato:Contato!
    var delegate:FormularioContatoViewControllerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        self.dao = ContatoDao.sharedInstance()
        super.init(coder: aDecoder)
    }
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var endereco: UITextField!
    @IBOutlet weak var site: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    
    @IBAction func criaContato(){
        self.pegaDadosDoFormulario()
        dao.adiciona(contato)
        
        self.delegate?.contatoAdicionado(contato)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buscarCoordenadas(sender: UIButton)
    {
        
            if (self.endereco.text?.isEmpty)!
            {
                let alert = UIAlertController(title: "Erro de consistência", message:"Favor preencher o campo endereço", preferredStyle: .alert)
                let acao = UIAlertAction(title:
                    "OK", style: .default, handler:
                    nil)
                alert.addAction(acao)
                self.present(alert, animated: true, completion: nil)
                
            }
            
            
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(self.endereco.text!) {(resultado, error) in
            
            if error == nil && (resultado?.count)! > 0 {
                let placemark = resultado![0]
                let coordenada = placemark.location!.coordinate
                
                self.latitude.text = coordenada.latitude.description
                self.longitude.text = coordenada.longitude.description
            
            }
        }
    }
    
    
    func pegaDadosDoFormulario() {
        if contato == nil {
            self.contato = Contato()
        }
//        if self.botaoAdicionaImage.backgroundImageForState(.Normal) != nil{
//            self.contato.foto = self.botaoAdicionaImage.backgroundImageForState(.Normal)
//        }
        
        
        self.contato.nome = self.nome.text!
        self.contato.telefone = self.telefone.text!
        self.contato.endereco = self.endereco.text!
        self.contato.site  = self.site.text!
        
        //Estava quebrando
        //self.contato.foto  = imageView.image
        
        if let imagem = imageView.image
        {
            self.contato.foto  = imagem
        }
     
        if let latitude = Double(self.latitude.text!){
            self.contato.latitude = latitude as NSNumber
        }
        if let longitude = Double(self.longitude.text!){
            self.contato.longitude = longitude as NSNumber
        }
    }
    
    func atualizaContato(){
        pegaDadosDoFormulario()
        
        self.delegate?.contatoAtualizado(contato)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.nome.becomeFirstResponder()
        self.nome.layer.cornerRadius = 15.0
        self.telefone.layer.cornerRadius = 15.0
        self.endereco.layer.cornerRadius = 15.0
        self.site.layer.cornerRadius = 15.0
        self.latitude.layer.cornerRadius = 15.0
        self.longitude.layer.cornerRadius = 15.0
        self.nome.layer.borderWidth = 2.0
        self.telefone.layer.borderWidth = 2.0
        self.endereco.layer.borderWidth = 2.0
        self.site.layer.borderWidth = 2.0
        self.latitude.layer.borderWidth = 2.0
        self.longitude.layer.borderWidth = 2.0
        self.nome.layer.borderColor = UIColor.gray.cgColor
        self.telefone.layer.borderColor = UIColor.gray.cgColor
        self.latitude.layer.borderColor = UIColor.gray.cgColor
        self.longitude.layer.borderColor = UIColor.gray.cgColor
        self.endereco.layer.borderColor = UIColor.gray.cgColor
        self.site.layer.borderColor = UIColor.gray.cgColor
        self.imageView.layer.borderWidth = 1
        self.imageView.layer.masksToBounds = false
        self.imageView.layer.borderColor = UIColor.black.cgColor
        self.imageView.layer.cornerRadius = self.imageView.frame.height/2
        self.imageView.clipsToBounds = true
        if contato != nil{
            self.nome.text = contato.nome
            self.telefone.text = contato.telefone
            self.endereco.text = contato.endereco
            self.site.text = contato.site
            self.longitude.text = contato.longitude?.description
            self.latitude.text = contato.latitude?.description
            
            if let foto = self.contato.foto{
                    self.imageView.image = foto
            }
            
            let botaoAlterar = UIBarButtonItem(title:"Confirmar", style: .plain, target: self, action: #selector(atualizaContato))
            
            self.navigationItem.rightBarButtonItem = botaoAlterar
            
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(selecionaFoto(sender:)))
        self.imageView.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func selecionaFoto(sender: AnyObject){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //camera disponivel
        }
        else{
            //usar biblioteca
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let imagemSelecionada = info[UIImagePickerControllerEditedImage] as? UIImage{
            self.imageView.image = imagemSelecionada
        }
        picker.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

