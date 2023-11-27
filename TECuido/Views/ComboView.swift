//
//  ComboView.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

struct ComboView: View {
    @State private var searchText = ""
        @State private var isDropdownVisible = false
        @State private var selectedOption: String? = nil

        let options = ["Option 1", "Option 2", "Option 3", "Another Option", "One More Option"]

        var filteredOptions: [String] {
            if searchText.isEmpty {
                return options
            } else {
                return options.filter { $0.localizedCaseInsensitiveContains(searchText) }
            }
        }

        var body: some View {
            VStack {
                TextField("Search or Enter Option", text: $searchText)
                    .padding()
                    .onTapGesture {
                        isDropdownVisible = true
                    }

                if isDropdownVisible {
                    List(filteredOptions, id: \.self) { option in
                        Button(action: {
                            searchText = option
                            selectedOption = option
                            isDropdownVisible = false
                        }) {
                            Text(option)
                        }
                    }
                    .listStyle(.plain)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                }

                if let selectedOption = selectedOption {
                    Text("Selected: \(selectedOption)")
                        .padding()
                }
            }
        }
}



#Preview {
    ComboView()
}
