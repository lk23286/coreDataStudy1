//
//  ViewController.swift
//  coreDataStudy1
//
//  Created by Laszlo Kovacs on 30/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tableLabel: UITableView!
    
    
    @IBOutlet weak var nowLabel: UILabel!
    
    var tableData: [LessonLine] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableLabel.dataSource = self
    
        let nib = UINib(nibName: K.nibName, bundle: .none)
        
        tableLabel.register(nib, forCellReuseIdentifier: K.identifier)
        
        tableData = K.defaultTableName
        
    }

    @IBAction func leftButtonPressed(_ sender: UIButton) {
    }
 
    @IBAction func todayButtonPresssed(_ sender: UIButton) {
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
    }
   
    @IBAction func addButtonPressed(_ sender: UIButton) {
    }
    
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.identifier, for: indexPath) as! TableViewCell
        
        cell.numberLabel.text = String(tableData[indexPath.row].number!)
        cell.contentLabel.text = tableData[indexPath.row].content
        cell.startLabel.text = dateToString(from: tableData[indexPath.row].start!)
        cell.endLabel.text = dateToString(from: tableData[indexPath.row].end!)
        
        
        return cell
    }
    
    func dateToString(from date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    

    
}
