//
//  addSigninInfo.swift
//  iOS_SignUpPage
//
//  Created by Jooeun Kim on 2022/02/15.
//

import UIKit

class addSigninInfo: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var checkPassword: UITextField!

  let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    picker.delegate = self

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func addPhoto(_ sender: UIButton) {
        let alert  = UIAlertController(title: "원하는 타이틀", message: "원하는 메세지", preferredStyle: .actionSheet)
        let gallery =  UIAlertAction(title: "사진 앨범", style: .default, handler:{ (action) in self.openGallery()})
        let camera = UIAlertAction(title: "카메라", style: .default, handler: {(action) in self.openCamera()})
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(gallery)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
   
    
    @IBAction func editingId(_ sender: Any) {
    }
    
    
    @IBAction func editingPassword(_ sender: Any) {
    }
    

    
    
}

extension addSigninInfo : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
        picker.sourceType = .photoLibrary
            present(picker, animated: false, completion: nil)}
        else{
            print("this is not a real iphone")
        }
    }
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
        }else{
            print("this is not a real iphone")

        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let img  =  info[UIImagePickerController.InfoKey.originalImage] as?  UIImage {
            print(info)
            profileImage.image = img
            dismiss(animated: true, completion: nil)
            UserInfo.shared.profilePhoto = img
            
            
        }
    }
    
    
    
}

