//
//  Elephant.swift
//  Elephants
//
//  Created by Rayana Prata Neves on 18/10/21.
//

import Foundation

/*
    {
         "_id": "5cf1d0dbcd5e98f2540c4d1c",
         "index": 3,
         "name": "Balarama",
         "affiliation": "Dasara",
         "species": "Asian",
         "sex": "Male",
         "fictional": "false",
         "dob": "1958",
         "dod": "-",
         "wikilink": "https://en.wikipedia.org/wiki/Balarama_(elephant)",
         "image": "https://elephant-api.herokuapp.com/pictures/missing.jpg",
         "note": "A lead elephant of the world-famous Mysore Dasara procession."
     }
*/

// Codable tem duas estruturas a Encodable e a Decodable

/*
 Codable is a type alias for the Encodable and Decodable protocols.
 When you use Codable as a type or a generic constraint, it matches any type that conforms to both protocols.
 */

// O que sao essas estruturas?
// "Decodable" -> eu pego um JSON da API e transformo em uma estrutura (class ou struct)
// "Encodable" -> eu estou codificando/encapsulando a estrutura (class ou struct) em um JSON

struct Elephant: Codable {
    
    var _id             : String?
    //var index         : Int
    var name            : String?
    //var affiliation   : String?
    var species         : String?
    var sex             : String?
    //var fictional     : String?
    var dob             : String?         // dob - date of birthday
    var dod             : String?         // dod - date of death
    var wikilink        : String?
    var image           : String?
    var note            : String?
    
    init(
        _id         : String? = nil,
        name        : String? = nil,
        species     : String? = nil,
        sex         : String? = nil,
        dob         : String? = nil,
        dod         : String? = nil,
        wikilink    : String? = nil,
        image       : String? = nil,
        note        : String? = nil
    ) {
        self._id        = _id
        self.name       = name
        self.species    = species
        self.sex        = sex
        self.dob        = dob
        self.dod        = dod
        self.wikilink   = wikilink
        self.image      = image
        self.note       = note
    }
    
    // quando eu crio esse enum eu coloco apenas os valores que eu quero receber da API
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case name
        case species
        case sex
        case dob
        case dod
        case wikilink
        case image
        case note
    }
    
}

// eu preciso ter variaveis ou constantes para todos os elementos da minha API, mas nao necessariamente eles precisam estar em ordem, apenas precisam que o nome seja igual a chave e o tipo também seja o mesmo
