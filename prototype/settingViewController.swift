//
//  settingViewController.swift
//  prototype
//
//  Created by Star on 14-9-7.
//  Copyright (c) 2014年 langcaiye. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //button for submit all settings and return.
        var btnDone:UIButton = UIButton.buttonWithType(UIButtonType.System)as UIButton
        btnDone.frame = CGRectMake(0,320,320,30)
        btnDone.setTitle("完成",forState:UIControlState.Normal)
        btnDone.addTarget(self,action:"settingDone:",forControlEvents:UIControlEvents.TouchDown)
        self.view.addSubview(btnDone)
    }
    
    //func to return to the first screen
    func settingDone(sender: UIButton){
        self.presentingViewController.presentingViewController.dismissModalViewControllerAnimated(true)
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
