//
//  EmojiClass.swift
//  testBranchNew
//
//  Created by Nobby on 29/11/18.
//  Copyright © 2018 Nobby. All rights reserved.
//

import Foundation
import ISEmojiView

class EmojiClass : EmojiViewDelegate
{
    var emojitextField:UITextField!
    init(textview:UITextField)
    {
        emojitextField = textview
    }
    
    
    func emojiViewDidSelectEmoji(_ emoji: String, emojiView: EmojiView) {
        emojitextField.insertText(emoji)
    }
    
    // callback when tap change keyboard button on keyboard
    func emojiViewDidPressChangeKeyboardButton(_ emojiView: EmojiView) {
        emojitextField.inputView = nil
        emojitextField.keyboardType = .default
        emojitextField.reloadInputViews()
    }
    
    // callback when tap delete button on keyboard
    func emojiViewDidPressDeleteBackwardButton(_ emojiView: EmojiView) {
        emojitextField.deleteBackward()
    }
    
    // callback when tap dismiss button on keyboard
    func emojiViewDidPressDismissKeyboardButton(_ emojiView: EmojiView) {
        emojitextField.resignFirstResponder()
    }
    
    // func Add Emoji View
    func ShowEmojiView()
    {
        let keyboardSettings = KeyboardSettings(bottomType: .categories)
        let emojiView = EmojiView(keyboardSettings: keyboardSettings)
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        emojiView.delegate = self
        emojitextField.inputView = emojiView
    }
   
}
