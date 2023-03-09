//
//  PosterManager.swift
//  AppTask
//
//  Created by Mohamed Samaha on 07/03/2023.
//

import Foundation

enum ResponseFeedBack {
    case success(response: Int)
    case error(error: Error)
}

/// ENUMINATION FOR NETWORK CALL
enum Result {
    case success(data: Data)
    case error(error: Error)
}
struct PosterManager {
    
    /// This function handling the post request.
    ///  it post username and password to the server and return the data in closure.
    /// - Parameters:
    ///   - username: user's username entered text.
    ///   - password: user's password entered text.
    ///   - completionHandler: the complition escaping a data type of enumination type that have two cases failure and success
    ///   the failure returns a description error and the successer returns a respone (200 or 400 or etc).
    func postRequest(username: String, password: String, completionHandler: @escaping (ResponseFeedBack) -> Void) {
        
        //     MARK: 1. CONVERT URL TO URLSTRING.
        guard let baseURL = URL(string: "https://dummyjson.com/auth/login") else { fatalError("error") }
        
        let body: [String : String] = ["username": username, "password": password]
        do {
            let finalBody = try JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: baseURL)
            request.httpMethod = "POST"
            request.httpBody = finalBody
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            //     MARK: 2. CREATING A URLSESSION.
            let session = URLSession.shared
            //     MARK: 3. CREATING A DATATASK FROM URLSESSION.
            let task = session.dataTask(with: request) { data, response, error in
                if let httpResponse = response as? HTTPURLResponse {
                    guard response != nil else {
                        completionHandler(.error(error: error!))
                        return
                    }
                    completionHandler(.success(response: httpResponse.statusCode))
                    
                    }
            }
            //     MARK: 4. RESUME THE TSK.
            task.resume()
        } catch {
            print(error.localizedDescription)
            
        }
        
    }
    /// /// This function handling the get request.
    ///  it get all posts data.
    /// - Parameters:
    ///   - url: takes a url string to fetch the data from it.
    ///   - completionHandler: ///   - completionHandler: the complition escaping a data type of enumination type that have two cases failure and success
    ///   the success case returns a datatype of data that fetched from the internet..
    func fetchPosts(with url: String?, completionHandler: @escaping (Result) -> Void) {
        //     MARK: 1. CONVERT URL TO URLSTRING.
        guard let urlStr = URL(string: url!) else { return }
        
        //     MARK: 2. CREATING A URLSESSION.
        let session = URLSession(configuration: .default)
        //     MARK: CREATING A DATATASK FROM URLSESSION.
        let task = session.dataTask(with: urlStr) { data, _, error in
            guard let data = data else {
                completionHandler(.error(error: error!))
                return
            }
            completionHandler(.success(data: data))
        }
        task.resume()
    }
}

