//
//  NetworkingHelper.swift
//  UsersList
//
//  Created by Volnei Foss on 27/02/26.
//

import Foundation

//MARK: Request result
enum NetworkingError: Error {
    case invalidUrl
    case requestFailed
    case decodingError
}

final class NetworkingHelper {

    static let shared = NetworkingHelper()
    private init() {}

    private let decoder = JSONDecoder()

    // Método único e simples
    func doGet<T: Decodable>(
        urlString: String,
        parameters: [String: String]? = nil,
        headers: [String: String]? = nil
    ) async throws -> T {

        // 1. Monta URL com query params
        guard var components = URLComponents(string: urlString) else {
            throw NetworkingError.invalidUrl
        }

        if let parameters = parameters {
            components.queryItems = parameters.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }

        guard let url = components.url else {
            throw NetworkingError.invalidUrl
        }

        // 2. Cria request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        headers?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        // 3. Chamada
        let (data, response) = try await URLSession.shared.data(for: request)

        // 4. Valida status code
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkingError.requestFailed
        }

        // 5. Decode
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkingError.decodingError
        }
    }
}
