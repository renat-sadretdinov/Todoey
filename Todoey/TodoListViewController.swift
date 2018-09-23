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
    
    let itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]

    // MARK: Standard two methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
}

