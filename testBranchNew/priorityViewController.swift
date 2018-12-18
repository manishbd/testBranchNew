//
//  priorityViewController.swift
//  testBranchNew
//
//  Created by Nobby on 24/10/18.
//  Copyright © 2018 Nobby. All rights reserved.
//

import UIKit
import ReadabilityKit
import ISEmojiView
import AGEmojiKeyboard

class priorityViewController: UIViewController,AGEmojiKeyboardViewDelegate,AGEmojiKeyboardViewDataSource//,EmojiViewDelegate
{
    func emojiKeyBoardView(_ emojiKeyBoardView: AGEmojiKeyboardView!, didUseEmoji emoji: String!) {
        print("241")
    }
    
    func emojiKeyBoardViewDidPressBackSpace(_ emojiKeyBoardView: AGEmojiKeyboardView!) {
           print("241")
    }
    
    func emojiKeyboardView(_ emojiKeyboardView: AGEmojiKeyboardView!, imageForSelectedCategory category: AGEmojiKeyboardViewCategoryImage) -> UIImage! {
        return UIImage()
    }
    
    func emojiKeyboardView(_ emojiKeyboardView: AGEmojiKeyboardView!, imageForNonSelectedCategory category: AGEmojiKeyboardViewCategoryImage) -> UIImage! {
        return UIImage()
    }
    
    func backSpaceButtonImage(for emojiKeyboardView: AGEmojiKeyboardView!) -> UIImage! {
         return  UIImage()
    }
    
   /* func emojiViewDidSelectEmoji(_ emoji: String, emojiView: EmojiView) {
         emojitext.insertText(emoji)
    }
    
    // callback when tap change keyboard button on keyboard
    func emojiViewDidPressChangeKeyboardButton(_ emojiView: EmojiView) {
        emojitext.inputView = nil
        emojitext.keyboardType = .default
        emojitext.reloadInputViews()
    }
    
    // callback when tap delete button on keyboard
    func emojiViewDidPressDeleteBackwardButton(_ emojiView: EmojiView) {
        emojitext.deleteBackward()
    }
    
    // callback when tap dismiss button on keyboard
    func emojiViewDidPressDismissKeyboardButton(_ emojiView: EmojiView) {
        emojitext.resignFirstResponder()
    }*/
    

    @IBOutlet var emojitext: UITextField!
    
