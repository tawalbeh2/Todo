//
//  Todo.swift
//  Todo
//
//  Created by Leen Tawalbeh on 22/07/2023.
//
import Foundation

struct Todo: Identifiable, Codable {

    var id = UUID()
    var title: String
    var subtitle = ""
    var isCompleted = false

}

