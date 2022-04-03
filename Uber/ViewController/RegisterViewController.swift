//
//  RegisterViewController.swift
//  Uber
//
//  Created by Sergio Santos on 03/04/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var completeName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirmation: UITextField!
    @IBOutlet weak var userType: UISwitch!
    
    let sharedFunctions: SharedFunctions = SharedFunctions()
     
    @IBAction func registerUser(_ sender: Any) {
        let validatedField = self.validateFields()
        
        if validatedField == "" {
            
            //Password Confirmation
            if sharedFunctions.checkPasswordConfirmation(password: self.password.text!, passwordConfirmation: self.passwordConfirmation.text!) {
                //Register
                let autentication = Auth.auth()
                autentication.createUser(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
                    if error == nil {
                        print("Sucesso ao criar o usuário! -> \(String(describing: user))")
                    } else {
                        print("Falha ao criar o usuário! -> \(String(describing: error?.localizedDescription))")
                    }
                }
            } else {
                print("Falha ao confirmar as senhas!")
            }
            
        } else {
            print("O campo \(validatedField) não foi preenchido!")
        }
    }
    
    func validateFields() -> String {
        let validate = sharedFunctions.fieldValidate
        if validate(email) {
            return "E-mail"
        } else if validate(completeName) {
            return "Nome completo"
        } else if validate(password) {
            return "Senha"
        } else if validate(passwordConfirmation) {
            return "Confirmação de senha"
        }
        return ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Remove keyboard if touch in view
        self.view.endEditing(true)
    }

}