    @IBOutlet var popupview: UIView!
    @IBOutlet var innerview: UIView!
    @IBOutlet var priority2: NSLayoutConstraint!
    @IBOutlet var height2: NSLayoutConstraint!
    @IBOutlet var priority1: NSLayoutConstraint!
    @IBOutlet var height1: NSLayoutConstraint!
    var swipeDown : UISwipeGestureRecognizer!
    var newview = UIView()
    var arr2 = [String:String]()
    var arr3 = [[String:String]]()
    var classModelArr = [classModel]()
    var classMainModelObj = ClassMainModel()
    var testArr = [String:Any]()
    var emojiAddObj : EmojiClass!
    override func viewDidLoad() {
        super.viewDidLoad()
        bindmodels()
        methods()
        
        newview.frame = CGRect(x: innerview.frame.origin.x, y: innerview.frame.origin.y, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        innerview.frame =  CGRect(x: innerview.frame.origin.x, y: innerview.frame.origin.y, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        newview.addSubview(innerview)
        view.addSubview(newview)
        newview.frame.origin.y = UIScreen.main.bounds.height
        newview.sizeToFit()
        newview.layoutIfNeeded()
        //popupview.isHidden = true
        swipeDown  = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeDown.direction = .down
        //height2.constant = 0
        // Do any additional setup after loading the view.
        //emojiAddObj = EmojiClass(textview: self.emojitext)
        addemojiKeyboard()
    }

    func addemojiKeyboard()
    {
        var keyboardRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
        var emojiKeyboardView = AGEmojiKeyboardView(frame: keyboardRect, dataSource: self)
        emojiKeyboardView!.autoresizingMask = UIViewAutoresizing.flexibleHeight
        emojiKeyboardView!.delegate = self
        emojitext.inputView = emojiKeyboardView

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickaction(_ sender: UIButton)
    {
        emojitext.resignFirstResponder()
        if(sender.tag == 0)
        {
             self.showkeyboard(type:"DEFAULT")
        }
        else
        {
             self.showkeyboard(type:"EMOJI")
        }
        
        return
         //height2.constant = 150
        //self.popupview.isHidden = false
        height1.constant = 0
        priority2.constant = 150
        //priority2.priority = UILayoutPriority(rawValue: 1000.0)
        //priority1.priority = UILayoutPriority(rawValue: 999.0)
        
        UIView.animate(withDuration: 0.5, animations: {
            //self.currentState = .closed
            //            self.popupView.frame.origin.y =  UIScreen.main.bounds.height -  self.popupView.frame.size.height
            // self.popupView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
            self.newview.frame.origin.y =   UIScreen.main.bounds.height -  self.newview.frame.size.height
        }) { (true) in
            // self.popupView.addGestureRecognizer(self.panRecognizer)
            
            self.newview.addGestureRecognizer(self.swipeDown)
            
        }
        
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void
    {
        if gesture.direction == UISwipeGestureRecognizerDirection.down
        {
            print("Swipe Down")
            UIView.animate(withDuration: 0.5, animations:
                {
                    //self.currentState = .closed
                    self.newview.frame.origin.y =  UIScreen.main.bounds.height +  self.newview.frame.size.height
            }) { (true) in
                // self.popupView.addGestureRecognizer(self.panRecognizer)
                self.newview.removeGestureRecognizer(self.swipeDown)
                
            }
            
        }
    }
    
    
    func showkeyboard(type:String)
    {
        if(type == "EMOJI")
        {
            /*let keyboardSettings = KeyboardSettings(bottomType: .categories)
            let emojiView = EmojiView(keyboardSettings: keyboardSettings)
            emojiView.translatesAutoresizingMaskIntoConstraints = false
            emojiView.delegate = self
            emojitext.inputView = emojiView*/
            emojiAddObj.ShowEmojiView()
        }
        else
        {
            emojitext.inputView = nil
            emojitext.keyboardType = .default
            emojitext.reloadInputViews()
        }
        emojitext.becomeFirstResponder()
        
    }
    
    func bindmodels()
    {
        self.showkeyboard(type:"DEFAULT")
        classMainModelObj.loadMainData =
            { (errormessage:String,data:[String:Any])->Void in
            
            print("52224345\(errormessage)");
                print(data)
                print("---no---")
        }
    }
    
    func methods()
    {
        var str = "   test data in my core language! @111 hello dear yes d yes "
        //str.append("!")
        //str.append(contentsOf: "@111")
        //str.append("hello dear")
        let st1 = str.trimmingCharacters(in: .whitespacesAndNewlines)
        print(">>>>>>>>>>")
       // print(str.suffix(from: <#T##String.Index#>))
        print(st1.starts(with: "test"))
        print(st1.split(separator: "d", maxSplits: Int.max, omittingEmptySubsequences: true))
        print(str.replacingOccurrences(of: "data", with: "manish"))
        print(str.suffix(from: (str.range(of: "hello")?.upperBound)!))
        print(str.distance(from: (str.range(of: "test")?.upperBound)!, to: (str.range(of: "data")?.lowerBound)!))
        //str.index(before: <#T##String.Index#>)
        print(str.insert(contentsOf: " yahoo", at: (str.range(of: "test")?.upperBound)!))
       // str.remove(at: (str.range(of: "yahoo")!).upperBound)

        print(">>>>>>>>>>")
        
        var arr = [Int]()
        arr.append(1)
        arr.append(2)
        arr.append(3)
        print(arr)
        print(">>>>>")
        var arr1 = [Int:Int]()
        arr1.updateValue(1, forKey: 1)
        print(arr2)
        
       //arr3.app
        arr3.append(["name":"manish","dob":"jodhpur","location":"rajasthan"])
        arr3.append(["name":"sohan","dob":"jaipur","location":"rajasthan"])
        arr3.append(["name":"mohan","dob":"kota","location":"rajasthan"])
        print(arr3)
        
        let dataSource = [
            "Domain CheckService",
            "IMEI check",
            "Compliant about service provider",
            "Compliant about TRA",
            "Enquires",
            "Suggestion",
            "SMS Spam",
            "Poor Coverage",
            "Help Salim",
            "+919681151452"
        ]
        
        let data1 = ["email": [
            "adris@parentsconcern.com",
            "abhishekp81@gmail.com",
            "subhro@parentsconcern.com",
            "samantapriyabrata999@gmail.com",
            "priyasen@gmail.com",
            "adrismegha@gmail.com",
            "piyas.de@gmail.com",
            "adris@mymanhattancom.com",
            "onmoloy@gmail.com",
            "ketakinandi@gmail.com",
            "debendra255@gmail.com",
            "chandankrbera@gmail.com",
            "sourav.bhoumik@gmail.com",
            "nibeditasengupta9@gmail.com",
            "subhamchatterjee1@gmail.com",
            "connectwidamit@gmail.com",
            "nikprabha90@gmail.com",
            "san@gmail.com",
            "somshere17@gmail.com",
            "arpita22gharai@gmail.com",
            "pinky.c18@gmail.com",
            "connect.tofragrance@gmail.com",
            "avisek1425@gmail.com",
            "arpitahot001@gmail.com",
            "youngsteryounis@gmail.com",
            "sultanbhai2550@gmail.com",
            "kumar_kamal09@rediffmail.com",
            "aadilkhan71736@gmail.com",
            "soumyakkr777@gmail.com",
            "kishorbhosle922@gmail.com",
            "bhargavdave490@gmail.com",
            "karimthedevil@gmail.com",
            "rajballovekumar07@gmail.co",
            "mohitverma1487@gmail.com"
            ],
            "contactNo": [
                "9830867536",
                "8820172930",
                "9830771806",
                "9681151452",
                "9179519155",
                "9830071744",
                "5163127669",
                "9432324149",
                "7890743741",
                "9433307719",
                "7978291311",
                "9563823735",
                "9735129685",
                "9609556719",
                "9547286472",
                "9038184137",
                "9903101858",
                "7069682150",
                "8279150334",
                "7733000054",
                "7059843268",
                "9604637326",
                "774494766",
                "+916585254625",
                "9304208318",
                "6202979806",
                "9936406030"
            ]] as [String : Any]
        
      //  let predicate1 = NSPredicate(format: "contactNo contains[c] %@", "6585254625")
      //  let sorted = data1.filter({return predicate1.evaluate(with: $0) })
      //print("==(sorted)")
        print(data1)
      /*  let json1 = try JSONSerialization.jsonObject(with: data1, options: .mutableContainers) as? NSDictionary
        print("@search option res------->>>>>>>>>>",json1!["response"])
        if  let response = json1!["response"] as? [String:Any]
        {
            print(response)
        }
        */
       /* let searchString = "TRA"
        let predicate = NSPredicate(format: "SELF contains[c] %@", searchString)
        let searchDataSource = dataSource.filter { predicate.evaluate(with: $0) }
        let predicate1 = NSPredicate(format: "contains[c] %@", "9681151452")
        let sorted = arr.filter({
            return predicate1.evaluate(with: $0)
        })*/
       
       // print("=======result=======\(searchDataSource)");
       // print("==(sorted)")
        
        let array1 = [["txt":"5mbps", "value": 2048],["txt":"50mbps", "value": 18048],["txt":"55mbps", "value": 22048]]
        let filter1 = NSPredicate(format: "txt contains[c] %@", "5mbps")
        //print(array1.filter({$0["txt"] as! String == "5mbps"}))
        print(array1.filter({$0["txt"] as! String == "5mbps"}))
        print(array1.filter { filter1.evaluate(with: $0)})
        print(array1.index(where: {$0["txt"] as! String == "50mbps"}))
        print("---hello---")
        var arrnew = ["id":"1","name":"mansa","address":"jodhpur","state":"rajasthan"]
        var insertArr = classModel(with: arrnew)
        classModelArr.append(insertArr)
        arrnew = ["id":"2","name":"mashddy","address":"jaipur","state":"rajasthan"]
        insertArr = classModel(with: arrnew)
        classModelArr.append(insertArr)
        arrnew = ["id":"3","name":"manish","address":"Udaipur","state":"rajasthan"]
        insertArr = classModel(with: arrnew)
        classModelArr.append(insertArr)
        print(classModelArr);
        print(classModelArr.contains(where: { $0.id == "1"}))
        print(classModelArr.filter({$0.id == "1"}).first?.name)
        print(classModelArr.index(where: {$0.name == "maddy"}))
        print(classModelArr.filter({$0.id == "1"}))
        
        //let filter2 = NSPredicate(format: "id contains[c] %@", "3")
        //print(classModelArr.filter { filter2.evaluate(with: $0)})
        print(classModelArr.filter {($0.name?.contains("50mbps"))!})
        print(classModelArr.filter {($0.name?.contains("sh"))!})
        print(classModelArr.filter {($0.name?.hasSuffix("sh"))!}.first?.id)
        print(classModelArr.index(where: {$0.name == "manish"}))
        print("--hello--")
        
        testArr["IN"] = [["id":"1","name":"aajTak_IN"],["id":"2","name":"Zeenews_IN"],["id":"3","name":"samay_IN"]]
        testArr["UN"] = [["id":"4","name":"aajTak_UN"],["id":"5","name":"Zeenews_UN"],["id":"6","name":"samay_UN"]]
        testArr["US"] = [["id":"7","name":"aajTak_US"],["id":"8","name":"Zeenews_US"],["id":"9","name":"samay_US"]]
        
        print(testArr);
        print("---1--1---")
        
        var dict: [String: Any] = [
                                    "language": "de",
                                    "translator": "Erika Fuchs",
                                    "translations":
                                     [
                                        "characters":
                                        [
                                            "Scrooge McDuck": "Dagobert",
                                            "Huey": "Tick",
                                            "Dewey": "Trick",
                                            "Louie": "Track",
                                            "Gyro Gearloose": "Daniel Düsentrieb",
                                        ],
                                        "places": [
                                            "Duckburg": "Entenhausen",
                                            "Money Bin": "Geldspeicher",
                                        ]
                                    ]
                                 ]
       
        
        var url = URL(string: "https://www.google.com/")

        /*self.unshortenURL(url!, completion: { unshortened in
            //classMainModelObj.loadData(arr: dict)
           // let articleUrl = URL(string: "http://bit.ly/14SD1eR")!
            Readability.parse(url: URL(string: unshortened.absoluteString)!, completion: { data in
                let title = data?.title
                let description = data?.description
                let keywords = data?.keywords
                let imageUrl = data?.topImage
                let videoUrl = data?.topVideo
            })
        }, onError: {error in print("525")})*/
        let readabilityUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7"
        var request = URLRequest(url: url!)
        request.setValue(readabilityUserAgent, forHTTPHeaderField: "User-Agent")
        
        
        URLSession.shared.dataTask(with: request,
                                   completionHandler: { data, response, error in
                                    guard let response = response else {
                                        
                                       
                                        return
                                    }
        
        }).resume()
    
       
    }
    
    
    // Unshorten URL by following redirections
    fileprivate func unshortenURL(_ url: URL, completion: @escaping (URL) -> Void, onError: @escaping (Error) -> Void)
    {
        
        var task: URLSessionDataTask?
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        
        task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if error != nil
            {
                onError(url.absoluteString as! Error)
                task = nil
            } else {
                if let finalResult = response?.url
                {
                    if (finalResult.absoluteString == url.absoluteString)
                    {
                         completion(url)
                        task = nil
                    } else {
                        task?.cancel()
                        task = nil
                        //self.unshortenURL(finalResult,completion: completion, onError: onError)
                    }
                } else
                {
                     completion(url)
                    task = nil
                }
            }
        })
        
        if let task = task {
            task.resume()
        } else {
            onError(url.absoluteString as! Error)
            }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

