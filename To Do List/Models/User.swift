import Foundation
import SwiftUI

struct User {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval

    func asDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "email": email,
            "joined": joined
        ]
    }
}
