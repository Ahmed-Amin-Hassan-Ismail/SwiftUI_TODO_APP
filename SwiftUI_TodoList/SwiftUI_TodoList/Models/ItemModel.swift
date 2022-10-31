//
//  ItemModel.swift
//  SwiftUI_TodoList
//
//  Created by Ahmed Amin on 30/10/2022.
//

import Foundation


struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString ,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    
    func updateCompletion() -> ItemModel {
        return ItemModel(title: self.title, isCompleted: !self.isCompleted)
    }
}


