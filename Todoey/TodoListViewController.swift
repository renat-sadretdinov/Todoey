//
//  ViewController.swift
//  Todoey
//
//  Created by Renat Sadretdinov on 23/09/2018.
//  Copyright © 2018 Renat Sadretdinov. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    // step #1 - rename ViewController.swift to TodoListViewController.swift
    // step #2 - rename ViewController class to TodoListViewController class
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    let defaults = UserDefaults.standard

    // MARK: Standard two methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        // get back data from the user defaults
        if let items = defaults.array(forKey: "todoListArray") as? [String] {
            itemArray = items
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableView Datasource Methods:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // MARK: TableView Delegate Methods:
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Selected cell gets checkmark accessory if being selected and hadn't got it yet
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        // Removes the gray color of the selected row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: Add New Items:
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the Add Item on our UIAlert
            
            // if the textField.text is nil then "New Item" is a default value
            // itemArray.append(textField.text ?? "New Item")
            
            // save data to the local array
            self.itemArray.append(textField.text!)
            
            // saving data to the user defaults
            // specified array would be stored under this particular key
            self.defaults.set(self.itemArray, forKey: "todoListArray")
            
            // the data for tableView will be updated
            self.tableView.reloadData()
        }
        // this closure is triggered once the text field is being added only so
        // we need to extend the scope of this alert addition to addButtonPressed's scope
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

