//
//  NewPostView.swift
//  NewPostView
//
//  Created by Ome Asraf on 8/12/21.
//

import SwiftUI

struct NewPostView: View {
    var steps:[Step] = [
        Step(description: "Add Eggs", oderNumber: 0),
        Step(description: "Add Eggs", oderNumber: 1),
        Step(description: "Add Eggs", oderNumber: 2),
        Step(description: "Add Eggs", oderNumber: 3),
        Step(description: "Add Eggs", oderNumber: 4),
        Step(description: "Add Eggs", oderNumber: 5)
    ]
    var ingredients:[Ingredient] = [
        Ingredient(name: "Eggs", amount: 3, amountUnit: .whole, orderNumber: 0),
        Ingredient(name: "Carrot", amount: 2, amountUnit: .whole, orderNumber: 1),
        Ingredient(name: "Eggs", amount: 3, amountUnit: .whole, orderNumber: 2),
        Ingredient(name: "Carrot", amount: 2, amountUnit: .whole, orderNumber: 3),
        Ingredient(name: "Eggs", amount: 3, amountUnit: .whole, orderNumber: 4),
        Ingredient(name: "Carrot", amount: 2, amountUnit: .whole, orderNumber: 5),
        Ingredient(name: "Eggs", amount: 3, amountUnit: .whole, orderNumber: 6),
        Ingredient(name: "Carrot", amount: 2, amountUnit: .whole, orderNumber: 7),
        Ingredient(name: "Eggs", amount: 3, amountUnit: .whole, orderNumber: 8),
        Ingredient(name: "Carrot", amount: 2, amountUnit: .whole, orderNumber: 9),
        Ingredient(name: "Carrot", amount: 2, amountUnit: .whole, orderNumber: 10),
        Ingredient(name: "Carrot", amount: 2, amountUnit: .whole, orderNumber: 11),
    ]
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image = Image(systemName: "timelapse")
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack{
            HStack{
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
                    .background(Color.blue)
            }
            .onTapGesture {
                self.showingImagePicker = true
                
            }
            HStack{
                VStack {
                    Text("Ingredients")
                    ScrollView {
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(ingredients, id: \.id) { ing in
                                    Text("\(ing.amount) \(ing.name)")
                                    
                                }
                            }.padding()
                            Spacer()
                        }
                        
                    }.frame(width: UIScreen.main.bounds.size.width / 2)
                        .clipped()
                }.background(Color.yellow)
                VStack {
                    Text("Steps")
                    ScrollView {
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(steps, id: \.id) { stp in
                                    Text("\(stp.description)")
                                    
                                }
                            }.padding()
                            Spacer()
                        }
                        
                    }.frame(width: UIScreen.main.bounds.size.width / 2)
                        .clipped()
                }.background(Color.green)
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
            ImagePicker(image: self.$inputImage, sourceType: self.$sourceType)
        }
    }
    
    func loadImage(){
        guard let inputImage = inputImage else {
            return
        }
        self.image = Image(uiImage: inputImage)

    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
