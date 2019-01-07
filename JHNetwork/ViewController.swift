//
//  ViewController.swift
//  JHNetwork
//
//  Created by Jonhory on 2017/2/21.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url2 = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=218.4.255.255"
    let url3 = "https://www.sojson.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test7()
    }
    
    func test7() {
        let p = ["OS": "iOS", "version": "1.0"]
        let task = JHNetwork.shared.requestJSON(methodType: .post, urlStr: url2, refreshCache: true, isCache: true, parameters: p, remark: "测试一下") { (js, erro) in
            
        }
        task?.cancel()
    }
    
    
    
    func test6() {
        JHNetwork.shared.getForJSON(url: "http://www.baidu.com", remark: "百度一下") { _,_ in }
    }
    
    func test5() {
        JHNetwork.shared.clearCaches()
    }
    
    func test4() {
        WLog(JHNetwork.shared.totalCacheSize())
    }
    
    func test3() {
        var params: [String: Any]? = [:]
        params?["haha"] = [1,2,3,4]
        params?["nihao"] = "jjj"
        params?["hehe"] = [:]
        
        _ = JHNetwork.shared.getCacheForJSON(url: url2, parameters: params) { (js, _) in
            
        }
        
//        JHNetwork.shared.getCacheForJSON(url: url2, parameters: params) { print($0) }
    }
    
    func test2() {
        JHNetwork.shared.baseUrl = url3
        let par: [String: Any]? = [:]
        JHNetwork.shared.encodeAble = true
        _ = JHNetwork.shared.getNoCacheForJSON(url: "/open/api/weather/json.shtml?city=北京", parameters: par) { (re, er) in
            if er != nil {
                print("error = \(String(describing: er!))")
            }else{
                print("response = \(String(describing: re ?? "nil resp"))")
            }
        }
    }
    
    var i = 0
    
    func test1() {
        JHNetwork.shared.baseUrl = "http://int.dpool.sina.com.cn"
        
        
        _ = JHNetwork.shared.getForJSON(url: url2, refreshCache: true, parameters: nil) { (result, error) in
            if self.i < 2 {
                self.i += 1
                self.test1()
            }
        }
        
//        JHNetwork.shared.getForJSON(url: url2, refreshCache: true, parameters: ["name":"jj"]) { (result, error) in
//        }
        
        JHNetwork.shared.shoulObtainLocalWhenUnconnected(shouldObtain: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

