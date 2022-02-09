//
//  mercaritestUITests.swift
//  mercaritestUITests
//
//  Created by Varun Raj on 2022/02/01.

import XCTest
extension XCUIElement{}
import SwiftUI

class mercaritestUITests: XCTestCase {
    
    func testLaunch() throws {
        //Initializing Bundle ID for access App
        let mercariApp = XCUIApplication(bundleIdentifier: "com.kouzoh.ios.mercari")
        mercariApp.launch()
        //Actions for navigating to Add address page and adding address
        mercariApp.tabBars["タブバー"].buttons["マイページ"].tap()
        mercariApp.staticTexts["個人情報設定"].tap()
        mercariApp.staticTexts["発送元・お届け先住所"].tap()
        mercariApp.staticTexts["新しい住所を登録"].tap()
        let tablesQuery = mercariApp.tables
        let lnm = tablesQuery.textFields["例）山田"]
        let fnm = tablesQuery.textFields["例）彩"]
        let pincode = tablesQuery.textFields["例）1234567"]
        let housenum = tablesQuery.textFields["例）柳ビル 103"]
        let phnum = tablesQuery.textFields["例）09012345678"]
        let area = tablesQuery.textFields["例）青山 1-1-1"]
        lnm.tap()
        lnm.typeText("龍太")
        fnm.tap()
        fnm.typeText("佐藤")
        pincode.tap()
        pincode.typeText("2230051")
        area.tap()
        area.typeText("箕輪町　２２２")
        housenum.tap()
        housenum.typeText("3 - 25 - 28")
        phnum.tap()
        phnum.typeText("07085285123")
        //Saving the entered address to register
        mercariApp.buttons["登録する"].tap()
        //Validation of address is successfully saved
        XCTAssertTrue(mercariApp.tables.cells.containing(.button, identifier:"checkmark").staticTexts["龍太 佐藤 (リュウタ サトウ)\n〒223-0051\n神奈川県横浜市港北区箕輪町箕輪町 ２２２ 3 - 25 - 28"].exists)
    }
    
    func testProductSearch() throws {
        //Initializing Bundle ID for access App
        let mercariApp = XCUIApplication(bundleIdentifier: "com.kouzoh.ios.mercari")
        //Actions for searching a product and validation of targeted result.
        let searchField = mercariApp.textFields["キーワードからさがす"]
        mercariApp.launch()
        mercariApp.staticTexts["なにをお探しですか？"].tap()
        searchField.typeText("MacBook")
        mercariApp.buttons["Search"].tap()
        //Taping the 3rd element from the Scroll view from the screen.
        let elementsQuery = mercariApp.scrollViews.otherElements
        let element = elementsQuery.collectionViews.children(matching: .cell).matching(identifier: "com.kouzoh.ios.MercariKit.CollectionViewCell<ViewControllerResponseWrapper<ItemElement>>").element(boundBy: 2).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        //Sleep to improve accuracy of automation.
        sleep(5)
        //Verify result is matching with the expected Product searched.
        let identifierValue =
        mercariApp.staticTexts.matching(identifier:"com.mercari.item_detail.title.title_label").element.label.description
        XCTAssertTrue(identifierValue.localizedCaseInsensitiveContains("MacBook"))
    }
    
}
