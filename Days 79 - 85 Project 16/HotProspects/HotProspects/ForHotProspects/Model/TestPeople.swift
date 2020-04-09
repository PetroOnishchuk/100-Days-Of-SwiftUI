//
//  TestPeople.swift
//  HotProspects
//
//  Created by Petro Onishchuk on 4/8/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//

import Foundation


class TestPeople {
    
    static func createArray() -> [Prospect] {
    let person1 = Prospect()
    person1.name = "Robert Downey Jr."
    person1.emailAddress = "robertDowneyJr@mail.com"
    person1.dateAdded = Date()
    
    let person2 = Prospect()
    person2.name = "Tom Hanks"
    person2.emailAddress = "tomHanks@mail.com"
    person2.dateAdded = Date()
    
    let person3 = Prospect()
    person3.name = "Leonardo DiCaprio"
    person3.emailAddress = "leonardoDiCaprio@mail.com"
    person3.dateAdded = Date()
    let person8 = Prospect()
    person8.name = "Tom Cruise"
    person8.emailAddress = "tomCruise@mail.com"
    person8.dateAdded = Date()
    let person5 = Prospect()
    person5.name = "Will Smith"
    person5.emailAddress = "willSmith@mail.com"
    person5.dateAdded = Date()
    let person6 = Prospect()
    person6.name = "Scarlet Johansson"
    person6.emailAddress = "scarletJohansson@mail.com"
    person6.dateAdded = Date()
    let person7 = Prospect()
    person7.name = "Natali Portman"
    person7.emailAddress = "nataliPortman@mail.com"
    person7.dateAdded = Date()
    let person4 = Prospect()
    person4.name = "Letitia Wright"
    person4.emailAddress = "letitiaWright@mail.com"
    person4.dateAdded = Date()
    let peopleArray = [person1, person2, person3, person4, person5, person6, person7, person8]
        
        
    return peopleArray
    }
}

