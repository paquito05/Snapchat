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
import GoogleSignIn

class iniciarSesionViewController: UIViewController {


    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    @IBOutlet weak var googleOutlet: UIButton!
    


    @IBAction func GoogleAction(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordtextField.text!) {(user, error) in
            print("Intentando iniciar Sesion")
            if error != nil{
                
                
                print("Se presento el siguiente error \(error)")
               let alerta = UIAlertController(title: "Creacion de Usuario", message:
                        "Usuario: \(self.emailTextField.text!) se creo correct amente.",preferredStyle:.alert)
                
                let crearusuario = UIAlertAction (title: "Crear Usuario", style: .default, handler:{ (UIAlertAction) in
                self.performSegue (withIdentifier: "crearusuariosegue", sender: nil)})
                
                let cancelar = UIAlertAction (title: "Cancelar", style: .cancel, handler:{ (UIAlertAction) in
                    print("el registro fue cancelado")})
                
                alerta.addAction(crearusuario)
                alerta.addAction(cancelar)
                self.present (alerta, animated: true, completion: nil)
                
                
            }else{
                print("Inicio Sesion Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }
    
    
    @IBAction func crearusuarioButton(_ sender: Any) {
        
        self.performSegue (withIdentifier: "crearusuariosegue", sender: nil)
    }
    
}

