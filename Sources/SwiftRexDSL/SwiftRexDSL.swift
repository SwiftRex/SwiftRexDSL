import CombineRex
import SwiftRex

@resultBuilder public struct StoreBuilder {
    public static func buildBlock<M: Middleware, Action, State>(_ reducer: Reducer<M.InputActionType, M.StateType>, _ middleware: M)
        -> (Reducer<Action, State>, M) where M.InputActionType == M.OutputActionType, M.InputActionType == Action, M.StateType == State {
        (reducer, middleware)
    }
}

extension ReduxStoreBase {
    public convenience init<M: Middleware>(
        initial: StateType,
        emitsValue: ShouldEmitValue<StateType>,
        @StoreBuilder content: () -> (Reducer<ActionType, StateType>, M)
    ) where M.InputActionType == M.OutputActionType, M.InputActionType == ActionType, M.StateType == StateType {
        let tuple = content()
        self.init(
            subject: .combine(initialValue: initial),
            reducer: tuple.0,
            middleware: tuple.1,
            emitsValue: emitsValue
        )
    }
}

// MARK: - DSL (Reducer)
@resultBuilder public struct ReducerBuilder {
    public static func buildBlock<Action, State>(_ rs: Reducer<Action, State>...) -> Reducer<Action, State> {
        rs.reduce(.identity, <>)
    }
}

extension Reducer {
    public init(@ReducerBuilder content: () -> Reducer<ActionType, StateType>) {
        self = content()
    }
}

// MARK: - DSL (Middleware)

@resultBuilder public struct MiddlewareBuilder {
    public static func buildBlock<M0: Middleware>(_ m0: M0) -> M0 {
        m0
    }

    public static func buildBlock<Action, State>(_ middlewares: AnyMiddleware<Action, Action, State>...)
    -> ComposedMiddleware<Action, Action, State> {
        var composed = ComposedMiddleware<Action, Action, State>()
        for m in middlewares {
            composed.append(middleware: m)
        }
        return composed
    }

    public static func buildBlock<M0: Middleware, M1: Middleware>(_ m0: M0, _ m1: M1)
    -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType {
        m0 <> m1
    }

    public static func buildBlock<M0: Middleware, M1: Middleware, M2: Middleware>(_ m0: M0, _ m1: M1, _ m2: M2)
    -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType,
        M0.InputActionType == M2.InputActionType, M0.OutputActionType == M2.OutputActionType, M0.StateType == M2.StateType {
        m0 <> m1 <> m2
    }

    public static func buildBlock<M0: Middleware, M1: Middleware, M2: Middleware, M3: Middleware>(_ m0: M0, _ m1: M1, _ m2: M2, _ m3: M3)
    -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType,
        M0.InputActionType == M2.InputActionType, M0.OutputActionType == M2.OutputActionType, M0.StateType == M2.StateType,
        M0.InputActionType == M3.InputActionType, M0.OutputActionType == M3.OutputActionType, M0.StateType == M3.StateType {
        m0 <> m1 <> m2 <> m3
    }

    public static func buildBlock<
        M0: Middleware,
        M1: Middleware,
        M2: Middleware,
        M3: Middleware,
        M4: Middleware
    >(
        _ m0: M0,
        _ m1: M1,
        _ m2: M2,
        _ m3: M3,
        _ m4: M4
    ) -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType,
        M0.InputActionType == M2.InputActionType, M0.OutputActionType == M2.OutputActionType, M0.StateType == M2.StateType,
        M0.InputActionType == M3.InputActionType, M0.OutputActionType == M3.OutputActionType, M0.StateType == M3.StateType,
        M0.InputActionType == M4.InputActionType, M0.OutputActionType == M4.OutputActionType, M0.StateType == M4.StateType {
        m0 <> m1 <> m2 <> m3 <> m4
    }

    public static func buildBlock<
        M0: Middleware,
        M1: Middleware,
        M2: Middleware,
        M3: Middleware,
        M4: Middleware,
        M5: Middleware
    >(
        _ m0: M0,
        _ m1: M1,
        _ m2: M2,
        _ m3: M3,
        _ m4: M4,
        _ m5: M5
    ) -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType,
        M0.InputActionType == M2.InputActionType, M0.OutputActionType == M2.OutputActionType, M0.StateType == M2.StateType,
        M0.InputActionType == M3.InputActionType, M0.OutputActionType == M3.OutputActionType, M0.StateType == M3.StateType,
        M0.InputActionType == M4.InputActionType, M0.OutputActionType == M4.OutputActionType, M0.StateType == M4.StateType,
        M0.InputActionType == M5.InputActionType, M0.OutputActionType == M5.OutputActionType, M0.StateType == M5.StateType {
        m0 <> m1 <> m2 <> m3 <> m4 <> m5
    }

