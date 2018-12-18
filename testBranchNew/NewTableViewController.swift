//
//  NewTableViewController.swift
//  testBranchNew
//
//  Created by Nobby on 12/12/18.
//  Copyright © 2018 Nobby. All rights reserved.
//

import UIKit
import SwiftLinkPreview

class newcell : UITableViewCell
{
    
    @IBOutlet var title: UILabel!
    @IBOutlet var othertitle: UILabel!
    @IBOutlet var desciption: UILabel!
    var reloadTable : (()-> Void) = {}
    
    let linkpreview = SwiftLinkPreview()
    func getpreview(indexpathlink:IndexPath,previewLink:String)
    {
        linkpreview.previewLink(previewLink, onSuccess: { (data) in
            
            // get cell
            self.title.text = data["title"]! as? String
            self.desciption.text = data["description"]! as? String
            self.othertitle.text = data["title"]! as? String
            /*let cell = self.tableView.cellForRow(at: indexpathlink) as! newcell
            cell.title.text = data["title"]! as? String
            cell.desciption.text = data["description"]! as? String
            cell.othertitle.text = data["title"]! as? String
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            UIView.performWithoutAnimation {
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }*/
            self.reloadTable()
        }, onError: { error in print("\(error)")})
        
    }
    
    
}


class NewTableViewController: UITableViewController {

    
    var dataSource:[(upper:String,lower:String)] = [("Subscription groups consist of varying subscription levels and durations. All auto-renewable subscriptions are required to be part of a subscription group","Subscription groups consist of varying subscription levels and durations. All auto-renewable subscriptions are required to be part of a subscription group. Customers can move between subscription durations within a group, but cannot be subscribed to more than one subscription product within a group."),
                                                    ("You can assign every in-app purchase within a subscription group to a subscription level. Subscription levels are given a default rank","The length of time between auto-renewals. The duration can be 7 days, 1 month, 2 months, 3 months, 6 months, or 1 year."),
                                                    ("Subscription Levels","You can assign every in-app purchase within a subscription group to a subscription level. Subscription levels are given a default rank, but you can reorder them by dragging and dropping each in-app purchase into the appropriate rank. Your subscription levels should be listed in descending order, starting with the one that offers the highest level of service. You can add more than one subscription to each level if the service provided is determined to be equal. Customers can move between subscription levels."),
                                                    ("Upgrade","When a customer switches from a subscription in a lower level to a subscription in a higher level. This change goes into effect immediately."),
                                                    ("Marketing Incentive Duration","The length of an auto-renewable subscription extension if customers choose to opt-in to share contact information. This property is only available to Magazines & Newspapers developers who have implemented Newsstand Kit.\n\nUsers’ contact information is available in the Sales and Trends module of iTunes Connect.\n\nNote: The opt-in incentive is not available for macOS.")]
    
    var urlarr = ["https://www.youtube.com/watch?v=pI7fxRpDjmA",
                  "NASA! 🖖🏽 https://www.nasa.gov/",
                  "https://www.theverge.com/2016/6/21/11996280/tesla-offer-solar-city-buy",
                  "Shorten URL http://bit.ly/14SD1eR",
                  "www.dji.com/matrice600-pro/info#specs"]
                 

    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.tableView.register(UINib(nibName: "newcell", bundle: nil), forCellReuseIdentifier: "newcell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newcell", for: indexPath) as! newcell
        // static code
        /*cell.title.text = dataSource[indexPath.row].lower
        cell.desciption.text = dataSource[indexPath.row].upper
        cell.othertitle.text = dataSource[indexPath.row].upper*/
        // dynamic values
       // self.getpreview(indexpathlink: indexPath,previewLink:urlarr[indexPath.row])
        cell.getpreview(indexpathlink: indexPath,previewLink:urlarr[indexPath.row])
        cell.reloadTable =
        {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            UIView.performWithoutAnimation {
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
        }
        return cell
    }
    

    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
      
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
