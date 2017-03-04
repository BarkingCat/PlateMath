//
//  Request.swift
//  Credila
//

import Foundation

public class WSRequest {
    
    class func GetBaseURL() -> String {
        let baseAPI = "http://www.credila.info/appinterface/referral-app"
        let baseURL = baseAPI + "/referralApi.php"
        return baseURL;
    }
    
    class func GetHeaders() -> [String : String] {
        
        let headers = [
            "Authorization": "2A3271CE-91CD-29A8-A257-038965F36D8B"
        ]
        
        return headers;
    }
    
    class func GetLoginURL() -> String {
        //return WSRequest.GetBaseURL() + "/userLogin";
        return WSRequest.GetBaseURL();
    }
    
    class func GetRegistrationURL() -> String {
        return WSRequest.GetBaseURL() + "/doRegister";
    }
    
    class func GetUserReferencesList() -> String {
        return WSRequest.GetBaseURL() + "/getUserReferences";
    }
    
    class func GetRegisterDeviceURL() -> String {
        return WSRequest.GetBaseURL() + "/registerDevice";
    }
    
    class func GetMasterSyncData() -> String {
        return WSRequest.GetBaseURL() + "/syncDatabase"
    }
}
