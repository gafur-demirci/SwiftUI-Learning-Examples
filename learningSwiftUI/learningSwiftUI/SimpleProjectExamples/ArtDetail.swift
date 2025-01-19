//
//  ArtDetail.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 16.01.2025.
//

import SwiftUI

struct ArtDetail: View {
    
//    let persistenceController = PersistenceController.shared
//    @FetchRequest(
//        entity: Paints.entity(),
//        sortDescriptors: [NSSortDescriptor(keyPath: \Paints.name, ascending: true)]
//    )
//    var paints: FetchedResults<Paints>
    @State var art: Paints
    
    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: UIImage(data: art.image! as Data)!)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            Text(art.name!)
                .font(.title.bold())
            Text(art.artist!)
                .font(.headline)
                .padding()
            Text(String(art.year))
                .font(.headline)
                .padding()
            Spacer()
            
        }
        .navigationTitle("Art")
    }
}

//#Preview {
//    ArtDetail(art: paints.first!)
//        .environment(\.managedObjectContext, persistenceController.context)
//}
