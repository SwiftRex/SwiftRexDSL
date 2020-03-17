# SwiftRexDSL

Configure your SwiftRex Store, Middleware and Reducers using new function builders

```swift
extension Reducer where ActionType == String, StateType == String {
    static var reducer1: Reducer {
        Reducer { a, s in s }
    }

    static var reducer2: Reducer {
        Reducer { a, s in s }
    }

    static var reducer3: Reducer {
        Reducer { a, s in s }
    }

    static var reducer4: Reducer {
        Reducer { a, s in s }
    }

    static var reducer5: Reducer {
        Reducer { a, s in s }
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

    ComposedMiddleware<String, String, String> {
        SomeMiddleware1()

        AnyMiddleware(inputAction: { a in .some(a) },
                      outputAction: { $0 },
                      state: { $0 }) {
            SomeMiddleware1()
        }

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()

        SomeMiddleware1()
    }
}
```
