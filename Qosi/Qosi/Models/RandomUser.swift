import Foundation

public struct RandomUser : Codable {
    
    public var results : [User]
    
//    var infos : String
    
    enum CodingKeys : String, CodingKey {
        case results
    }
    
}
