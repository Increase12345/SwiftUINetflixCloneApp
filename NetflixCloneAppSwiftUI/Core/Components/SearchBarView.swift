//
//  SearchBarView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/18/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search for Movie or Tv show", text: $text)
                .textInputAutocapitalization(.never)
                .padding(8)
                .padding(.horizontal, 24)
                .padding(.trailing, 50)
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
    }
}
