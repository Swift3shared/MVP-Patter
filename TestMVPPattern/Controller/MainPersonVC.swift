//
//  MainPersonVC.swift
//  TestMVPPattern
//
//  Created by sok channy on 12/10/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import UIKit

class MainPersonVC: UIViewController{

    @IBOutlet weak var personTableView: UITableView!
    
    @IBOutlet weak var emptyView: UIView!
    
    fileprivate var personToDisplay = [Person]()
    
    fileprivate let personPresenter = PersonPresenter(personService: PersonService())
    
    @IBOutlet weak var activityIndcatorView: UIActivityIndicatorView!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        personTableView.delegate = self
        personTableView.dataSource = self
        
        personPresenter.attactDelegate(self)
        
        personPresenter.getPerson()
    }
}

extension MainPersonVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personToDisplay.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCellID",for:indexPath)
        cell.textLabel?.text = personToDisplay[indexPath.row].name
        cell.detailTextLabel?.text = "Sex = \(personToDisplay[indexPath.row].sex!)Age = \(personToDisplay[indexPath.row].age!)"
        return cell
    }
}

extension MainPersonVC: PersonPresenterDelegate {
    func startLoading() {
        activityIndcatorView.startAnimating()
    }
    func finishLoading() {
        activityIndcatorView.stopAnimating()
    }
    func setEmptyPerson() {
        personTableView.isHidden = true
        emptyView.isHidden = false
    }
    func setPerson(_ person: [Person]) {
        
        personToDisplay = person
        
        personTableView.isHidden = false
        emptyView.isHidden = true
        
        personTableView.reloadData()
    }
}

