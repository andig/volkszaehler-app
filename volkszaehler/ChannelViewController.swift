//
//  ChannelViewController.swift
//  volkszaehler
//
//  Created by Andreas Götz on 09/10/2016.
//  Copyright © 2016 Andreas Götz. All rights reserved.
//

import UIKit

class ChannelViewController: UIViewController, UITextFieldDelegate {
    
    var channel: Channel?
    
    @IBOutlet weak var uuidField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // MARK: actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if saveButton === sender as? UIBarButtonItem {
            let uuid = uuidField.text!
            channel = Channel(uuid: uuid)
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        uuidField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        checkValidData()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidData()
    }
    
    // MARK: main
    
    func checkValidData() {
        let name = uuidField.text ?? ""
        saveButton.isEnabled = !name.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        uuidField.delegate = self
        checkValidData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
