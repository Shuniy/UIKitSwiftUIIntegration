//
//  ContentView.swift
//  UIKitSwiftUIIntegration
//
//  Created by Shubham Kumar on 31/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var image:Image?
    @State private var showingImagePicker = false
    @State private var inputImage:UIImage?
    
    func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
        image = Image(uiImage: inputImage)

    }
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button ("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) {
            _ in loadImage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
