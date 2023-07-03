//
//  RemoteCarePostsAPI.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 03.07.23.
//

import Foundation

class RemoteCarePostsAPI {
    static func getPosts() -> [Post]{
        let posts = [
            Post(title: "Smart smoke detectors", text: "I have just read that smart smoke detectors can improve\nthe safety of older adults tremendously. Could anyone...", numberOfReplies: 3)
        ]
        return posts
    }
}
