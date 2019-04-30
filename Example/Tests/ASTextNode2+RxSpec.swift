//
//  ASTextNode2+RxExtensionSpec.swift
//
//  Created by Geektree0101.
//  Copyright © 2018 RxSwiftCommunity. All rights reserved.
//

import Quick
import Nimble
import RxTest
import RxSwift
import RxCocoa
import AsyncDisplayKit
@testable import RxCocoa_Texture

#if AS_ENABLE_TEXTNODE

class ASTextNode2_RxExtensionSpecSpec: QuickSpec {
    
    override func spec() {
        
        context("ASTextNode Reactive Extension  Unit Test") {
            
            let textNode1 = ASTextNode2()
            let textNode2 = ASTextNode2()
            let textNode3 = ASTextNode2()
            let textNode4 = ASTextNode2()
            
            let disposeBag = DisposeBag()
            
            beforeEach {
                Observable.just("apple")
                    .bind(to: textNode1.rx.text([:]))
                    .disposed(by: disposeBag)
                
                Observable.just(nil)
                    .bind(to: textNode2.rx.text([:]))
                    .disposed(by: disposeBag)
                
                Observable.just("banana")
                    .map({ NSAttributedString(string: $0) })
                    .bind(to: textNode3.rx.attributedText)
                    .disposed(by: disposeBag)
                
                Observable.just(nil)
                    .bind(to: textNode4.rx.attributedText)
                    .disposed(by: disposeBag)
            }
            
            it("should be emit expected event") {
                
                expect(textNode1.attributedText?.string).to(equal("apple"))
                expect(textNode2.attributedText?.string).to(equal(""))
                expect(textNode3.attributedText?.string).to(equal("banana"))
                expect(textNode4.attributedText?.string).to(equal(""))
            }
        }
    }
}

#endif
