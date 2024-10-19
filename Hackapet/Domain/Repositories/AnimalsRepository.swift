//
//  AnimalsRepository.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import Foundation

protocol AnimalsRepository {
    func getAnimal(animalId: Int) async throws -> Animal
    func addAnimal(animal: Animal) async throws -> Animal
    func modifyAnimal(animal: Animal) async throws -> Animal
}
