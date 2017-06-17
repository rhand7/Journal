//
//  Entry.swift
//  Journal
//
//  Created by handje on 6/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation

class Entry {
    
    static fileprivate let titleKey = "title"
    static fileprivate let bodyTextKey = "bodyText"
    
    var title: String
    var bodyText: String
    
    init(title: String, bodyText: String) {
        self.title = title
        self.bodyText = bodyText
    }
    
    func dictionaryRepresentation() -> [String: Any] {
        return [Entry.titleKey: title, Entry.bodyTextKey: bodyText] 
    }
   
    convenience init?(dictionary: [String: Any]) {
        guard let title = dictionary[Entry.titleKey] as? String,
            let bodyText = dictionary[Entry.bodyTextKey] as? String else { return nil }
        self.init(title: title, bodyText: bodyText) 
    }
}

extension Entry: Equatable {

    static func == (lhs:Entry, rhs:Entry) -> Bool {
    return
        lhs.title == rhs.title && 
        lhs.bodyText == rhs.bodyText
    }
}
