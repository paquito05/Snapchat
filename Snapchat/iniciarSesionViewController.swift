//
//  ViewController.swift
//  Snapchat
//
//  Created by John Samuel Altamirano Sanchez on 10/27/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class iniciarSesionViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordtextField.text!) {(user, error) in
            print("Intentando iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error \(error)")
                
            }else{
                print("Inicio Sesion Exitoso")
            }
        }
    }
    
}

