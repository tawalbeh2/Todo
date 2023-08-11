//
//  Todo.swift
//  Todo2
//
//  Created by Leen Tawalbeh on 11/08/2023.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title : String
    var isCompleted = false
}
