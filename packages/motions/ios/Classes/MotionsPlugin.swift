import Flutter
import UIKit
import CoreMotion

public class MotionsPlugin: NSObject, FlutterPlugin {
  // A motion manager instance to access device motion data
  let motionManager = CMMotionManager()

  // A channel to communicate with the flutter side
  var channel: FlutterEventChannel?

  // A stream handler to send events to the flutter side
  var eventSink: FlutterEventSink?

  // A variable to store the current rotation angle of the device around each axis (in radians)
  var rotationAngle: [String: Double] = [
    "x": 0,
    "y": 0,
    "z": 0,
  ]

  public static func register(with registrar: FlutterPluginRegistrar) {
    // Create a channel with a unique name
    let channel = FlutterEventChannel(name: "motions", binaryMessenger: registrar.messenger())

    // Create an instance of the plugin and set the channel
    let instance = MotionsPlugin()
    instance.channel = channel

    // Register the plugin as an event stream handler
    channel.setStreamHandler(instance)
  }

  public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    // Set the event sink to send events to the flutter side
    eventSink = events

    // Start tracking device rotation changes
    startTracking()

    return nil
  }

  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    // Stop tracking device rotation changes
    stopTracking()

    return nil
  }

  func startTracking() {
    // Check if device motion is available
    guard motionManager.isDeviceMotionAvailable else {
      print("Device motion is not available")
      return
    }

    // Start device motion updates with a specified interval (in seconds)
    motionManager.deviceMotionUpdateInterval = 0.1
    motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { [weak self] data, error in

      // Handle any error or nil data
      guard let data = data, error == nil else {
        print("Error getting device motion data: \(error?.localizedDescription ?? "unknown")")
        return
      }

      // Get the rotation rate around each axis (in radians per second)
      let xRate = data.rotationRate.x
      let yRate = data.rotationRate.y
      let zRate = data.rotationRate.z

      // Update the rotation angle around each axis by multiplying the rate by the interval (in radians)
      self?.rotationAngle["x"]! += xRate * 0.1
      self?.rotationAngle["y"]! += yRate * 0.1
      self?.rotationAngle["z"]! += zRate * 0.1

      // Check if any of the rotation angles has reached or exceeded 360 degrees (2 * pi radians)
      for (axis, angle) in self?.rotationAngle ?? [:] {
        if abs(angle) >= (1.5 * .pi) {
          // Send an event to the flutter side indicating a full rotation around that axis
          self?.eventSink?("Full rotation around \(axis) axis")

          // Reset the rotation angle for that axis to zero
          self?.rotationAngle[axis] = 0
        }
      }

    }

  }

  func stopTracking() {
    // Stop device motion updates
    motionManager.stopDeviceMotionUpdates()
  }
}
