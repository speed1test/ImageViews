//
//  ContentView.swift
//  ImageViews
//
//  Created by elsalvador on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Cargar y mostrar una imagen desde una URL
            AsyncImage(url: URL(string: "https://docs-assets.developer.apple.com/published/2014331d7f7b75d09c46cecd9e603335/cta-building-lists-navigation@2x.png")) { phase in
                switch phase {
                case .success(let image):
                    CircleImage(image: image)
                        .offset(y: -130)
                        .padding(.bottom, -130)
                case .failure:
                    Text("Error al cargar la imagen")
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
                Text("Image")
                    .font(.largeTitle)
                    .padding()
                    .bold()
            }
            
            // Resto de tu interfaz de usuario...
        }
        .padding()
    }
}

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            // Elimina el modificador .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}


#Preview {
    ContentView()
}
