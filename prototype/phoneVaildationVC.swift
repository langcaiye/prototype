//
//  phoneVaildationVC.swift
//  prototype
//
//  Created by Star on 14-10-12.
//  Copyright (c) 2014年 langcaiye. All rights reserved.
//

import UIKit

class phoneVaildationVC: UIViewController,NSURLConnectionDelegate, NSURLConnectionDataDelegate {

    required init(coder aDecoder: NSCoder) {
        self.phoneText = ""
        super.init(coder: aDecoder)
    }

    @IBOutlet var wrongCodeLBL: UILabel!
    @IBOutlet var tipsLBL: UILabel!
    @IBOutlet var phoneNoTXB: UITextField!
    @IBOutlet var validCodeTXB: UITextField!
    @IBOutlet var sendCodeBTN: UIButton!
    @IBOutlet var nextBTN: UIButton!
    var phoneText:String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sendCodeBTN.addTarget(self,action:"sendCode:",forControlEvents:UIControlEvents.TouchDown)
        nextBTN.addTarget(self,action:"validateCode:",forControlEvents:UIControlEvents.TouchDown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendCode(sender:UIButton){
        phoneText = phoneNoTXB.text
        //check phone number
        if (phoneText.isEmpty || phoneText == "" || phoneText.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) != 11){
            tipsLBL.hidden = false
            return
        }
        else {
            //send http request to get validate code
            tipsLBL.hidden = true
            var phoneNum = "phoneNum=" + phoneNoTXB.text
            var urlString:NSString = NSLocalizedString("sendCodeWS",tableName: "variables",comment:"sendCodeWS") + phoneNum
            var url : NSURL = NSURL(string: urlString)
            var request:NSURLRequest = NSURLRequest(URL: url)
            var connection:NSURLConnection = NSURLConnection(request: request, delegate: self)
            connection.start()
            tipsLBL.textColor = UIColor.blackColor()
            tipsLBL.text = "验证码已发送"
            tipsLBL.hidden = false
        }
    }
    
    func validateCode(sender:UIButton){
        wrongCodeLBL.hidden = true
        wrongCodeLBL.text = "1"         //a flag used to find out return data by this fuction
        var codeText = "valiCode=" + validCodeTXB.text
        var phoneNum = "phoneNum=" + phoneNoTXB.text
        var urlString:NSString = NSLocalizedString("valiCodeWS",tableName: "variables",comment:"valiCodeWS") + phoneNum + "&" + codeText
        var url : NSURL = NSURL(string: urlString)
        var request:NSURLRequest = NSURLRequest(URL: url)
        var connection:NSURLConnection = NSURLConnection(request: request, delegate: self)
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!){
//        println(1111)
//        var httpresponse:NSHTTPURLResponse = response as NSHTTPURLResponse
//        var fields : NSDictionary = httpresponse.allHeaderFields;
//        println(fields)
//        // var cookie : NSString = fields.valueForKey("Set-Cookie") as NSString
//        println(2222)
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        println(wrongCodeLBL.text as String!)
        if wrongCodeLBL.text as String! == "1" {    //chehck are we validating the code
            var jsonResult : NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            var code = jsonResult["code"] as String!
            if code == "0" {                        //code is correct, let's go to setting view
                var sty = UIStoryboard(name: "Main",bundle: nil)
                var nextVC:UIViewController = sty.instantiateViewControllerWithIdentifier("setting") as UIViewController
                self.presentViewController(nextVC,animated: true,completion:nil)
            }
            else {
                wrongCodeLBL.text = "验证码错误！"    //code is incorrect, input again
                wrongCodeLBL.hidden = false
                tipsLBL.hidden = true
            }
        }
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!){
        //Parse the Response
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
