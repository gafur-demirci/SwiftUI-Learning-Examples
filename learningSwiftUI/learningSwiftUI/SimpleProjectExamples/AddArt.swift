//
//  AddArt.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 14.01.2025.
//

import SwiftUI
import CoreData

enum FocusInput: Hashable {
    case name
    case artist
    case year
}

struct AddArt: View {
    
    @State var name: String = ""
    @State var artist: String = ""
    @State var year: String = ""
    @State var image: UIImage?
    @State var isPresented: Bool = false
    @FocusState var focus: FocusInput?
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .onTapGesture {
                            isPresented = true
                        }
                } else {
                    Image("nocover")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .onTapGesture {
                            isPresented = true
                        }
                }
                TextField("Name of Art", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .focused($focus, equals: .name)
                    .padding()
                TextField("Artist", text: $artist)
                    .textFieldStyle(.roundedBorder)
                    .focused($focus, equals: .artist)
                    .padding()
                TextField("Year", text: $year)
                    .textFieldStyle(.roundedBorder)
                    .focused($focus, equals: .year)
                    .padding()
                Button("Add") {
                    print(name)
                    print(artist)
                    print(year)
                    print(image!)
                    addNewArt()
                }
                .disabled(name.isEmpty || artist.isEmpty || year.isEmpty || image == nil)
                .buttonStyle(.borderedProminent)
                NavigationLink(destination: ArtBook()) {
                    Text("Go Art Book")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding(.bottom, 5)
                }
            }
            .sheet(isPresented: $isPresented) {
                MyImagePicker(selectedImage: $image)
            }
        }
    }
    
    func clearInput() {
        name = ""
        artist = ""
        year = ""
        image = nil
    }
    
    func addNewArt() {
        let appDelegate = ArtAppDelegate()

        let context = appDelegate.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paints", into: context)
        
        newPainting.setValue(UUID(), forKey: "id")
        
        newPainting.setValue(name, forKey: "name")
        
        newPainting.setValue(artist, forKey: "artist")
        
        if let intYear = Int(year) {
            newPainting.setValue(intYear, forKey: "year")
        }
        
        if let imageData = image!.jpegData(compressionQuality: 0.5) {
            newPainting.setValue(imageData, forKey: "image")
        }
        
        do {
            try context.save()
            print("Saved")
        } catch {
            print("Error while saving")
        }
    }
}

#Preview {
    AddArt()
}
