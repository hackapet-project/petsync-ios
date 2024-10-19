//
//  Container.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//

class DependencyContainer {
    static func getAnimalsUseCase() -> any AnimalsUseCase {
        let service = LiveAnimalsRemoteService()
        let repository = LiveAnimalsRepository(service: service)
        return LiveAnimalsUseCase(repository: repository)
    }
}
