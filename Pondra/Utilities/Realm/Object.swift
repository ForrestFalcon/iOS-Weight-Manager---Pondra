//
//  Object.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 03.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import Combine
import RealmSwift

extension Object {
    public struct RealmObjectPublisher<T: Object>: Publisher {
        public typealias Output = T
        public typealias Failure = Never

        let parent: T

        public init(_ parent: T) {
            self.parent = parent
        }

        public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, T == S.Input {
            subscriber.receive(subscription: RealmObjectSubscription(object: parent, subscriber: subscriber))
        }
    }

    public struct RealmObjectSubscription<SubscriberType: Subscriber, T: Object>: Subscription where SubscriberType.Input == T {
        private var token: NotificationToken

        public var combineIdentifier: CombineIdentifier {
            return CombineIdentifier(token)
        }

        init(object: SubscriberType.Input, subscriber: SubscriberType) {
            self.token = object.observe(subscriber)
        }

        public func request(_ demand: Subscribers.Demand) { }

        public func cancel() {
            token.invalidate()
        }
    }
}

extension Object: Combine.ObservableObject, Identifiable {
    
    public var objectWillChange: RealmObjectPublisher<Self> {
        RealmObjectPublisher(self as! Self)
    }

    /// Allows a subscriber to hook into Realm Changes.
    public func observe<S>(_ subscriber: S) -> NotificationToken where S: Subscriber, S.Input: Object {
        return observe { change in
            switch change {
            case .change:
                _ = subscriber.receive(self as! S.Input)
            case .deleted:
                subscriber.receive(completion: .finished)
            default:
                break
            }
        }
    }
}
