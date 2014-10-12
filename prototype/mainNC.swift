//
//  mainViewController.swift
//  prototype
//
//  Created by Star on 14-9-9.
//  Copyright (c) 2014年 langcaiye. All rights reserved.
//

import UIKit

class mainNC: UINavigationController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        var btnOut:UIButton = UIButton.buttonWithType(UIButtonType.System)as UIButton
        btnOut.frame = CGRectMake(240,30,80,30)
        btnOut.setTitle("Log Out",forState:UIControlState.Normal)
        btnOut.addTarget(self,action:"logout:",forControlEvents:UIControlEvents.TouchDown)
        self.view.addSubview(btnOut)
        
    }
    
    override func viewDidAppear(animated: Bool){
        testLogin()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //to auto-login-in
    func testLogin(){
        var path:NSString=NSHomeDirectory();
        var fileName:NSString="/lc.txt" //login crendential
        path=path.stringByAppendingString(fileName)
        //        println(path);
        
        var file=NSFileManager()
        if ( !file.fileExistsAtPath(path)) {
            println("file not existing")
            //show login viewcontroller
            var sty = UIStoryboard(name: "Main",bundle: nil)
            var loginVC:UIViewController = sty.instantiateViewControllerWithIdentifier("loginView") as UIViewController
            
            self.presentViewController(loginVC,animated: true,completion:nil)
            println("show login interface")
        }
        else{
            println("file existing")
            var str:NSString = NSString.stringWithContentsOfFile(path,encoding:NSUTF8StringEncoding,error:nil)
            println(str)
        }
    }
    
    
    func logout(sender: UIButton){
        var file=NSFileManager()
        var path=NSHomeDirectory();
        var fileName:NSString="/lc.txt" //login crendential
        path=path.stringByAppendingString(fileName)
        file.removeItemAtPath(path,error:nil)
        println("file deleted")
        
        testLogin()
    }
    
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
