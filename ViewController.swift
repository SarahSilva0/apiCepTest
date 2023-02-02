//
//  ViewController.swift
//  apiCepTest
//
//  Created by Sarah dos Santos Silva on 01/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    var cepView: telaCep?
    
    override func loadView() {
        self.cepView = telaCep()
        self.view = self.cepView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cepView?.delegate(delegate: self)
    }
}

extension ViewController: telaCepProtocol{
    func actionPesquisarButton() {
        APIViaCep.pesquisarCEP((cepView?.cepTF.text)!) { (cep) in
            DispatchQueue.main.async {
                self.cepView?.logradouroLabel.text = "Logradouro: \(cep.logradouro)"
                self.cepView?.localidadeLabel.text = "Localidade/UF: \(cep.localidade) \(cep.uf)"
                self.cepView?.dddLabel.text = "DDD: \(cep.ddd)"
            }
        }
        
        print("botao apertado")
    }
    
    
}

