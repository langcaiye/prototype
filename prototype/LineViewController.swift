//
//  LineViewController.swift
//  prototype
//
//  Created by 浪菜叶 on 14-9-1.
//  Copyright (c) 2014年 langcaiye. All rights reserved.
//

import UIKit

class LineViewController:UITableViewController, UITableViewDataSource, UITableViewDelegate,DataGeterProtcol{
    
    @IBOutlet var appsTableView : UITableView?
    var tableData:NSMutableDictionary = NSMutableDictionary()
    var dataGeter = DataGeter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataGeter.delegate = self
        dataGeter.getDataFor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        return tableData.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        cell.textLabel.text = self.tableData.objectForKey("name") as String
        cell.detailTextLabel.text = "1"
        println("done")
        return cell
    }
    
    func didReceiveAPIResults(results : NSMutableDictionary){
        self.tableData = results
        self.appsTableView!.reloadData()
    }
}