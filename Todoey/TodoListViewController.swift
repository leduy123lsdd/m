//
//  ViewController.swift
//  Todoey
//
//  Created by Lê Duy on 7/30/18.
//  Copyright © 2018 Lê Duy. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController  {
    
    
    var itemArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ToDoitemCell", for: indexPath)
        Cell.textLabel?.text = itemArray[indexPath.row]
        
        return Cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        /* The Cell get check mark when user select */

        tableView.deselectRow(at: indexPath, animated: true)
        /* làm nền cell không chuyển sang xám luôn khi ấn vào, chỉ nháy xám rồi lai thành trắng  */
        
    }
    
    //MARK - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        /* tạo bảng thông báo */
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        } /* tạo textField trong alert */
        
        alert.addAction(action)
        /* Thêm action vào alert */
        
        present(alert, animated: true, completion: nil)
        /* Hiển thi alert */
    }
    
}