    public static func buildBlock<
        M0: Middleware,
        M1: Middleware,
        M2: Middleware,
        M3: Middleware,
        M4: Middleware,
        M5: Middleware,
        M6: Middleware
    >(
        _ m0: M0,
        _ m1: M1,
        _ m2: M2,
        _ m3: M3,
        _ m4: M4,
        _ m5: M5,
        _ m6: M6
    )
    -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType,
        M0.InputActionType == M2.InputActionType, M0.OutputActionType == M2.OutputActionType, M0.StateType == M2.StateType,
        M0.InputActionType == M3.InputActionType, M0.OutputActionType == M3.OutputActionType, M0.StateType == M3.StateType,
        M0.InputActionType == M4.InputActionType, M0.OutputActionType == M4.OutputActionType, M0.StateType == M4.StateType,
        M0.InputActionType == M5.InputActionType, M0.OutputActionType == M5.OutputActionType, M0.StateType == M5.StateType,
        M0.InputActionType == M6.InputActionType, M0.OutputActionType == M6.OutputActionType, M0.StateType == M6.StateType {
        m0 <> m1 <> m2 <> m3 <> m4 <> m5 <> m6
    }

    public static func buildBlock<
        M0: Middleware,
        M1: Middleware,
        M2: Middleware,
        M3: Middleware,
        M4: Middleware,
        M5: Middleware,
        M6: Middleware,
        M7: Middleware
    >(
        _ m0: M0,
        _ m1: M1,
        _ m2: M2,
        _ m3: M3,
        _ m4: M4,
        _ m5: M5,
        _ m6: M6,
        _ m7: M7
    )
    -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType,
        M0.InputActionType == M2.InputActionType, M0.OutputActionType == M2.OutputActionType, M0.StateType == M2.StateType,
        M0.InputActionType == M3.InputActionType, M0.OutputActionType == M3.OutputActionType, M0.StateType == M3.StateType,
        M0.InputActionType == M4.InputActionType, M0.OutputActionType == M4.OutputActionType, M0.StateType == M4.StateType,
        M0.InputActionType == M5.InputActionType, M0.OutputActionType == M5.OutputActionType, M0.StateType == M5.StateType,
        M0.InputActionType == M6.InputActionType, M0.OutputActionType == M6.OutputActionType, M0.StateType == M6.StateType,
        M0.InputActionType == M7.InputActionType, M0.OutputActionType == M7.OutputActionType, M0.StateType == M7.StateType {
        m0 <> m1 <> m2 <> m3 <> m4 <> m5 <> m6 <> m7
    }

    public static func buildBlock<
        M0: Middleware,
        M1: Middleware,
        M2: Middleware,
        M3: Middleware,
        M4: Middleware,
        M5: Middleware,
        M6: Middleware,
        M7: Middleware,
        M8: Middleware
    >(
        _ m0: M0,
        _ m1: M1,
        _ m2: M2,
        _ m3: M3,
        _ m4: M4,
        _ m5: M5,
        _ m6: M6,
        _ m7: M7,
        _ m8: M8
    )
    -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType,
        M0.InputActionType == M2.InputActionType, M0.OutputActionType == M2.OutputActionType, M0.StateType == M2.StateType,
        M0.InputActionType == M3.InputActionType, M0.OutputActionType == M3.OutputActionType, M0.StateType == M3.StateType,
        M0.InputActionType == M4.InputActionType, M0.OutputActionType == M4.OutputActionType, M0.StateType == M4.StateType,
        M0.InputActionType == M5.InputActionType, M0.OutputActionType == M5.OutputActionType, M0.StateType == M5.StateType,
        M0.InputActionType == M6.InputActionType, M0.OutputActionType == M6.OutputActionType, M0.StateType == M6.StateType,
        M0.InputActionType == M7.InputActionType, M0.OutputActionType == M7.OutputActionType, M0.StateType == M7.StateType,
        M0.InputActionType == M8.InputActionType, M0.OutputActionType == M8.OutputActionType, M0.StateType == M8.StateType {
        m0 <> m1 <> m2 <> m3 <> m4 <> m5 <> m6 <> m7 <> m8
    }

