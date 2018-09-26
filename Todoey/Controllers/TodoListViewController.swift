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
    
//    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    var itemObjArray = [Item]()
    
    // Singleton plist but we are gonna create our own plist file
//    let defaults = UserDefaults.standard
    
    // Where our own plist would be stored in the application's sandbox
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    // MARK: Standard two methods:
    override func viewDidLoad() {
        super.viewDidLoad()

        // For test purpose only
//        let newItem01 = Item()
//        newItem01.title = "1st"
//        itemObjArray.append(newItem01)
//        let newItem02 = Item()
//        newItem02.title = "2nd"
//        itemObjArray.append(newItem02)
//        let newItem03 = Item()
//        newItem03.title = "3rd"
//        itemObjArray.append(newItem03)

        // Initial loading from the storage
        loadItems()
        
        // Get back data from the user defaults
//        if let items = defaults.array(forKey: "todoListArray") as? [Item] {
//            itemObjArray = items
//        }
        
        // The same result as the NSSearchPathForDirectoriesInDomains gets
        // Because it is an array the value of ".first" needed to get the first item
//        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        print("DATA FILE PATH: ")
//        print(dataFilePath)
        // Was moved beyound this method to be a global class's constant
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableView Datasource Methods:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemArray.count
        return itemObjArray.count
    }
    
    // How we should display each of the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
//        cell.textLabel?.text = itemArray[indexPath.row]
        let item = itemObjArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        // The long way
//        if item.done {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }

        // The short way via the ternary operator
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    // MARK: TableView Delegate Methods:
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Long way to set the done value
//        if itemObjArray[indexPath.row].done == false {
//            itemObjArray[indexPath.row].done = true
//        } else {
//            itemObjArray[indexPath.row].done = false
//        }

        // Short way to set the done value
        itemObjArray[indexPath.row].done = !itemObjArray[indexPath.row].done
        
        // In order to trigger this delegate again. But it's triggered so many times as there are items in the Model
        saveItems()
        // Was moved to the saveItems()
//        tableView.reloadData()
        
        // Selected cell gets checkmark accessory if being selected and hadn't got it yet
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        // Removes the gray color of the selected row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: Add New Items:
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the Add Item on our UIAlert
            
            // if the textField.text is nil then "New Item" is a default value
            // itemArray.append(textField.text ?? "New Item")
            
            // Save data to the local array
//            self.itemArray.append(textField.text!)
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemObjArray.append(newItem)
            
            // Saving data to the user defaults
            // Specified array would be stored under this particular key
            // This uses singleton plist for standard data types only
            //self.defaults.set(self.itemObjArray, forKey: "todoListArray")
            
            // To create our own plist to store user-defined objects
            // It's moved to the separated method of saveItems()
//            let encoder = PropertyListEncoder()
//            do {
//                let data = try encoder.encode(self.itemObjArray)
//                try data.write(to: self.dataFilePath!)
//            } catch {
//                print("Error encoding item array, \(error)")
//            }
            self.saveItems()
            
            // The data for tableView will be updated
            // Was moved to the saveItems()
            // self.tableView.reloadData()
        }
        // This closure is triggered once the text field is being added only so
        // we need to extend the scope of this alert addition to addButtonPressed's scope
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Model Manipulation Methods
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemObjArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        tableView.reloadData()
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemObjArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
    }
    
}

