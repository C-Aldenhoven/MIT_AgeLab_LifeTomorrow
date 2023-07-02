//
//  DirectMessageAPI.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 01.07.23.
//

import Foundation

class DirectMessageAPI {
    static func getDirectMessages() -> [DirectMessage]{
        let directMessage = [
            DirectMessage(name: "Jane", lastMessage: "Where did you find that resource\nagain?", lastMessageTime: "9:32 AM", unread: true),
            DirectMessage(name: "Marta", lastMessage: "How was the trip to the doctor?", lastMessageTime: "8:23 AM", unread: true),
            DirectMessage(name: "Jamaal", lastMessage: "You: I hope everything is going\nwell!", lastMessageTime: "Yesterday", unread: false),
            DirectMessage(name: "Michael", lastMessage: "I just had a pretty bad day :(", lastMessageTime: "Tuesday", unread: false)
        ]
        return directMessage
    }
}
