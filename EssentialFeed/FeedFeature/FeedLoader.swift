//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Surendra Karibandi on 04/07/21.
//

import Foundation

enum LoadFeedResult {
    case Success ([FeedItem])
    case Failure (Error)
}

protocol FeedLoader {
    func  loadFeed(completion: @escaping (LoadFeedResult) -> Void )
}
