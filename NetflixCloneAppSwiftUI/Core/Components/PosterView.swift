//
//  PosterView.swift
//  NetflixCloneAppSwiftUI
//
//  Created by Nick Pavlov on 7/12/23.
//

import SwiftUI
import Kingfisher

struct PosterView: View {
    let movies: [Movie]
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                KFImage(URL(string: movies.first?.posterImage ?? ""))
                    .resizable()
                    .scaledToFill()
                LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                    .opacity(0.8)
                
                
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
        PosterView(movies: [Movie]())
    }
}
