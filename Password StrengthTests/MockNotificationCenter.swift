import Foundation
@testable import Password_Strength

class MockNotificationCenter: NotificationCenterProtocol {
    typealias addObserverArguments = (name: NSNotification.Name?, object: Any?, queue: OperationQueue?, block: (Notification) -> ())?
    var addObserverCall: (recieved: addObserverArguments, returns: NSObjectProtocol?, callCount: Int) = (recieved: nil, returns: NSObject(), callCount: 0)
    
    func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> ()) -> NSObjectProtocol {
        let arguments = (name: name, object: obj, queue: queue, block: block)
        let callCount = addObserverCall.callCount + 1
        addObserverCall.recieved = arguments
        addObserverCall.callCount = callCount
        return addObserverCall.returns!
    }
    
    func post(_ notification: Notification) {
        addObserverCall.recieved?.block(notification)
    }
    
    func removeObserver(_ observer: Any) {}
}
