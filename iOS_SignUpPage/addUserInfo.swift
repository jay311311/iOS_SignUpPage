//
//  addUserInfo.swift
//  iOS_SignUpPage
//
//  Created by Jooeun Kim on 2022/02/15.
//

import UIKit

class addUserInfo: UIViewController {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birth: UITextField!
    @IBOutlet weak var contactNumber: UITextField!
    @IBOutlet weak var male: UIButton!
    @IBOutlet weak var female: UIButton!
    @IBOutlet weak var allAgree: UIButton!
    @IBOutlet weak var useAgree: UIButton!
    @IBOutlet weak var privacyAgree: UIButton!
    
    
    
    let signInfo =  UserInfo.shared
    var valueOfAllAgree = false
    var valueOfUseAgree = false
    var valueOfPrivacyAgree = false


    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        id.text = signInfo.id
        name.delegate = self
        contactNumber.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchMale(_ sender: UIButton) {
       print("male")
        male.isSelected = true
        female.isSelected = false
        signInfo.adult = "male"
    }
    
    @IBAction func touchFemale(_ sender: UIButton) {
        print("female")
        female.isSelected = true
        male.isSelected = false
        signInfo.adult = "female"

    }

    @IBAction func editingName(_ sender: UITextField) {
        guard let nameValue = sender.text else { return }
        signInfo.name = nameValue
    }
    
    @IBAction func edtingContract(_ sender: UITextField) {
        guard let contractValue = sender.text else { return }
        signInfo.phoneNumber = Int(contractValue)
        signInfo.adult = "female"
        sender.resignFirstResponder()
    }
    
    @IBAction func touchUseAgree(_ sender: UIButton) {
        valueOfUseAgree = !valueOfUseAgree
        useAgree.isSelected = valueOfUseAgree
    }
    
    @IBAction func touchPrivacyAgree(_ sender: UIButton) {
        valueOfPrivacyAgree =  !valueOfPrivacyAgree
        privacyAgree.isSelected = valueOfPrivacyAgree
    }
    
    @IBAction func touchAllAgree(_ sender: UIButton) {
        valueOfAllAgree = !valueOfAllAgree
        useAgree.isSelected = valueOfAllAgree
        privacyAgree.isSelected = valueOfAllAgree
    }
    
}


extension addUserInfo: UITextFieldDelegate, UINavigationControllerDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        print("완료")
        return true
    }
}
