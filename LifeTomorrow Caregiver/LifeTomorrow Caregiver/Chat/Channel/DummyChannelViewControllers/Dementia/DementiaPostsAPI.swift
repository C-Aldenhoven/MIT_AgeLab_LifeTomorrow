//
//  DementiaPostsAPI.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 03.07.23.
//

import Foundation

class DementiaPostsAPI {
    static func getPosts() -> [Post]{
        let posts = [
            Post(title: "What to do about wandering?", text: "My mother just started wandering for the first time\nyesterday. Has anyone had experiences with that and\ncould maybe...", numberOfReplies: 2),
            Post(title: "Meaningful things to do", text: "Has anyone some ideas about some meaningful things to\ndo for my mother who has dementia?", numberOfReplies: 2)
        ]
        return posts
    }
}

