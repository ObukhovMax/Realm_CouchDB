import Foundation

struct Welcome: Codable {
//    let totalRows, offset: Int
    let rows: [Row]

    enum CodingKeys: String, CodingKey {
//        case totalRows = "total_rows"
        case rows
    }
}

// MARK: - Row
struct Row: Codable {
//    let id, key: String
//    let value: Value
    let doc: Doc
}

// MARK: - Doc
struct Doc: Codable {
//    let id, rev: String
    let iD, changeNumber: Int
    let docBody: String

    enum CodingKeys: String, CodingKey {
 //       case id = "_id"
   //     case rev = "_rev"
        case iD, changeNumber, docBody
    }
}

//struct Value: Codable {
//    let rev: String
//}

extension Row : Displayable {
    var docDict: Doc {
        doc
    }
    
    var idText: Int {
        0
    }
    
    var changeNumberText: Int {
        0
    }
    
    var docBodyText: String {
        "docBody"
    }
}

extension Doc : Displayable {
    var docDict: Doc {
        self
    }
    
    var idText: Int {
        iD
    }
    
    var changeNumberText: Int {
        changeNumber
    }
    
    var docBodyText: String {
        docBody
    }
}

