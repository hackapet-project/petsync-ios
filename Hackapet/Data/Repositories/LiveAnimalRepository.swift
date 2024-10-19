//
//  LiveAnimalRepository.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import Foundation

class LiveAnimalsRepository: AnimalsRepository {
    let service: AnimalsRemoteService
    
    init(service: AnimalsRemoteService) {
        self.service = service
    }
    
    func getAnimal(animalId: Int) async throws -> Animal {
        try await service.getAnimal(animalId: animalId)
    }
    func addAnimal(animal: Animal) async throws -> Animal {
        try await service.addAnimal(animal: animal)
    }
    func modifyAnimal(animal: Animal) async throws -> Animal {
        try await service.modifyAnimal(animal: animal)
    }
}
