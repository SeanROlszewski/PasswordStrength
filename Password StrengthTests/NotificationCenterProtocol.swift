import Foundation

protocol NotificationCenterProtocol {
    func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue?, using block: @escaping (Notification) -> ()) -> NSObjectProtocol
    
    func removeObserver(_ observer: Any)
    
    func post(_ notification: Notification)
}

extension NotificationCenter: NotificationCenterProtocol {}
