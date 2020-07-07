
# Rikimaru

Rikimaru makes it easier to capture click events

## Requirements

Swift 5.0, iOS 10.0

## Example

It's very easy to used

Just like a notifaction, you need register a event handle
```swift
register("event") { parmas in
    /// Use the parmas to do anything you want
}
```

When you want to send a event, like this
```swift
resolve("event", parameters: ["hello", "world", 2020])
```

## Installation

Feel free to drag `Rikimaru` project to your iOS Project. But it's recommended to use Carthage.

### Carthage

```ogdl
github "tlzcode/Rikimaru"
```

## License

Proposer is available under the MIT license. See the LICENSE file for more info.