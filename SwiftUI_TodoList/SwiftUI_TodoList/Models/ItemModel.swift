//
//  ItemModel.swift
//  SwiftUI_TodoList
//
//  Created by Ahmed Amin on 30/10/2022.
//

import Foundation


struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}


