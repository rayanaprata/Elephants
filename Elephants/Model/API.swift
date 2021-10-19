//
//  API.swift
//  Elephants
//
//  Created by Rayana Prata Neves on 18/10/21.
//

import Foundation

struct API {
    
    // https://elephant-api.herokuapp.com/elephants
    let baseURL = "https://elephant-api.herokuapp.com"
    
    /// Returns the URL String to Endpoint Elephants
    func setElephantsURL() -> String {
        return "\(baseURL)/\(EndPoints.elephants)"
    }
    
    /// Returns the URL String to Endpoint Random Elephant
    func setRandomElephantURL() -> String {
        return "\(baseURL)/\(EndPoints.elephants)/\(EndPoints.random)"
    }
    
    /// Returns the URL String to Endpoint Sex Elephants
    func setSexElephantURL(_ sex: Sex) -> String {
        return "\(baseURL)/\(EndPoints.elephants)/\(EndPoints.sex)/\(sex))"  //  need add sex to url /elephants/sex/{SEX}
    }
    
    /// Returns the URL String to Endpoint Name Elephant
    func setNameElephantURL(_ name: String) -> String {
        return "\(baseURL)/\(EndPoints.elephants)/\(EndPoints.name)/\(name)"  //  need add sex to url /elephants/name/{NAME}
    }
    
    /// Returns the URL String to Endpoint Species Elephant
    func setNameElephantURL(_ specie: Specie) -> String {
        return "\(baseURL)/\(EndPoints.elephants)/\(EndPoints.species)/\(specie)"  //  need add sex to url /elephants/name/{NAME}
    }
    
//    // :::::::::::: fazendo sem closure ::::::::::::
//
//    /// Returns an array of Elephant , but, If returns a empty array []
//    func getElephants(urlString: String, method: HTTPMethod) -> [Elephant] {
//
//        // Config da Sessão
//        let config: URLSessionConfiguration = .default
//
//        // Sessão
//        let session: URLSession = URLSession(configuration: config)
//
//        // URL
//        guard let url: URL = URL(string: urlString) else { return [] }
//
//        // URL Request
//        var urlRequest: URLRequest = URLRequest(url: url)
//
//        // Add Method GET to URL Request
//        urlRequest.httpMethod = "\(method)"
//
//        // Execute the Request HTTP    -> aqui fica a chamada/requisição da API
//
//        var arrayElephants: [Elephant] = []
//
//        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
//
//            var statusCode: Int = 0
//            if let response = urlResponse as? HTTPURLResponse {
////                outra forma de fazer:
////                if response.statusCode >= 300 {
////                    return
////                }
//
//                statusCode = response.statusCode
//            }
//
//            guard let data = result else { return } // precisa retornar o erro de DATA = nil
//
//            // preciso fazer um try catch pois se der erro eu preciso retornar esse erro
//            do {
//                // criar um decoder
//                let decoder: JSONDecoder = JSONDecoder()
//
//                // decodificar o retorno
//                arrayElephants = try decoder.decode([Elephant].self, from: data)
//
////                outra forma de fazer (sem precisar criar um decoder):
////                arrayElephants = try JSONDecoder().decode([Elephant].self, from: data)
//
//            } catch {
//                // error
//                print("deu erro")
//            }
//
//        })
//
//        task.resume()
//
//        sleep(2)
//        return arrayElephants
//    }
    
    // :::::::::::: fazendo com closure ::::::::::::
    
    func getElephants(urlString: String, method: HTTPMethod, response: @escaping ([Elephant]) -> Void, errorReturned: @escaping (String) -> Void) {
        
        let config: URLSessionConfiguration = .default
        let session: URLSession = URLSession(configuration: config)
        guard let url: URL = URL(string: urlString) else { return }
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "\(method)"

        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in

            var statusCode: Int = 0
            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
            }

            guard let data = result else { return } // precisa retornar o erro de DATA = nil
            
            // preciso fazer um try catch pois se der erro eu preciso retornar esse erro
            do {
                let decoder: JSONDecoder = JSONDecoder()
                response(try decoder.decode([Elephant].self, from: data))

            } catch {
                errorReturned("Nao retornou os dados por algum motivo :/")
            }

        })

        task.resume()
        
    }
    
}
