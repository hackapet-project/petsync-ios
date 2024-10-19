//
//  AnimalsRemoteService.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import Foundation

protocol AnimalsRemoteService {
    func getAnimal(animalId: Int) async throws -> Animal
    func addAnimal(animal: Animal) async throws -> Animal
    func modifyAnimal(animal: Animal) async throws -> Animal
}

enum Endpoints: String {
    case animals = "/animals"
}

class LiveAnimalsRemoteService: AnimalsRemoteService {
    let baseURL: String = "https://naderver.com"
    let apiVersion: String = "/v1"
    
    func getAnimal(animalId: Int) async throws -> Animal {
        let urlString = baseURL + apiVersion + Endpoints.animals.rawValue + "/\(animalId)"
        guard let url = URL(string: urlString) else {
            throw ServiceErrors.invalidUrl
        }
        
        let session: (data: Data, response: URLResponse) = try await URLSession.shared.data(for: URLRequest(url: url))
        if let httpResponse = session.response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200..<300:
                print("Success \(httpResponse.statusCode)")
                let result = try JSONDecoder().decode(Animal.self, from: session.data)
                return result
            case 400..<500:
                print("Error in server \(httpResponse.statusCode)")
                throw ServiceErrors.serverError
            default:
                print("Error in server \(httpResponse.statusCode)")
                throw ServiceErrors.serverError
            }
        }
        
        throw ServiceErrors.invalidResponse
    }
    
    func addAnimal(animal: Animal) -> Animal {Animal()}
    func modifyAnimal(animal: Animal) -> Animal {Animal()}
}
