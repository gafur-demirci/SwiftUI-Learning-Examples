//
//  BirthdayStore.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 4.01.2025.
//

import SwiftUI

struct BirthdayStore: View {
    
    @State var name: String = ""
    @State var birthday: Date = Date()
    
//    let userBirthday = UserDefaults.standard.object(forKey: "birthday")
//    let userName = UserDefaults.standard.object( forKey: "name")
    
    var body: some View {
        VStack {
            TextField("Insert User Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            DatePicker("Choose Birthday", selection: $birthday, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding()
            Text("\(name)'s Birthday is \(birthday.formatted(date: .numeric, time: .omitted))")
//            Text("User Birthday")
//                .font(.title)
//                .bold()
//                .foregroundStyle(.black)
//                .padding()
//            Text("Birthday is : \(userBirthday ?? "") \n Name is : \(userName ?? "")")
//                .font(.title)
//                .bold()
//                .foregroundStyle(.black)
//                .padding()
//            Button( action: {
//                setBirthday()
//            }, label: {
//                Text("Save")
//                    .font(.title)
//                    .bold()
//                    .foregroundStyle(.black)
//            })
//            .buttonStyle(.borderedProminent)
//            .font(.title)
//            .controlSize(.regular)
//            .padding()
        }
        .padding()
    }
    
//    func setBirthday() {
//        UserDefaults.standard.set(birthday.formatted(date: .numeric, time: .omitted), forKey: "birthday")
//        UserDefaults.standard.set(name, forKey: "name")
//        UserDefaults.standard.synchronize()
//    }
}

#Preview {
    BirthdayStore()
}
