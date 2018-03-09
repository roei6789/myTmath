//
//  riddlesListVC.swift
//  Math
//
//  Created by Aviv Maor on 2/17/18.
//  Copyright © 2018 Aviv Maor. All rights reserved.
//

import UIKit

var riddles = ["חידה 4" ,"חידה 3" ,"חידה 2" ,"חידה 1" ]
var myIndex = 0

class riddlesListVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return riddles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! riddlesCell
        cell.numberLable.text = String(indexPath.row)
        cell.checkIMG.image = UIImage(named: "checkMark")
        cell.checkIMG.isHidden = false
        cell.checkIMG.backgroundColor = UIColor.black
       // cell.textLabel?.text = riddles[indexPath.row]
        
        
        //cell.riddleName.text = "adgs"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "toRiddle", sender: self)
    }

}
