//
//  ChannelAPI.swift
//  LifeTomorrow Caregiver
//
//  Created by Céline Aldenhoven on 01.07.23.
//

import Foundation

class ChannelAPI {
    static func getChannels() -> [Channel]{
        let channel = [
            Channel(name: "Mental Health", description: "A place to share about a challenging\nday and provide support to others\nwhen you can.", members: 245, starred: true),
            Channel(name: "Remote Care", description: "Share tips and tricks about remote\ncaregiving and maybe learn\nsomething new!", members: 503, starred: false),
            Channel(name: "Dementia", description: "Hear and share experiences caring\nfor someone with dementia.", members: 118, starred: false)
        ]
        return channel
    }
}
