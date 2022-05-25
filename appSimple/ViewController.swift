//
//  ViewController.swift
//  appSimple
//
//  Created by wendy manrique on 25/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    private let kMyKey = "MY_KEY"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = NSLocalizedString("hello", comment: "")
        welcomeLabel.text = NSLocalizedString("welcome", comment: "")
        
    }
//UserDefaults
//NOTA: STANDARD es el almacen de valores que tenemos por defecto en nuestra aplicacion swift y IOS
    
    //La funcion GET recuperara las preferencias
    @IBAction func getButtonAction(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: kMyKey) {
            showAlert(message: value)
    }else{
        showAlert(message: "No hay un valor para esta clave")
        
    }
}
    //La funcion PUT guarda las preferencias
    @IBAction func putButtonAction(_ sender: Any) {
        UserDefaults.standard.set("APUNTES", forKey: kMyKey)
        UserDefaults.standard.synchronize() //SYNCHRONIZE sirve para forzar el guardado del valor
        showAlert(message: "Hemos guardado un valor")
    }
    //La funcion DELETE borra las preferencias
    @IBAction func deleteButtonAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: kMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")

    }
    
    private func showAlert(message: String){
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

