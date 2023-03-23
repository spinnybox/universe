package com.spinnybox.plugins.motions.motions

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

/** MotionsPlugin */
class MotionsPlugin: FlutterPlugin, EventChannel.StreamHandler, SensorEventListener {
  // A sensor manager instance to access sensor data
  private lateinit var sensorManager: SensorManager

  // A rotation vector sensor instance to get device orientation data
  private var rotationVectorSensor: Sensor? = null

  // A channel to communicate with the flutter side
  private lateinit var channel : EventChannel

  // A stream handler to send events to the flutter side
  private var eventSink: EventChannel.EventSink? = null

  // A variable to store the current rotation angle of the device around each axis (in radians)
  private var rotationAngle = mutableMapOf<String, Double>(
    "x" to 0.0,
    "y" to 0.0,
    "z" to 0.0,
  )

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    // Create a channel with a unique name
    channel = EventChannel(flutterPluginBinding.binaryMessenger, "motions")

    // Register this plugin as an event stream handler
    channel.setStreamHandler(this)

    // Get the sensor manager from the application context
    sensorManager = flutterPluginBinding.applicationContext.getSystemService(Context.SENSOR_SERVICE) as SensorManager

    // Get the rotation vector sensor from the sensor manager
    rotationVectorSensor = sensorManager.getDefaultSensor(Sensor.TYPE_ROTATION_VECTOR)

  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    // Unregister this plugin as an event stream handler
    channel.setStreamHandler(null)

    // Stop tracking device rotation changes
    stopTracking()

  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    // Set the event sink to send events to the flutter side
    eventSink = events

    // Start tracking device rotation changes
    startTracking()
  }

  override fun onCancel(arguments: Any?) {
    // Stop tracking device rotation changes
    stopTracking()
  }
}
