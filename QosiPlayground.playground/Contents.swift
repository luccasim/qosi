import UIKit
import PlaygroundSupport

let path = "https://randomuser.me/api/?results=10"

if let url = URL(string: path) {

    let request = URLRequest(url: url)

    URLSession.shared.dataTask(with: request) { (data, rep, error) in
        
        if let data = data {
            
            print(data)
            
            do {

                let decoder = JSONDecoder()
                let json = try decoder.decode(RandomUser.self, from: data)

                json.results.forEach {
                    print($0.email)
                }
            } catch let error {
                print(error.localizedDescription)
            }


        }

        if let error = error {
            print(error.localizedDescription)
        }

    }.resume()
}

//if let url = Bundle.main.url(forResource: "reponse", withExtension: "txt") {
//
//    do {
//
//        let data = try Data(contentsOf: url)
//        let decoder = JSONDecoder()
//        let json = try decoder.decode(RandomUser.self, from: data)
//
//        json.results.forEach {
//            print($0.email)
//        }
//
//
//    } catch let error {
//        print(error.localizedDescription)
//    }
//
//}



PlaygroundPage.current.finishExecution()
