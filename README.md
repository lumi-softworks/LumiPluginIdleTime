# LumiPluginIdleTime

📖 English | [中文版](README_zh.md)

Lumi editor plugin (idle time tracking).

> Plugin package contract: no implementation dependency on any other concrete plugin; it only consumes the `*Providing` capabilities offered by `LumiProviders`.

## Package

- Package: `LumiPluginIdleTime`
- Product: `PluginIdleTime`
- Platform: macOS 14+ / iOS 17+
- Swift tools: 6.0

## What It Provides

An idle time activity tracking plugin. The host resolves the kernel-registered `IdleTimeProviding` in `onBoot`:

- Listens to activity events such as app activation and editor saves, throttles them, and feeds them to the service for rest-window inference;
- Contributes about docs and the user manual.

## Dependencies and Integration

```swift
dependencies: [
    .package(url: "https://github.com/lumi-softworks/LumiPluginIdleTime.git", from: "1.0.0"),
],
targets: [
    .target(name: "YourTarget", dependencies: [
        .product(name: "PluginIdleTime", package: "LumiPluginIdleTime"),
    ]),
]
```

The host must also instantiate `IdleTimePlugin()` in its `PluginFactory` and register `IdleTimeProviding` in its `ProviderFactory` (the factory already has a built-in `IdleTimeService` default implementation).

## Testing

```sh
swift test
```