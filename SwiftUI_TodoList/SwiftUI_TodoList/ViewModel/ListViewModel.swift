//
//  ListViewModel.swift
//  SwiftUI_TodoList
//
//  Created by Ahmed Amin on 31/10/2022.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    //MARK: - Variables
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems() 
        }
    }
    private let itemsKey: String = "items_list"
    
    //MARK: - Init
    init() {
        getItems()
    }
    
    //MARK: - Methods
    private func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        do {
            items = try JSONDecoder().decode([ItemModel].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
}
