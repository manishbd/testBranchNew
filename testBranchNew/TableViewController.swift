//
//  TableViewController.swift
//  testBranchNew
//
//  Created by Nobby on 18/10/18.
//  Copyright © 2018 Nobby. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    var imagearr : [UIImage]!
    @IBOutlet var Mytableview: UITableView!
    var dataSource:[(upper:String,lower:String)] = [("Subscription Groups","Subscription groups consist of varying subscription levels and durations. All auto-renewable subscriptions are required to be part of a subscription group. Customers can move between subscription durations within a group, but cannot be subscribed to more than one subscription product within a group."),
                                                    ("Duration","The length of time between auto-renewals. The duration can be 7 days, 1 month, 2 months, 3 months, 6 months, or 1 year."),
                                                    ("Subscription Levels","You can assign every in-app purchase within a subscription group to a subscription level. Subscription levels are given a default rank, but you can reorder them by dragging and dropping each in-app purchase into the appropriate rank. Your subscription levels should be listed in descending order, starting with the one that offers the highest level of service. You can add more than one subscription to each level if the service provided is determined to be equal. Customers can move between subscription levels."),
                                                    ("Upgrade","When a customer switches from a subscription in a lower level to a subscription in a higher level. This change goes into effect immediately."),
                                                    ("Marketing Incentive Duration","The length of an auto-renewable subscription extension if customers choose to opt-in to share contact information. This property is only available to Magazines & Newspapers developers who have implemented Newsstand Kit.\n\nUsers’ contact information is available in the Sales and Trends module of iTunes Connect.\n\nNote: The opt-in incentive is not available for macOS.")]
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        Mytableview.register(UINib(nibName: "NewView", bundle: nil), forCellReuseIdentifier: "tablecellID")
        imagearr = [UIImage(named: "7.png"),UIImage(named: "8.png"),UIImage(named: "6.png"),UIImage(named: "4.png"),UIImage(named: "5.png"),UIImage(named: "6.png")] as! [UIImage]
        // Do any additional setup after loading the view.
      //self.Mytableview.rowHeight = UITableViewAutomaticDimension
       // self.Mytableview.estimatedRowHeight = 230;
      //  let uiimage = UIImageView(frame: CGRect(x:0,y:0,width:100,height:100))
       // uiimage.image = UIImage(named: "1.png")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //let url = URL(string: "http://cdn.24.co.za/files/Cms/General/d/8047/125c2e57ba5642cfb8a81a5eb20519c6.png")
        let uiimage = imagearr[indexPath.row]
        let ratio = (uiimage.size.width)/(uiimage.size.height)
        
        let cell = Mytableview.dequeueReusableCell(withIdentifier: "tablecellID", for: indexPath) as! TableViewCell
        cell.textContent.text = dataSource[indexPath.row].lower
        cell.textTitle.text = String(indexPath.row)
        cell.imageNews.image = uiimage
        
        cell.heightC.constant = (uiimage.size.width) / ratio
        //cell.contentView.setNeedsLayout()
        //cell.contentView.layoutIfNeeded()
        return cell;
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }*/
  
    
    func loadData()
    {
        // 1
        let defaultSession = URLSession(configuration: .default)
        // 2
        var dataTask: URLSessionDataTask?
        
        //dataTask?.cancel()
        // 2
        if var urlComponents = URLComponents(string: "https://newsapi.org/v2/top-headlines?sources=news24&apiKey=307145f55bcf4d6590b5a72355d2c1ba") {
            urlComponents.query = ""
            // 3
            guard let url = urlComponents.url else { return }
            // 4
            dataTask = defaultSession.dataTask(with: url)
            { data, response, error in
                defer { dataTask = nil }
                // 5
                if let error = error
                {
                    //self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200
                {
                    //self.updateSearchResults(data)
                    print(data)
                    // 6
                    DispatchQueue.main.async {
                       // completion(self.tracks, self.errorMessage)
                    }
                }
            }
            // 7
            dataTask?.resume()
        }
    }


}
