open class Box<T> {
    typealias Listener = (T) -> Void
    open var listener: Listener?
    
    open var value: T {
        didSet {
            listener?(value)
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}


