//
//  ContactsViewController.swift
//  ContactBook
//
//  Created by Suelen Vicente on 2022-04-20.
//

import UIKit

class ContactsViewController: UITableViewController, UISearchResultsUpdating{
    var contacts = [Contact]()
    var filteredContacts = [Contact]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a contact"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(userManagement))
        
        tableView.rowHeight = 60
        tableView.allowsSelection = false
        
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewCell")
    }
    
    @objc
    func userManagement() {
        let optionMenu = UIAlertController(title: nil, message: "User Management", preferredStyle: .actionSheet)
        
        let addCustomUser = UIAlertAction(title: "Add Custom User", style: .default) { (alert: UIAlertAction!) in
            self.addCustomUserAction()
        }
        
        let loadFromAPI = UIAlertAction(title: "Load from API", style: .default) { (alert: UIAlertAction!) in
            self.loadFromAPI()
        }
        
        let resetUsers = UIAlertAction(title: "Reset Users", style: .destructive) { (alert: UIAlertAction) in
            self.contacts = []
            self.tableView.reloadData()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        optionMenu.addAction(addCustomUser)
        optionMenu.addAction(loadFromAPI)
        optionMenu.addAction(resetUsers)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func addCustomUserAction(){
        let addCustomUser = UIAlertController(title: nil, message: "Add Custom User", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        let add = UIAlertAction(title: "Add", style: .default, handler: { alert -> Void in
            let customUserField = addCustomUser.textFields![0] as UITextField
            guard let customUser = customUserField.text else{
                return
            }
            
            self.contacts.append(Contact(id: 0, email: customUser, firstName: "", lastName: "", avatar: ""))
            
            self.tableView.reloadData()
        })
        
        addCustomUser.addTextField { (userField) in
            userField.placeholder = "Custom user name"
        }
        addCustomUser.addAction(cancel)
        addCustomUser.addAction(add)
        
        present(addCustomUser, animated: true, completion: nil)
    }
    
    func loadFromAPI(){
        Requests.getContacts { contacts in
            self.contacts.append(contentsOf: contacts)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filter(searchString: searchController.searchBar.text!)
    }
    
    func filter(searchString: String) {
        filteredContacts = contacts.filter({ contact in
            return contact.email.lowercased().contains(searchString.lowercased())
        })
        
        tableView.reloadData()
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        searchController.isActive && !isSearchBarEmpty
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        
        let contact = isFiltering ? filteredContacts[indexPath.row] : contacts[indexPath.row]
        
        cell.contactEmailLabel.text = contact.email
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredContacts.count : contacts.count
    }
    
}
