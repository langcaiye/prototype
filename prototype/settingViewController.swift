//
//  settingViewController.swift
//  prototype
//
//  Created by Star on 14-9-7.
//  Copyright (c) 2014年 langcaiye. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {
    @IBOutlet var doneBTN : UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
        //button for submit all settings and return.
        doneBTN.addTarget(self,action:"settingDone:",forControlEvents:UIControlEvents.TouchDown)
    }
    
    //func to return to the first screen
    func settingDone(sender: UIButton){
        
        let content = "UserName:a;UserSecret:c"
        println(content)
        let contenDate = content.dataUsingEncoding(NSUTF8StringEncoding)
        
        var path:NSString=NSHomeDirectory();
        var fileName:NSString="/lc.txt" //login crendential
        path=path.stringByAppendingString(fileName)
        //        println(path);
        
        var file=NSFileManager()
        if ( !file.fileExistsAtPath(path)) {
            file.createFileAtPath(path,contents:contenDate,attributes:nil)
            println("create file")
        }
        else{
            println("file existing")
            var str:NSString = NSString.stringWithContentsOfFile(path,encoding:NSUTF8StringEncoding,error:nil)
            println(str)
        }
        
        
        self.presentingViewController.presentingViewController.presentingViewController.dismissViewControllerAnimated(true,nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
