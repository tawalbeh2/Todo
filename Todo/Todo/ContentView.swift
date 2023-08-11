//
//  ContentView.swift
//  Todo
//
//  Created by Leen Tawalbeh on 22/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var todoManager = TodoManager()
    @State private var showAddSheet = false
    @State private var showConfirmAlert = false


    var body: some View {

        NavigationStack {
            List($todoManager.todos, editActions: [.all]) { $todo in
                TodoRowView(todo: $todo)
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup {
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "list.bullet.clipboard.fill")
                    }

                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                NewTodoView(sourceArray: $todoManager.todos)
            }
            .alert("Load sample data? Warning: This cannot be undone!", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleData()
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
