# Monitor
Monitor is just a simple wrapper around NWPathMonitor. The monitor will receiving network path updates. So, whenever the network changes, the closure will get called and you can respond to changes in internet connectivity.<br>
Apple is strongly discouraging to use SCNetworkReachability. Instead you shpuld use NWPathMonitor. <br> The Network framework is really powerful. I can highly recommend to watch [this](https://developer.apple.com/videos/play/wwdc2018/715/) WWDC Session.

# Usage
Just drop the Monitor.swift file into your project and use it as follows.
The Closure is running on the **background queue**.
```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let monitor = Monitor()
        monitor.startMonitoring { [weak self] connection, reachable in
            guard let strongSelf = self else { return }
            strongSelf.doSomething(connection, reachable: reachable)
        }
    }

    private func doSomething(_ connection: Connection, reachable: Reachable) {
        print("Current Connection : \(connection) Is reachable: \(reachable)")
    }
}

```
Those are the information you can get. 
```swift
enum Reachable {
    case yes, no
}

enum Connection {
    case cellular, loopback, wifi, wiredEthernet, other
}
```


### Author

  [@reffas_bilal](https://twitter.com/Reffas_Bilal)
    
### License

```
MIT License

Copyright (c) 2019 Bilal Reffas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
