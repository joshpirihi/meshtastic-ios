// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: admin.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

///
/// This message is handled by the Admin plugin and is responsible for all settings/channel read/write operations.
/// This message is used to do settings operations to both remote AND local nodes.
/// (Prior to 1.2 these operations were done via special ToRadio operations)
struct AdminMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var variant: AdminMessage.OneOf_Variant? = nil

  ///
  /// set the radio provisioning for this node
  var setRadio: RadioConfig {
    get {
      if case .setRadio(let v)? = variant {return v}
      return RadioConfig()
    }
    set {variant = .setRadio(newValue)}
  }

  ///
  /// Set the owner for this node
  var setOwner: User {
    get {
      if case .setOwner(let v)? = variant {return v}
      return User()
    }
    set {variant = .setOwner(newValue)}
  }

  ///
  /// Set channels (using the new API).
  /// A special channel is the "primary channel".
  /// The other records are secondary channels.
  /// Note: only one channel can be marked as primary.
  /// If the client sets a particular channel to be primary, the previous channel will be set to SECONDARY automatically.
  var setChannel: Channel {
    get {
      if case .setChannel(let v)? = variant {return v}
      return Channel()
    }
    set {variant = .setChannel(newValue)}
  }

  ///
  /// Send the current RadioConfig in the response for this message.
  var getRadioRequest: Bool {
    get {
      if case .getRadioRequest(let v)? = variant {return v}
      return false
    }
    set {variant = .getRadioRequest(newValue)}
  }

  var getRadioResponse: RadioConfig {
    get {
      if case .getRadioResponse(let v)? = variant {return v}
      return RadioConfig()
    }
    set {variant = .getRadioResponse(newValue)}
  }

  ///
  /// Send the specified channel in the response for this message
  /// NOTE: This field is sent with the channel index + 1 (to ensure we never try to send 'zero' - which protobufs treats as not present)
  var getChannelRequest: UInt32 {
    get {
      if case .getChannelRequest(let v)? = variant {return v}
      return 0
    }
    set {variant = .getChannelRequest(newValue)}
  }

  var getChannelResponse: Channel {
    get {
      if case .getChannelResponse(let v)? = variant {return v}
      return Channel()
    }
    set {variant = .getChannelResponse(newValue)}
  }

  ///
  /// Setting channels/radio config remotely carries the risk that you might send an invalid config and the radio never talks to your mesh again.
  /// Therefore if setting either of these properties remotely, you must send a confirm_xxx message within 10 minutes.
  /// If you fail to do so, the radio will assume loss of comms and revert your changes.
  /// These messages are optional when changing the local node.
  var confirmSetChannel: Bool {
    get {
      if case .confirmSetChannel(let v)? = variant {return v}
      return false
    }
    set {variant = .confirmSetChannel(newValue)}
  }

  var confirmSetRadio: Bool {
    get {
      if case .confirmSetRadio(let v)? = variant {return v}
      return false
    }
    set {variant = .confirmSetRadio(newValue)}
  }

  ///
  /// This message is only supported for the simulator porduino build.
  /// If received the simulator will exit successfully.
  var exitSimulator: Bool {
    get {
      if case .exitSimulator(let v)? = variant {return v}
      return false
    }
    set {variant = .exitSimulator(newValue)}
  }

  ///
  /// Tell the node to reboot in this many seconds (or <0 to cancel reboot)
  var rebootSeconds: Int32 {
    get {
      if case .rebootSeconds(let v)? = variant {return v}
      return 0
    }
    set {variant = .rebootSeconds(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_Variant: Equatable {
    ///
    /// set the radio provisioning for this node
    case setRadio(RadioConfig)
    ///
    /// Set the owner for this node
    case setOwner(User)
    ///
    /// Set channels (using the new API).
    /// A special channel is the "primary channel".
    /// The other records are secondary channels.
    /// Note: only one channel can be marked as primary.
    /// If the client sets a particular channel to be primary, the previous channel will be set to SECONDARY automatically.
    case setChannel(Channel)
    ///
    /// Send the current RadioConfig in the response for this message.
    case getRadioRequest(Bool)
    case getRadioResponse(RadioConfig)
    ///
    /// Send the specified channel in the response for this message
    /// NOTE: This field is sent with the channel index + 1 (to ensure we never try to send 'zero' - which protobufs treats as not present)
    case getChannelRequest(UInt32)
    case getChannelResponse(Channel)
    ///
    /// Setting channels/radio config remotely carries the risk that you might send an invalid config and the radio never talks to your mesh again.
    /// Therefore if setting either of these properties remotely, you must send a confirm_xxx message within 10 minutes.
    /// If you fail to do so, the radio will assume loss of comms and revert your changes.
    /// These messages are optional when changing the local node.
    case confirmSetChannel(Bool)
    case confirmSetRadio(Bool)
    ///
    /// This message is only supported for the simulator porduino build.
    /// If received the simulator will exit successfully.
    case exitSimulator(Bool)
    ///
    /// Tell the node to reboot in this many seconds (or <0 to cancel reboot)
    case rebootSeconds(Int32)

  #if !swift(>=4.1)
    static func ==(lhs: AdminMessage.OneOf_Variant, rhs: AdminMessage.OneOf_Variant) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.setRadio, .setRadio): return {
        guard case .setRadio(let l) = lhs, case .setRadio(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.setOwner, .setOwner): return {
        guard case .setOwner(let l) = lhs, case .setOwner(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.setChannel, .setChannel): return {
        guard case .setChannel(let l) = lhs, case .setChannel(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.getRadioRequest, .getRadioRequest): return {
        guard case .getRadioRequest(let l) = lhs, case .getRadioRequest(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.getRadioResponse, .getRadioResponse): return {
        guard case .getRadioResponse(let l) = lhs, case .getRadioResponse(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.getChannelRequest, .getChannelRequest): return {
        guard case .getChannelRequest(let l) = lhs, case .getChannelRequest(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.getChannelResponse, .getChannelResponse): return {
        guard case .getChannelResponse(let l) = lhs, case .getChannelResponse(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.confirmSetChannel, .confirmSetChannel): return {
        guard case .confirmSetChannel(let l) = lhs, case .confirmSetChannel(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.confirmSetRadio, .confirmSetRadio): return {
        guard case .confirmSetRadio(let l) = lhs, case .confirmSetRadio(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.exitSimulator, .exitSimulator): return {
        guard case .exitSimulator(let l) = lhs, case .exitSimulator(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.rebootSeconds, .rebootSeconds): return {
        guard case .rebootSeconds(let l) = lhs, case .rebootSeconds(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension AdminMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "AdminMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "set_radio"),
    2: .standard(proto: "set_owner"),
    3: .standard(proto: "set_channel"),
    4: .standard(proto: "get_radio_request"),
    5: .standard(proto: "get_radio_response"),
    6: .standard(proto: "get_channel_request"),
    7: .standard(proto: "get_channel_response"),
    32: .standard(proto: "confirm_set_channel"),
    33: .standard(proto: "confirm_set_radio"),
    34: .standard(proto: "exit_simulator"),
    35: .standard(proto: "reboot_seconds"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: RadioConfig?
        var hadOneofValue = false
        if let current = self.variant {
          hadOneofValue = true
          if case .setRadio(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.variant = .setRadio(v)
        }
      }()
      case 2: try {
        var v: User?
        var hadOneofValue = false
        if let current = self.variant {
          hadOneofValue = true
          if case .setOwner(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.variant = .setOwner(v)
        }
      }()
      case 3: try {
        var v: Channel?
        var hadOneofValue = false
        if let current = self.variant {
          hadOneofValue = true
          if case .setChannel(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.variant = .setChannel(v)
        }
      }()
      case 4: try {
        var v: Bool?
        try decoder.decodeSingularBoolField(value: &v)
        if let v = v {
          if self.variant != nil {try decoder.handleConflictingOneOf()}
          self.variant = .getRadioRequest(v)
        }
      }()
      case 5: try {
        var v: RadioConfig?
        var hadOneofValue = false
        if let current = self.variant {
          hadOneofValue = true
          if case .getRadioResponse(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.variant = .getRadioResponse(v)
        }
      }()
      case 6: try {
        var v: UInt32?
        try decoder.decodeSingularUInt32Field(value: &v)
        if let v = v {
          if self.variant != nil {try decoder.handleConflictingOneOf()}
          self.variant = .getChannelRequest(v)
        }
      }()
      case 7: try {
        var v: Channel?
        var hadOneofValue = false
        if let current = self.variant {
          hadOneofValue = true
          if case .getChannelResponse(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.variant = .getChannelResponse(v)
        }
      }()
      case 32: try {
        var v: Bool?
        try decoder.decodeSingularBoolField(value: &v)
        if let v = v {
          if self.variant != nil {try decoder.handleConflictingOneOf()}
          self.variant = .confirmSetChannel(v)
        }
      }()
      case 33: try {
        var v: Bool?
        try decoder.decodeSingularBoolField(value: &v)
        if let v = v {
          if self.variant != nil {try decoder.handleConflictingOneOf()}
          self.variant = .confirmSetRadio(v)
        }
      }()
      case 34: try {
        var v: Bool?
        try decoder.decodeSingularBoolField(value: &v)
        if let v = v {
          if self.variant != nil {try decoder.handleConflictingOneOf()}
          self.variant = .exitSimulator(v)
        }
      }()
      case 35: try {
        var v: Int32?
        try decoder.decodeSingularInt32Field(value: &v)
        if let v = v {
          if self.variant != nil {try decoder.handleConflictingOneOf()}
          self.variant = .rebootSeconds(v)
        }
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.variant {
    case .setRadio?: try {
      guard case .setRadio(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }()
    case .setOwner?: try {
      guard case .setOwner(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case .setChannel?: try {
      guard case .setChannel(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }()
    case .getRadioRequest?: try {
      guard case .getRadioRequest(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularBoolField(value: v, fieldNumber: 4)
    }()
    case .getRadioResponse?: try {
      guard case .getRadioResponse(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }()
    case .getChannelRequest?: try {
      guard case .getChannelRequest(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularUInt32Field(value: v, fieldNumber: 6)
    }()
    case .getChannelResponse?: try {
      guard case .getChannelResponse(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }()
    case .confirmSetChannel?: try {
      guard case .confirmSetChannel(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularBoolField(value: v, fieldNumber: 32)
    }()
    case .confirmSetRadio?: try {
      guard case .confirmSetRadio(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularBoolField(value: v, fieldNumber: 33)
    }()
    case .exitSimulator?: try {
      guard case .exitSimulator(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularBoolField(value: v, fieldNumber: 34)
    }()
    case .rebootSeconds?: try {
      guard case .rebootSeconds(let v)? = self.variant else { preconditionFailure() }
      try visitor.visitSingularInt32Field(value: v, fieldNumber: 35)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: AdminMessage, rhs: AdminMessage) -> Bool {
    if lhs.variant != rhs.variant {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
