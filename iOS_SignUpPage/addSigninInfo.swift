//
//  addSigninInfo.swift
//  iOS_SignUpPage
//
//  Created by Jooeun Kim on 2022/02/15.
//

import UIKit

class addSigninInfo: UIViewController {
    
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var id : UITextField!
    @IBOutlet weak var password : UITextField!
    @IBOutlet weak var checkPassword : UITextField!
    @IBOutlet weak var nextButton : UIButton!

    let picker = UIImagePickerController()
    let signInfo =  UserInfo.shared
    
    var dubleCheckPassword : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
    picker.delegate = self
        id.delegate = self
        password.delegate = self
        checkPassword.delegate = self
        nextButton.isEnabled = false
        // Do any additional setup after loading the view.
    }
    

    
    func checkInfomationValu (){
      
      
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
    
    
    @IBAction func editingId(_ sender: UITextField) {
        guard let idValue = sender.text else { return }
        signInfo.id = idValue
    }
    
    
    @IBAction func editingPassword(_ sender: UITextField) {
        guard let passwordValue = sender.text else { return }
        signInfo.password = passwordValue
    }
    

    @IBAction func checkPassword(_ sender: UITextField) {
        guard let rePassword = sender.text else { return }
        
        if rePassword == signInfo.password {
            dubleCheckPassword = true
        }
    }
    
    
    
}
extension addSigninInfo : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        print("\(textField.text!)\textEndEdinting Delegate")
        if signInfo.profilePhoto != nil && signInfo.id != nil && signInfo.password != nil && dubleCheckPassword == true{
            nextButton.isEnabled = true
            print("enabel")
       }
        return true
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
        if let img  =  info[UIImagePickerController.InfoKey.originalImage] as?  UIImage, let imgURL  =  info[UIImagePickerController.InfoKey.originalImage]  {
           // print("\(info[UIImagePickerController.InfoKey.imageURL])")
            profileImage.image = img
            dismiss(animated: true, completion: nil)
            UserInfo.shared.profilePhoto = "\(imgURL)"
            
            
        }
        
    }
    
    
    
}

