//
//  ToDoManager.swift
//  Todo
//
//  Created by Leen Tawalbeh on 29/07/2023.
//

import Foundation

import SwiftUI

class TodoManager: ObservableObject {
    @Published var todos: [Todo] = [] {
        didSet {
            save()
        }
    }

    init() {
        load()
    }

    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        return documentsDirectory.appendingPathComponent(plistName)
    }

    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }

    func loadSampleData() {
        todos = Todo.sampleTodos
    }

    func load() {
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let propertyListDecoder = PropertyListDecoder()

        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
