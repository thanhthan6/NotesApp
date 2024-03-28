//
//  APIFunctions.swift
//  NoteApp
//
//  Created by Macbook on 13/11/2023.
//

import Foundation
import Alamofire

struct Note: Decodable {
    var title: String
    var date: String
    var _id: String
    var note: String
}

class APIFunctions {
    
    var delegate: DataDelegate?
    static let functions = APIFunctions()
    
    func fetchNotes() {
        AF.request("http://192.168.0.105:8081/fetch").response { response in
            print(response.data)
            let data = String(data: response.data!, encoding: .utf8)
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func AddNote(date: String, title: String, note: String) {
        AF.request("http://192.168.0.105:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note]).responseJSON { response in
            print(response)
        }
    }
    
    func updateNote(date: String, title: String, note: String, id:  String) {
            AF.request("http://192.168.0.105:8081/update", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title, "date": date, "note": note, "id": id]).responseJSON { response in
                print(response)
            }
    }
    
}
