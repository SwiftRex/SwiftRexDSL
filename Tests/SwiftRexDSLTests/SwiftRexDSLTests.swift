import XCTest
import SwiftRex
@testable import SwiftRexDSL

final class SwiftRexDSLTests: XCTestCase {
    func testExample() {
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

class SomeMiddleware1: Middleware {
    typealias InputActionType = String
    typealias OutputActionType = String
    typealias StateType = String

    func receiveContext(getState: @escaping GetState<String>, output: AnyActionHandler<String>) {
    }

    func handle(action: String, from dispatcher: ActionSource, afterReducer: inout AfterReducer) {
    }
}

extension Reducer where ActionType == String, StateType == String {
    static var reducer1: Reducer {
        Reducer.reduce { _, _ in }
    }

    static var reducer2: Reducer {
        Reducer.reduce { _, _ in }
    }

    static var reducer3: Reducer {
        Reducer.reduce { _, _ in }
    }

    static var reducer4: Reducer {
        Reducer.reduce { _, _ in }
    }

    static var reducer5: Reducer {
        Reducer.reduce { _, _ in }
    }
}

let store = ReduxStoreBase(initial: "", emitsValue: .whenDifferent) {
    Reducer {
        Reducer.reducer1

        Reducer.reducer2

        Reducer.reducer3

        Reducer.reducer4

        Reducer.reducer5
    }

    ComposedMiddleware {
        SomeMiddleware1()

        LiftMiddleware(inputAction: Optional.some) {
            SomeMiddleware1()
        }

        SomeMiddleware1()

        SomeMiddleware1()

        AnyMiddleware {
            SomeMiddleware1()
        }

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()
    }
}
