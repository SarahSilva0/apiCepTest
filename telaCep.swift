//
//  telaCep.swift
//  apiCepTest
//
//  Created by Sarah dos Santos Silva on 01/02/23.
//

import UIKit

protocol telaCepProtocol: AnyObject{
    func actionPesquisarButton()
}

class telaCep: UIView {
    
    private weak var delegate: telaCepProtocol?
        
    func delegate(delegate:telaCepProtocol?){
        self.delegate = delegate
    }
    
    //MARK: CRIANDO OS ELEMENTOS:
    lazy var cepTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.placeholder = "Digite o CEP (apenas números)"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var buttonCep: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pesquisar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(self.pesquisarCep), for: .touchUpInside)
        return button
    }()
    
    lazy var logradouroLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.text = "Logradouro:"
        return label
    }()
    lazy var localidadeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.text = "Localidade/UF:"
        return label
    }()
    lazy var dddLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.minimumScaleFactor = 0.5
        label.text = "DDD:"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configSuperView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.addSubview(self.cepTF)
        self.addSubview(self.buttonCep)
        self.addSubview(self.logradouroLabel)
        self.addSubview(self.localidadeLabel)
        self.addSubview(self.dddLabel)
    }
    
    @objc private func pesquisarCep(){
        self.delegate?.actionPesquisarButton()
    }
    
    private func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            
            self.cepTF.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.cepTF.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            
            self.buttonCep.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.buttonCep.leadingAnchor.constraint(equalTo: self.cepTF.trailingAnchor, constant: 10),
            self.buttonCep.heightAnchor.constraint(equalToConstant: 30),
            self.buttonCep.widthAnchor.constraint(equalToConstant: 80),
            
            self.logradouroLabel.topAnchor.constraint(equalTo: self.cepTF.bottomAnchor, constant: 50),
            self.logradouroLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            
            self.localidadeLabel.topAnchor.constraint(equalTo: self.logradouroLabel.bottomAnchor, constant: 5),
            self.localidadeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            
            self.dddLabel.topAnchor.constraint(equalTo: self.localidadeLabel.bottomAnchor,constant: 5),
            self.dddLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20)
        ])
    }
}
