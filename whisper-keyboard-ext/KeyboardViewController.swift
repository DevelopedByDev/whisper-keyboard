//
//  KeyboardViewController.swift
//  whisper-keyboard-ext
//
//  Created by Divyansh Lalwani on 3/17/25.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    var isRecording: Bool = false
    private var centerButton: UIButton!  // Add property to store button reference

    // var inputView: UIView! TODO: See what inputView is

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        
        // Create center button
        centerButton = UIButton(type: .system)  // Store reference to button
        centerButton.setTitle("Record", for: .normal)
        centerButton.backgroundColor = .systemGreen
        centerButton.setTitleColor(.white, for: .normal)
        centerButton.layer.cornerRadius = 5
        centerButton.sizeToFit()
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        centerButton.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(centerButton)
        
        // Center the button in the view
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            centerButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            centerButton.widthAnchor.constraint(equalToConstant: 100),  // Set your desired width
            centerButton.heightAnchor.constraint(equalToConstant: 40)   // Set your desired height
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    // Add this function to handle button taps
    @objc func centerButtonTapped() {
        isRecording.toggle()
        centerButton.setTitle(isRecording ? "Recording..." : "Record", for: .normal)
        textDocumentProxy.insertText("Hi")
    }

}
