//
//  PersonPresenter.swift
//  TestMVPPattern
//
//  Created by sok channy on 12/10/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import Foundation

protocol PersonPresenterDelegate: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setPerson(_ person: [Person])
    func setEmptyPerson()
}

class PersonPresenter{
    fileprivate var personService:PersonService?
    weak fileprivate var personPresenterDelegate:PersonPresenterDelegate?
    
    init(personService:PersonService) {
        self.personService = personService
    }
    
    func attactDelegate(_ personPresenterDelegate:PersonPresenterDelegate) {
        self.personPresenterDelegate = personPresenterDelegate
    }
    
    func getPerson(){
        
        personPresenterDelegate?.startLoading()
        
        personService?.getPerson(
            success: { data in
            
                self.personPresenterDelegate?.finishLoading()
            
                if let persons = data["DATA"] {
                    if persons.count == 0 {
                        self.personPresenterDelegate?.setEmptyPerson()
                    }
                    else{
                        self.personPresenterDelegate?.setPerson(persons)
                    }
                }
            },
            error: { data in
                print("Error respnse \(data)")
            }
            
        );
        
        
    }
}
