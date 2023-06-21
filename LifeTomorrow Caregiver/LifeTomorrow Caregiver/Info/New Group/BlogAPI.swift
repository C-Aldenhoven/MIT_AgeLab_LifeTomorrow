//
//  BlogAPI.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 21.06.23.
//

import Foundation

class BlogAPI {
    static func getBlogs() -> [Blog]{
        let blogs = [
            Blog(title: "10 Common Caregiving Mistakes", summary: "Learn the common mistakes now so you can\n avoid them later.", readingDuration: "5 mins"),
            Blog(title: "How I stay positive", summary: "Hear from seasoned caregivers about their\n methods of self-care.", readingDuration: "10 mins"),
            Blog(title: "What is burnout?", summary: "Burnout is complex but can be identified if you look\n out for it.", readingDuration: "3 mins"),
            Blog(title: "New tech for caregivers", summary: "New tech has emerged this year that can\n revolutionize how we care for our loved ones.", readingDuration: "5 mins")
        ]
        return blogs
    }
}