    public static func buildBlock<
        M0: Middleware,
        M1: Middleware,
        M2: Middleware,
        M3: Middleware,
        M4: Middleware,
        M5: Middleware,
        M6: Middleware,
        M7: Middleware,
        M8: Middleware,
        M9: Middleware
    >(
        _ m0: M0,
        _ m1: M1,
        _ m2: M2,
        _ m3: M3,
        _ m4: M4,
        _ m5: M5,
        _ m6: M6,
        _ m7: M7,
        _ m8: M8,
        _ m9: M9
    )
    -> ComposedMiddleware<M0.InputActionType, M0.OutputActionType, M0.StateType>
    where M0.InputActionType == M1.InputActionType, M0.OutputActionType == M1.OutputActionType, M0.StateType == M1.StateType,
        M0.InputActionType == M2.InputActionType, M0.OutputActionType == M2.OutputActionType, M0.StateType == M2.StateType,
        M0.InputActionType == M3.InputActionType, M0.OutputActionType == M3.OutputActionType, M0.StateType == M3.StateType,
        M0.InputActionType == M4.InputActionType, M0.OutputActionType == M4.OutputActionType, M0.StateType == M4.StateType,
        M0.InputActionType == M5.InputActionType, M0.OutputActionType == M5.OutputActionType, M0.StateType == M5.StateType,
        M0.InputActionType == M6.InputActionType, M0.OutputActionType == M6.OutputActionType, M0.StateType == M6.StateType,
        M0.InputActionType == M7.InputActionType, M0.OutputActionType == M7.OutputActionType, M0.StateType == M7.StateType,
        M0.InputActionType == M8.InputActionType, M0.OutputActionType == M8.OutputActionType, M0.StateType == M8.StateType,
        M0.InputActionType == M9.InputActionType, M0.OutputActionType == M9.OutputActionType, M0.StateType == M9.StateType {
        m0 <> m1 <> m2 <> m3 <> m4 <> m5 <> m6 <> m7 <> m8 <> m9
    }
}

extension ComposedMiddleware {
    public init(@MiddlewareBuilder content: () -> ComposedMiddleware<InputActionType, OutputActionType, StateType>) {
        self = content()
    }
}

extension LiftMiddleware {
    // All different
    public init(
        inputAction: @escaping (GlobalInputActionType) -> PartMiddleware.InputActionType?,
        outputAction: @escaping (PartMiddleware.OutputActionType) -> GlobalOutputActionType,
        state: @escaping (GlobalStateType) -> PartMiddleware.StateType,
        @MiddlewareBuilder content: () -> PartMiddleware
    ) {
        self = content()
            .lift(
                inputAction: inputAction,
                outputAction: outputAction,
                state: state
            )
    }

    // Same input action
    public init(
        outputAction: @escaping (PartMiddleware.OutputActionType) -> GlobalOutputActionType,
        state: @escaping (GlobalStateType) -> PartMiddleware.StateType,
        @MiddlewareBuilder content: () -> PartMiddleware
    ) where InputActionType == PartMiddleware.InputActionType {
        self = content()
            .lift(
                inputAction: { $0 },
                outputAction: outputAction,
                state: state
            )
    }

    // Same output action
    public init(
        inputAction: @escaping (GlobalInputActionType) -> PartMiddleware.InputActionType?,
        state: @escaping (GlobalStateType) -> PartMiddleware.StateType,
        @MiddlewareBuilder content: () -> PartMiddleware
    ) where OutputActionType == PartMiddleware.OutputActionType {
        self = content()
            .lift(
                inputAction: inputAction,
                outputAction: { $0 },
                state: state
            )
    }

    // Same state
    public init(
        inputAction: @escaping (GlobalInputActionType) -> PartMiddleware.InputActionType?,
        outputAction: @escaping (PartMiddleware.OutputActionType) -> GlobalOutputActionType,
        @MiddlewareBuilder content: () -> PartMiddleware
    ) where StateType == PartMiddleware.StateType {
        self = content()
            .lift(
                inputAction: inputAction,
                outputAction: outputAction,
                state: { $0 }
            )
    }

    // Same input action and same output action
    public init(
        state: @escaping (GlobalStateType) -> PartMiddleware.StateType,
        @MiddlewareBuilder content: () -> PartMiddleware
    ) where InputActionType == PartMiddleware.InputActionType, PartMiddleware.OutputActionType == OutputActionType {
        self = content()
            .lift(
                inputAction: { $0 },
                outputAction: { $0 },
                state: state
            )
    }

    // Same input action and same state
    public init(
        outputAction: @escaping (PartMiddleware.OutputActionType) -> GlobalOutputActionType,
        @MiddlewareBuilder content: () -> PartMiddleware
    ) where InputActionType == PartMiddleware.InputActionType, StateType == PartMiddleware.StateType {
        self = content()
            .lift(
                inputAction: { $0 },
                outputAction: outputAction,
                state: { $0 }
            )
    }

    // Same output action and same state
    public init(
        inputAction: @escaping (GlobalInputActionType) -> PartMiddleware.InputActionType?,
        @MiddlewareBuilder content: () -> PartMiddleware
    ) where PartMiddleware.OutputActionType == OutputActionType, StateType == PartMiddleware.StateType {
        self = content()
            .lift(
                inputAction: inputAction,
                outputAction: { $0 },
                state: { $0 }
            )
    }
}

extension AnyMiddleware {
    // Nothing changes
    public init<M: Middleware>(
        @MiddlewareBuilder content: () -> M
    ) where M.InputActionType == InputActionType, M.OutputActionType == OutputActionType, M.StateType == StateType {
        self = content()
            .eraseToAnyMiddleware()
    }
}
