//
//  BaseUseCase.swift
//  Hackapet
//
//  Created by FELIPE GADEA LLOPIS on 19/10/24.
//
import Foundation

protocol BaseUseCase {
    associatedtype T
    associatedtype E
    
    func execute(_ data: T?) async throws -> E
}
