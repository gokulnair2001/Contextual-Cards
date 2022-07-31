//
//  HttpClient.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import Foundation

/// HTTP Method Types(Optional for this project)
enum HttpMethods: String {
    case POST, DELETE, UPDATE, PUT
}

/// MIME Types(Optional for this project)
enum MIMEType: String {
    case JSON = "application/json"
}

/// HTTP Header type
enum HttpHeaders: String {
    case contentType = "Content-Type"
}

/// HTTP Error Types
enum HttpError: Error {
    case badURl, badResponse, errorDecodingData, invalidURL
}

// MARK: - HTTP Client: Used to make server calls
class HttpClient {
    
    private init() {}
    
    static let shared = HttpClient()
    
    func fetch<T: Codable>(url: URL) async throws -> [T] {

        let (data, response) = try await URLSession.shared.data(from: url)
        
        /// Checks for Response Status
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HttpError.badResponse
        }
       
        // Decodes the JSON data using the provided Model
        guard let object = try? JSONDecoder().decode(T.self, from: data) else {
            throw HttpError.errorDecodingData
        }

        return [object]
    }
}
