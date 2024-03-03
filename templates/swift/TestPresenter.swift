//
//  TestPresenter.swift
//
//
//  Created by Michał Kos on 19/02/2024.
//  Copyright © 2024 Droids On Roids. All rights reserved.
//

import CCCProtocolsModels
import CCCResources

import SwiftUI

public protocol TestPresenterDelegate: AnyObject, AutoMockable {}

public protocol TestPresenterProtocol: ObservableObject, AutoMockable {}

public final class TestPresenter {
    private weak var delegate: TestPresenterDelegate?

    private let interactor: TestPresenterInteractorProtocol

    public init(
        delegate: TestPresenterDelegate?,
        interactor: TestPresenterInteractorProtocol
    ) {
        self.delegate = delegate
        self.interactor = interactor
    }
}

extension TestPresenter: TestPresenterProtocol {}
