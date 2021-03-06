//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

public protocol opaque_View {
    func opaque_environmentObject<B: ObservableObject>(_: B) -> opaque_View
    func opaque_getViewName() -> ViewName?
    
    func eraseToAnyView() -> AnyView
}

// MARK: - Implementation -

extension opaque_View where Self: View {
    @inlinable
    public func opaque_environmentObject<B: ObservableObject>(_ bindable: B) -> opaque_View {
        PassthroughView(content: environmentObject(bindable))
    }

    @inlinable
    public func opaque_getViewName() -> ViewName? {
        nil
    }
    
    @inlinable
    public func eraseToAnyView() -> AnyView {
        .init(self)
    }
}

extension ModifiedContent: opaque_View where Content: View, Modifier: ViewModifier {

}
