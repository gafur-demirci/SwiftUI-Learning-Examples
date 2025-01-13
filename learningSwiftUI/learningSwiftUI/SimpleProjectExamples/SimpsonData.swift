//
//  SimpsonData.swift
//  learningSwiftUI
//
//  Created by Abdulgafur Demirci on 13.01.2025.
//

import SwiftUI
import Observation

class Simpson : Identifiable {
    var id = UUID()
    var name: String
    var picture: String
    var job: String?
    
    init(name: String, picture: String, job: String?) {
        self.name = name
        self.picture = picture
        self.job = job ?? ""
    }
}

@Observable class SimpsonData {
    
    var simpsons: [Simpson] = []
    
    init () {
        simpsons.append(Simpson(name: "Homer Simpson", picture: "homer", job: "Nuclear Safety Inspector, Former Technical Supervisor"))
        simpsons.append(Simpson(name: "Bartholomew JoJo Simpson", picture: "bart", job: "Student at Springfield Elementary"))
        simpsons.append(Simpson(name: "Lisa Marie Simpson", picture: "lisa", job: "Babysitter"))
        simpsons.append(Simpson(name: "Marge Simpson", picture: "marge", job: "Housewife"))
        simpsons.append(Simpson(name: "Apu Nahasapeemapetilon", picture: "apu", job: "Medical Student"))
        simpsons.append(Simpson(name: "Edna Krabappel–Flanders", picture: "edna", job: "Fourth Grade Teacher at Springfield Elementary"))
        simpsons.append(Simpson(name: "Krusty the Clown", picture: "krusty", job: "Television Personality"))
        simpsons.append(Simpson(name: "Milhouse Van Houten", picture: "milhouse", job: "Student at Springfield Elementary"))
        simpsons.append(Simpson(name: "Charles Montgomery Burns", picture: "montogomery", job: "Owner of Springfield Nuclear Power Plant, World War II Veteran"))
        simpsons.append(Simpson(name: "Jr. Nedward Flanders", picture: "ned", job: "Fourth Grade Teacher, Soup Kitchen Worker"))
        simpsons.append(Simpson(name: "Nelson Mandela Muntz", picture: "nelson", job: "Student at Springfield Elementary"))
        simpsons.append(Simpson(name: "Todd Homer Flanders", picture: "tod", job: "Student at Springfield Elementary School"))
    }
}
