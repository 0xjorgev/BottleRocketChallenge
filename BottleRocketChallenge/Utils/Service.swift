//
//  Service.swift
//  BottleRocketChallenge
//
//  Created by Jorge Mendoza on 3/8/19.
//  Copyright © 2019 Jorge Mendoza. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    let session = URLSession.shared
    
    private let baseUrl = "https://s3.amazonaws.com"
    
    private func singleObjectGetRequest<T:Decodable>(url:String, model:T.Type, debug:Bool = false, completion: @escaping (T?, Error?) -> Void ){
        
        
        var reqEndpoint = URL.init(string: baseUrl)
        
        reqEndpoint?.appendPathComponent(url)
        
        let dataTask = session.dataTask(with: reqEndpoint!) {
            (data, response, error) in
            
            guard let responseData = data else {
                completion(nil, error)
                return
            }
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                
                if debug {
                    
                    print("jsonData: ", String(data: responseData, encoding: .utf8) ?? "no body data")
                }
                
                let decodedModel = try decoder.decode(T.self, from: responseData)
                
                completion(decodedModel, nil)
            } catch {
                print("error trying to convert data to JSON")
                print(error)
                completion(nil, error)
            }
        }
        
        dataTask.resume()
        
    }
    
    func fetchRestaurants(component:String, handler: @escaping (RestaurantWrapper?, Error?) -> Void ){
        
        self.singleObjectGetRequest(url: component, model: RestaurantWrapper.self, debug:true) { (res, err) in
            
            if err == nil {
                
                handler(res, nil)
                
            } else {
                
                handler(nil, err)
                
                print("Error: \(err?.localizedDescription ?? "Unknown error")")
                
            }
        }
    }

}
