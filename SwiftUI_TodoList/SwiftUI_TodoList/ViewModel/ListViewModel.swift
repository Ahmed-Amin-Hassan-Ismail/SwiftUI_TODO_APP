//
//  ListViewModel.swift
//  SwiftUI_TodoList
//
//  Created by Ahmed Amin on 31/10/2022.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    //MARK: - Variables
    @Published var items: [ItemModel] = []
    
    //MARK: - Init
    init() {
        getItems()
    }
    
    //MARK: - Methods
    private func getItems() {
        let items = [
            ItemModel(title: "This is first item", isCompleted: false),
            ItemModel(title: "This is second", isCompleted: true),
            ItemModel(title: "Third", isCompleted: false)
            ]
        
        self.items.append(contentsOf: items)
    }
    
    func removeItem(at index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
