//
//  selectingViewController.swift
//  prototype
//
//  Created by Star on 14-9-21.
//  Copyright (c) 2014年 langcaiye. All rights reserved.
//

import UIKit

class selectingVC: UIViewController,NSURLConnectionDelegate, NSURLConnectionDataDelegate {

    
    @IBOutlet var recurr : UISegmentedControl!
    @IBOutlet var searchBTN : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBTN.addTarget(self,action:"search:",forControlEvents:UIControlEvents.TouchDown)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func search(sender: UIButton){
        //test code
        var webServiceString:NSString = "http://dev.kuaipinche.com/app/user/sendvalidationcode.do"
        var phoneNum = "phoneNum=1866821129"
        var urlString:NSString = webServiceString + "?" + phoneNum
        var url : NSURL = NSURL(string: urlString)
        var request:NSURLRequest = NSURLRequest(URL: url)
        var connection:NSURLConnection = NSURLConnection(request: request, delegate: self)
        connection.start()
        println(recurr.selectedSegmentIndex)
        println(urlString)
    }

    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!){
        println(1111)
        var httpresponse:NSHTTPURLResponse = response as NSHTTPURLResponse
        var fields : NSDictionary = httpresponse.allHeaderFields;
        println(fields)
       // var cookie : NSString = fields.valueForKey("Set-Cookie") as NSString
        println(2222)
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        println("return data:")
        var jsonResult : NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        println(jsonResult)
        println(jsonResult["code"])
        println(jsonResult["message"])
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        //Parse the Response

    }
        
}
