//
//  MentalHealthPostsAPI.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 02.07.23.
//

import Foundation

class MentalHealthPostsAPI {
    static func getPosts() -> [Post]{
        let posts = [
            Post(title: "Thoughts on mindfulness?", text: "I am curious about practicing mindfulness and meditation\nbut I don’t know where to start. Do anyone have any\nsuggestions...", numberOfReplies: 4),
            Post(title: "What is a good nighttime routine?", text: "I have been struggling to wind down before bed since I\nstarted taking care of my dad. What do people tend to do...", numberOfReplies: 3),
            Post(title: "A bad day. I need support.", text: "I have just had the worst day today and I could really do\nwith some words of encouragement. I will say that if it\nwasn’t...", numberOfReplies: 2)
        ]
        return posts
    }
}
