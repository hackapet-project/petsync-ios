//
//  AnimalsUseCase.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import Foundation

protocol AnimalsUseCase : BaseUseCase {
    func execute(_ data: Int?) async throws -> Animal
}

class LiveAnimalsUseCase: AnimalsUseCase {
    let repository: AnimalsRepository
    
    init(repository: AnimalsRepository) {
        self.repository = repository
    }
    
    func execute(_ data: Int?) async throws -> Animal {
        guard let animalId = data else {
            throw DomainErrors.invalidData
        }
        return try await repository.getAnimal(animalId: animalId)
    }
}

