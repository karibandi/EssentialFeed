//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Surendra Karibandi on 06/07/21.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping(Error) -> Void)
    
}



public class RemoteFeedLoader{
  private  let client: HTTPClient
  private  let url: URL
  public enum Error: Swift.Error{
    case connectivity
  }
   public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public  func load(completion: @escaping(Error) -> Void = {_ in })  {
        client.get(from: url){error in
            completion(.connectivity)
        }
    }
}
