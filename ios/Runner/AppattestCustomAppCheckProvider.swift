//
//  TestCustomAppCheckProvider.swift
//  Runner
//
//  Created by Arturo Jiménez de los Galanes Reguillos on 5/1/26.
//
import FirebaseCore
import FirebaseAppCheck

class AppattestCustomAppCheckProvider: AppAttestProvider {
  var app: FirebaseApp

    init?(withFirebaseApp app: FirebaseApp) {
    self.app = app
      super.init(app: app)
  }

    override func getToken() async throws -> AppCheckToken {
        return try await super.getToken()
    /*let getTokenTask = Task { () -> AppCheckToken in
      // ...

      // Create AppCheckToken object.
      let exp = Date(timeIntervalSince1970: expirationFromServer)
      let token = AppCheckToken(
        token: tokenFromServer,
        expirationDate: exp
      )

      if Date() > exp {
        throw NSError(domain: "ExampleError", code: 1, userInfo: nil)
      }

      return token
    }

    return try await getTokenTask.value*/
  }

}
