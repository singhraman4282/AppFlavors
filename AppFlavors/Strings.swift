// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum DCLocalizations {
    /// Wonder Woman
    internal static let femaleSuperhero = L10n.tr("DC_Localizations", "femaleSuperhero", fallback: "Wonder Woman")
    /// Superman
    internal static let flyingMan = L10n.tr("DC_Localizations", "flyingMan", fallback: "Superman")
    /// Batman
    internal static let richMan = L10n.tr("DC_Localizations", "richMan", fallback: "Batman")
  }
  internal enum Localizations {
    internal enum App {
      /// Your superhero team
      internal static let banner = L10n.tr("Localizations", "app.banner", fallback: "Your superhero team")
    }
  }
  internal enum MarvelLocalizations {
    /// Captain Marvel
    internal static let femaleSuperhero = L10n.tr("Marvel_Localizations", "femaleSuperhero", fallback: "Captain Marvel")
    /// Thor
    internal static let flyingMan = L10n.tr("Marvel_Localizations", "flyingMan", fallback: "Thor")
    /// Ironman
    internal static let richMan = L10n.tr("Marvel_Localizations", "richMan", fallback: "Ironman")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
