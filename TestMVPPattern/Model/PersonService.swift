//
//  PersonService.swift
//  TestMVPPattern
//
//  Created by sok channy on 12/10/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

var persons:[Person] = [Person(name:"Sok Channy",sex:"Male",age:29),
                        Person(name:"Yevo Chey",sex:"FeMale",age:19),
                        Person(name:"Makara Kev",sex:"Male",age:89)
]

typealias success = ([String:[Person]]) -> ()
typealias error = (String) -> ()

class PersonService{

    func getPerson(success:@escaping success, error:error) {
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            success(["DATA": persons])
        }
        error("No error found")
    }
    
    func postPerson(person:Person) {
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            persons.append(person)
        }
    }
    
    func deletPerson() {
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            
        /// no implement
            
        }
    }
}
