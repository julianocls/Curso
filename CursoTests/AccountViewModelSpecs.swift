//
//  AccountViewModelSpecs.swift
//  CursoTests
//
//  Created by Juliano Santos on 18/4/23.
//  Copyright © 2023 Bruno Faganello. All rights reserved.
//

import Nimble
import Quick
@testable import Curso

class AccountViewModelSpecs: QuickSpec {

    override func spec() {
        describe("AccountViewModel") {
                       
            var sut: AccountViewModel!
            
            context("Should Request Location") {
                
                var showAlert: Bool!
                var askUserPermition: Bool!
                var completion: Bool!
                
                beforeEach {
                    showAlert = false
                    askUserPermition = false
                    completion = false
                }
                
                it("Use Location True") {
                    sut = AccountViewModel(shouldUseLocation: true, model: AccountModel.init(instruction: "test"))
                    
                    sut.shouldRequestLocation {
                        showAlert = true
                    } askUserPermission: {
                        askUserPermition = true
                    } completion: {
                        completion = true
                    }
                    
                    expect(showAlert).to(equal(false))
                    expect(askUserPermition).to(equal(true))
                    expect(completion).to(equal(true))
                }

                it("Use Location False") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel.init(instruction: "test"))
                    
                    sut.shouldRequestLocation {
                        showAlert = true
                    } askUserPermission: {
                        askUserPermition = true
                    } completion: {
                        completion = true
                    }
                    
                    expect(showAlert).to(equal(true))
                    expect(askUserPermition).to(equal(false))
                    expect(completion).to(equal(true))
                }
                
                it("loginButtonTap") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel.init(instruction: "test"))
                    
                    expect(sut.loginButtonTap()).to(beVoid())
                }
            }
            
            context("AccountViewModelProtocol") {
                it("Verify AccountViewModelProtocol") {
                    sut = AccountViewModel(shouldUseLocation: false, model: AccountModel.init(instruction: ""))

                    expect(sut).to(beAKindOf(AccountViewModelProtocol.self))
                }
            }
        }
    }
    
    
}
