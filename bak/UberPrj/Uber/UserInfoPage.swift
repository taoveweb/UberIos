//
//  UserInfoPage.swift
//  Uber
//
//  Created by hejinbo on 15/10/22.
//  Copyright © 2015年 MyCos. All rights reserved.
//

import UIKit

class UserInfoPage: FxBasePage,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var avatar:UIImageView!
    @IBOutlet var backUserView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "建立基本资料"
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 5
        
        backUserView.layer.masksToBounds = true
        backUserView.layer.cornerRadius = 5
        
        setNavigationItem("Back.png", selector: "doBack", isRight: false)
        setNavigationItem("下一步", selector: "doRight", isRight: true)
    }

    @IBAction func doSetAvatar(sender:UIButton) {
        let page = UIImagePickerController()
        
        page.sourceType = .PhotoLibrary
        page.delegate = self
        
        self.presentViewController(page, animated: true, completion: nil)
    }
    
    override func doRight()
    {
        let page = AddPayPage()
        
        self.navigationController?.pushViewController(page, animated: true)
    }

    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingImage image: UIImage,
        editingInfo: [String : AnyObject]?) {
            avatar.image = image
            picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
