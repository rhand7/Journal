//
//  EntryController.swift
//  Journal
//
//  Created by handje on 6/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation

class EntryController {
    
    var entries = [Entry]()
    static fileprivate let entriesKey = "entriesKey"
    static let shared = EntryController()
    
    init() {
        load()
    }
    
    // MARK: - CRUD 
    
    func addNewEntryWith(title: String, bodyText: String) {
        let entry = Entry(title: title, bodyText: bodyText)
        entries.append(entry)
        save()
    }
    
    func updateEntry(entry: Entry, title: String, bodyText: String) {
        entry.title = title
        entry.bodyText = bodyText
        save()
    }
    
    func deleteEntry(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        save()
    }
    
    // MARK: - save/load UserDefaults
    
    private func save() {
        let entryDictionaries = entries.map {$0.dictionaryRepresentation()}
        UserDefaults.standard.set(entryDictionaries, forKey: EntryController.entriesKey)
    }
    
    private func load() {
        guard let entryDictionaries = UserDefaults.standard.object(forKey: EntryController.entriesKey) as? [[String: Any]] else { return }
        entries = entryDictionaries.flatMap ({ Entry(dictionary: $0) })
    }
}
