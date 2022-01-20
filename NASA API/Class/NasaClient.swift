//
//  NasaClient.swift
//  NASA API
//
//  Created by erick eduardo on 16/01/22.
//

import Foundation

class NasaClient {
    
    typealias JSON = [String: String]
    
    static func getJSON(with completition: @escaping (JSON) -> ()) {
    
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=BaA0Yg62lcRMNRwwrabkW24Hg9VN5Ky4RNdx9FAM"
        
        let url = URL(string: urlString)
        
        guard let unwrappedURL = url else {return}
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
        
            guard let unwrappedDataReceived = data else {return}
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDataReceived, options: []) as! JSON
                
                completition(responseJSON)
               
            } catch {
                
                print(error)
            }
        
        }
        task.resume()
    }
    
}
