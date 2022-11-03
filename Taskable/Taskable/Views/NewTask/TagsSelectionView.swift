//
//  TagsSelectionView.swift
//  Taskable
//
//  Created by Ekaterina Grishina on 25/10/22.
//

import SwiftUI

struct TagsSelectionView: View {
    
    @Binding var selectedTag: Tag?
    @State private var selectedItem: Tag?
    @State private var gridItems = Array(repeating: GridItem(.adaptive(minimum: 80), spacing: 20), count: 3)
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 30) {
                ForEach(Tag.allCases) { tag in
                    TagItemView(associatedTag: tag, selectedTag: $selectedItem)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    selectedTag = selectedItem
                    dismiss()
                }
            }
        }
    }
}

struct TagItemView: View {
    
    let associatedTag: Tag
    @Binding var selectedTag: Tag?
    
    var body: some View {
        Button(action: {
            if associatedTag == selectedTag {
                selectedTag = nil
            } else {
                selectedTag = associatedTag
            }
        }, label: {
            VStack {
                associatedTag.image
                    .imageScale(.large)
                Spacer()
                Text(associatedTag.rawValue.capitalized)
                    .font(.system(size: 18))
            }
            .foregroundColor(selectedTag == associatedTag ? .purple : .black)
        })
        .padding([.horizontal], 12)
    }
}

// MARK: - Preview

struct TagsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TagsSelectionView(selectedTag: .constant(nil))
    }
}
