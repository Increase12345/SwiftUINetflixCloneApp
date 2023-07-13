//
//  HeaderView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 15) {
            Image("logoNetflix")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
            Spacer()
            
            Image(systemName: "play.rectangle")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .foregroundColor(.secondary)
            
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
