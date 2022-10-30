//
//  ListRowView.swift
//  SwiftUI_TodoList
//
//  Created by Ahmed Amin on 30/10/2022.
//

import SwiftUI

struct ListRowView: View {
    //MARK: - Variables
    let item: ItemModel
    
    //MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
                
            Text(item.title)
                .strikethrough(item.isCompleted)
            Spacer()
        }
        .font(.title)
        .padding(.vertical, 8)
    }
}

//MARK: - Preview
struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First Item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item!", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
