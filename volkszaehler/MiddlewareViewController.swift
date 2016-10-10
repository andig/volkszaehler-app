//
//  ViewController.swift
//  volkszaehler
//
//  Created by Andreas Götz on 08/10/2016.
//  Copyright © 2016 Andreas Götz. All rights reserved.
//

import UIKit

class MiddlewareViewController: UIViewController, UITextFieldDelegate {

    var middleware: Middleware?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var uriField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // MARK: navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender as? UIBarButtonItem {
            let name = nameField.text ?? "middleware"
            let uri = uriField.text ?? "http://localhost"
            
            middleware = Middleware(name: name, uri: uri)
        }
    }
    
    // MARK: actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        uriField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        checkValidData()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidData()
    }
    
    func checkValidData() {
        let name = nameField.text ?? ""
        let uri = uriField.text ?? ""
        saveButton.isEnabled = !name.isEmpty && !uri.isEmpty
    }

    // MARK: main
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        uriField.delegate = self
        checkValidData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

