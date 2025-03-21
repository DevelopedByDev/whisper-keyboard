//
//  KeyboardViewController.swift
//  whisper-keyboard-ext
//
//  Created by Divyansh Lalwani on 3/17/25.
//

import UIKit
import Foundation
import AVFoundation


class KeyboardViewController: UIInputViewController {

    var isRecording: Bool = false
    private var recordingButton: UIButton!  // Add property to store button reference
    private var cancelButton: UIButton!  // Add property to store button reference


    // var inputView: UIView! TODO: See what inputView is

    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create recording button
        recordingButton = UIButton(type: .system)
        recordingButton.setTitle("Record", for: .normal)
        recordingButton.backgroundColor = .white
        recordingButton.setTitleColor(.red, for: .normal)
        recordingButton.layer.cornerRadius = 5
        recordingButton.translatesAutoresizingMaskIntoConstraints = false
        recordingButton.addTarget(self, action: #selector(recordingButtonTapped), for: .touchUpInside)
        
        // Create cancel button
        cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = .systemBlue
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.layer.cornerRadius = 5
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.isHidden = true
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

        
        // Add buttons to view
        self.view.addSubview(recordingButton)
        self.view.addSubview(cancelButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            recordingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            recordingButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            recordingButton.widthAnchor.constraint(equalToConstant: 100),
            recordingButton.heightAnchor.constraint(equalToConstant: 40),
            
            cancelButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cancelButton.topAnchor.constraint(equalTo: recordingButton.bottomAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: 80),
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
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
    @objc func recordingButtonTapped() {
        isRecording.toggle()
        recordingButton.setTitle(isRecording ? "Recording..." : "Record", for: .normal)
        recordingButton.backgroundColor = isRecording ? .systemRed : .white
        recordingButton.setTitleColor(isRecording ? .white : .red, for: .normal)
        
        // Show/hide cancel and stop buttons
        cancelButton.isHidden = !isRecording

        // TODO: Add recording logic
    }

    @objc func cancelButtonTapped() {
        recordingButtonTapped()
    }

}
