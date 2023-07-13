//
//  PosterView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI

struct PosterView: View {
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                Image("poster")
                    .resizable()
                    .scaledToFill()
                LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                
                
                HStack(spacing: 30) {
                    Button {
                        
                    } label: {
                        Text("Play")
                            .foregroundColor(.white)
                            .frame(width: 130, height: 35)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white)
                            )
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Download")
                            .foregroundColor(.white)
                            .frame(width: 130, height: 35)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white)
                            )
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView()
    }
}
