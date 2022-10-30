//
//  ListView.swift
//  SwiftUI_TodoList
//
//  Created by Ahmed Amin on 30/10/2022.
//

import SwiftUI

struct ListView: View {
    //MARK: - Variables
    @State private var items: [String] = [
        "This is the first item!",
        "This is the second",
        "Third"
        ]
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
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

