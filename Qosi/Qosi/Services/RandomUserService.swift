//
//  RandomUserService.swift
//  Qosi
//
//  Created by owee on 28/01/2020.
//  Copyright © 2020 owee. All rights reserved.
//

import Foundation

class RandomUserService {
    
    private init() {}
    
    static let shared = RandomUserService()
    
    public func load(number:Int, callback:@escaping ([User], Error?)->()) {
        
        guard let url = URL(string: "https://randomuser.me/api/?results=\(number)") else {
                   fatalError("Wrong strong url? Bad Developper you are!")
        }
        
        URLSession.shared.dataTask(with: url) { (data, rep, error) in

            if let data = data {
                
                do {
                    
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(RandomUser.self, from: data)
                    
                    DispatchQueue.main.async {
                        callback(json.results, nil)
                    }
                    
//                    json.results.forEach {
//                        print($0.email)
//                    }
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }

            if let error = error {
                print(error.localizedDescription)
            }

        }.resume()
        

    }
    
}
