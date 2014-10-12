//
//  settingViewController.swift
//  prototype
//
//  Created by Star on 14-9-7.
//  Copyright (c) 2014年 langcaiye. All rights reserved.
//

import UIKit

class settingVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet var doneBTN : UIButton!
    @IBOutlet var setImageBTN : UIButton!
    @IBOutlet var userImage : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //button for submit all settings and return.
        doneBTN.addTarget(self,action:"settingDone:",forControlEvents:UIControlEvents.TouchDown)
        setImageBTN.addTarget(self,action:"setImage:",forControlEvents:UIControlEvents.TouchDown)
    }
    
    func setImage(sender: UIButton){
        var alert = UIAlertController(title:"选择",message:nil,preferredStyle:.ActionSheet)
        var cameraAct = UIAlertAction(title:"拍照",style:.Default) {
            [weak alert] action in
                // show camera
                var imagepicker:UIImagePickerController = UIImagePickerController()
                imagepicker.delegate = self
                imagepicker.sourceType = .Camera
                self.presentViewController(imagepicker,animated:true,completion: nil)
            alert!.dismissViewControllerAnimated(true, completion: nil)
        }
        var photoAct = UIAlertAction(title:"相册",style:.Default) {
            [weak alert] action in
                //show photo library
                var imagepicker:UIImagePickerController = UIImagePickerController()
                imagepicker.delegate = self
                imagepicker.sourceType = .SavedPhotosAlbum
                imagepicker.allowsEditing = true
                self.presentViewController(imagepicker,animated:true,completion: nil)
            
                //get a photo
            alert!.dismissViewControllerAnimated(true, completion: nil)
        }
        var cancelAct = UIAlertAction(title:"cancel",style:.Destructive,nil)
        alert.addAction(cameraAct)
        alert.addAction(photoAct)
        alert.addAction(cancelAct)
        
        self.presentViewController(alert,animated: true,nil)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!){
        picker.dismissViewControllerAnimated(true,completion:nil)
        var image:UIImage = info.objectForKey(UIImagePickerControllerOriginalImage) as UIImage
        userImage.animationImages = [image]
        userImage.startAnimating()
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!){
        self.dismissViewControllerAnimated(true,completion:nil)
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
        
        
//        self.presentingViewController.presentingViewController.presentingViewController.dismissViewControllerAnimated(true,nil)
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, nil)
        
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
