//
//  ContentView.swift
//  Todo2
//
//  Created by Leen Tawalbeh on 11/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [
        Todo(title: "wake up", isCompleted: true),
        Todo(title: "get milk"),
        Todo(title: "shower"),
        Todo(title: "have breakfast"),
        Todo(title: "survive the day")
    ]
    var body: some View {
        NavigationStack{
            List($todos) { $todo in
                HStack{
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
