@testable import WUEnvironment
import XCTest

class WUEnvironmentManagerTests: XCTestCase {
    // MARK: - Properties
    
    // MARK: - Life Cycle
}

// MARK: - Tests when equal

extension WUEnvironmentManagerTests {
    func test_StoreRetrieve_Develop() {
        // Given
        let environment = WUEnvironment.development
        
        // When
        WUManagerEnvironment.changeEnvironmentTo(environment)
        let expectedResult = WUManagerEnvironment.getStoredEnvironment()
        
        // Then
        XCTAssertEqual(expectedResult, environment)
    }
    
    func test_StoreRetrieve_Staging() {
        // Given
        let environment = WUEnvironment.staging
        
        // When
        WUManagerEnvironment.changeEnvironmentTo(environment)
        let expectedResult = WUManagerEnvironment.getStoredEnvironment()
        
        // Then
        XCTAssertEqual(expectedResult, environment)
    }
    
    func test_StoreRetrieve_Production() {
        // Given
        let environment = WUEnvironment.production
        
        // When
        WUManagerEnvironment.changeEnvironmentTo(environment)
        let expectedResult = WUManagerEnvironment.getStoredEnvironment()
        
        // Then
        XCTAssertEqual(expectedResult, environment)
    }
    
    func test_StoreRetrieve_Custom() {
        // Given
        let url = "https://url.com"
        let environment = WUEnvironment.custom(url: url)
        
        // When
        WUManagerEnvironment.changeEnvironmentTo(environment)
        let expectedResult = WUManagerEnvironment.getStoredEnvironment()
        
        // Then
        XCTAssertEqual(expectedResult, environment)
    }
}

// MARK: - Tests when different

extension WUEnvironmentManagerTests {
    func test_StoreDevelopment_Retrieve_Staging() {
        // Given
        let environment = WUEnvironment.staging
        let environmentToChange = WUEnvironment.development
        
        // When
        WUManagerEnvironment.changeEnvironmentTo(environmentToChange)
        let expectedResult = WUManagerEnvironment.getStoredEnvironment()
        
        // Then
        XCTAssertNotEqual(expectedResult, environment)
    }
    
    func test_StoreStaging_Retrieve_Production() {
        // Given
        let environment = WUEnvironment.production
        let environmentToChange = WUEnvironment.staging
        
        // When
        WUManagerEnvironment.changeEnvironmentTo(environmentToChange)
        let expectedResult = WUManagerEnvironment.getStoredEnvironment()
        
        // Then
        XCTAssertNotEqual(expectedResult, environment)
    }
    
    func test_StoreProduction_Retrieve_Staging() {
        // Given
        let environment = WUEnvironment.staging
        let environmentToChange = WUEnvironment.production
        
        // When
        WUManagerEnvironment.changeEnvironmentTo(environmentToChange)
        let expectedResult = WUManagerEnvironment.getStoredEnvironment()
        
        // Then
        XCTAssertNotEqual(expectedResult, environment)
    }
    
    func test_StoreCustom_Retrieve_Production() {
        // Given
        let url = "https://url.com"
        let environment = WUEnvironment.production
        let environmentToChange = WUEnvironment.custom(url: url)
        
        // When
        WUManagerEnvironment.changeEnvironmentTo(environmentToChange)
        let expectedResult = WUManagerEnvironment.getStoredEnvironment()
        
        // Then
        XCTAssertNotEqual(expectedResult, environment)
    }
}
