//
//  AsyncProcessSpec.swift
//  CursoTests
//
//  Created by Juliano Santos on 21/4/23.
//  Copyright © 2023 Bruno Faganello. All rights reserved.
//

import Quick
import Nimble
@testable import Curso

class AsyncProcessSpec: QuickSpec {
    
    override func spec() {
        describe("AsyncProcess") {
            context("callThatResultsInSideEffect") {
                it("Variable has been changed") {
                    let asyncProcess = AsyncProcess()
                    asyncProcess.callThatResultsInSideEffect()
                    expect(asyncProcess.name).toEventually(equal("Curso"))
                }
                
                it("Do stuff") {
                    let asyncProcess = AsyncProcess()

                    waitUntil { done in
                        asyncProcess.doStuff { result in
                            expect(result).to(equal("Curso"))
                            done()
                        }
                    }
                }
            }
        }
    }
    
}
