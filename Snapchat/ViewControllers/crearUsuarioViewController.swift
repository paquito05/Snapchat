//
//  crearUsuarioViewController.swift
//  Snapchat
//
//  Created by John Samuel Altamirano Sanchez on 11/10/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class crearUsuarioViewController: UIViewController {

    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func crearUsuario(_ sender: Any) {
        
                
        Auth.auth().createUser(withEmail: self.usuarioTextField.text!, password: self.passwordTextField.text!, completion: {(user, error) in
                print("Intentando crear un usuario")
                           
                if error != nil {
                    print("Se presento el presente error al crear el usuario\( error)")
                               
                               
                }else{
                    print("el usuario fue creado exitosamente")
                               
                    Database.database().reference ().child("usuarios").child(user!.user.uid).child ("email").setValue (user!.user.email)
                               
                                
                    let alerta = UIAlertController(title: "Creacion de Usuario", message:"Usuario: \(self.usuarioTextField.text!) se creo correct amente.",preferredStyle: .alert)
                               
                    let btn0K = UIAlertAction (title: "Aceptar", style: .default, handler:{ (UIAlertAction) in
                    
                    self.performSegue (withIdentifier: "regresarLoginsegue", sender: nil)})
                    
                    alerta.addAction (btn0K)
                    self.present (alerta, animated: true, completion: nil)
                }
            })
        
        
    }
    
    
    
    @IBAction func btnregresar(_ sender: Any) {
        self.performSegue (withIdentifier: "regresarLoginsegue", sender: nil)
    }
    
}
