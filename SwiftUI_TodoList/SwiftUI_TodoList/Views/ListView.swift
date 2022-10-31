//
//  ListView.swift
//  SwiftUI_TodoList
//
//  Created by Ahmed Amin on 30/10/2022.
//

import SwiftUI

struct ListView: View {
    //MARK: - Variables
    @EnvironmentObject var listViewModel: ListViewModel
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.removeItem(at:))
            .onMove(perform: listViewModel.moveItem(from:to:))
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
        .environmentObject(ListViewModel())
    }
}

