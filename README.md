# SwiftRexDSL

Configure your SwiftRex Store, Middleware and Reducers using new function builders

```swift
extension Reducer where ActionType == AppAction, StateType == AppState {
    static var reducer1: Reducer {
        Reducer.reduce { a, s in }
    }

    static var reducer2: Reducer {
        Reducer.reduce { a, s in }
    }

    static var reducer3: Reducer {
        Reducer.reduce { a, s in }
    }

    static var reducer4: Reducer {
        Reducer.reduce { a, s in }
    }

    static var reducer5: Reducer {
        Reducer.reduce { a, s in }
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

        LiftMiddleware(inputAction: AppAction.certainActionSubset) {
            SomeMiddleware2()
        }

        LiftMiddleware(outputAction: \AppAction.certainActionSubset) {
            SomeMiddleware3()
        }

        SomeMiddleware4()

        SomeMiddleware5()

        AnyMiddleware {
            SomeMiddleware6()
        }

        LiftMiddleware(inputAction: AppAction.certainActionSubset,
                       outputAction: \AppAction.certainActionSubset,
                       state: \AppState.mySubState) {
            SomeMiddleware7()
        }
    }
}
```
