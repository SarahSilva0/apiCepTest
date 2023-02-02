//
//  ModelCep.swift
//  apiCepTest
//
//  Created by Sarah dos Santos Silva on 02/02/23.
//

import Foundation

struct Cep: Decodable {
    var logradouro: String
    var localidade: String
    var uf: String
    var ddd: String
}
