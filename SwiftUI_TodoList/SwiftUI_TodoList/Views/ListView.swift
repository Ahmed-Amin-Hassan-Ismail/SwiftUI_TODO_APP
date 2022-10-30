//
//  ListView.swift
//  SwiftUI_TodoList
//
//  Created by Ahmed Amin on 30/10/2022.
//

import SwiftUI

struct ListView: View {
    //MARK: - Variables
    @State private var items: [ItemModel] = [
        ItemModel(title: "This is first item", isCompleted: false),
        ItemModel(title: "This is second", isCompleted: true),
        ItemModel(title: "Third", isCompleted: false)
        ]
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .navigationTitle("Todo List 📝")
        .listStyle(.plain)
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

