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
    func setSexElephantURL() -> String {
        return "\(baseURL)/\(EndPoints.elephants)/\(EndPoints.sex)/"  //  need add sex
    }
    
//    func getElephants(urlString: String, method: HTTPMethod, response: @escaping ([Elephant]) -> Void, errorReturned: @escaping (String) -> Void) {
//        let elephant = Elephant(_id: "", name: "", species: "", sex: "", dob: "", dod: "", wikilink: "", image: "", note: "")
//
//        response([elephant])
//    }
    
    /// Returns an array of Elephant , but, If returns a empty array []
    func getElephants(urlString: String, method: HTTPMethod) -> [Elephant] {
        
        // Config da Sessão
        let config: URLSessionConfiguration = .default
        
        // Sessão
        let session: URLSession = URLSession(configuration: config)
        
        // URL
        guard let url: URL = URL(string: urlString) else { return [] }
        
        // URL Request
        var urlRequest: URLRequest = URLRequest(url: url)
        
        // Add Method GET to URL Request
        urlRequest.httpMethod = "\(method)"
        
        // Execute the Request HTTP    -> aqui fica a chamada/requisição da API
        
        var arrayElephants: [Elephant] = []
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
            
            var statusCode: Int = 0
            if let response = urlResponse as? HTTPURLResponse {
                statusCode = response.statusCode
            }
            
            guard let data = result else { return } // precisa retornar o erro de DATA = nil
            
            // preciso fazer um try catch pois se der erro eu preciso retornar esse erro
            do {
                // criar um decoder
                let decoder: JSONDecoder = JSONDecoder()
                
                // decodificar o retorno
                arrayElephants = try decoder.decode([Elephant].self, from: data)
            } catch {
                // error
            }
            
        })
        
        task.resume()
        
        return arrayElephants
    }
}


