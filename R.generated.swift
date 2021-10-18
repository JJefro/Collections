//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 21 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `ArrayViewBackground`.
    static let arrayViewBackground = Rswift.ColorResource(bundle: R.hostingBundle, name: "ArrayViewBackground")
    /// Color `ArrayViewCell`.
    static let arrayViewCell = Rswift.ColorResource(bundle: R.hostingBundle, name: "ArrayViewCell")
    /// Color `ArrayViewText`.
    static let arrayViewText = Rswift.ColorResource(bundle: R.hostingBundle, name: "ArrayViewText")
    /// Color `Blue`.
    static let blue = Rswift.ColorResource(bundle: R.hostingBundle, name: "Blue")
    /// Color `CollectionViewBackground`.
    static let collectionViewBackground = Rswift.ColorResource(bundle: R.hostingBundle, name: "CollectionViewBackground")
    /// Color `DictionaryViewBackground`.
    static let dictionaryViewBackground = Rswift.ColorResource(bundle: R.hostingBundle, name: "DictionaryViewBackground")
    /// Color `DictionaryViewCell`.
    static let dictionaryViewCell = Rswift.ColorResource(bundle: R.hostingBundle, name: "DictionaryViewCell")
    /// Color `DictionaryViewTextColor`.
    static let dictionaryViewTextColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "DictionaryViewTextColor")
    /// Color `Gray`.
    static let gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "Gray")
    /// Color `LightGray`.
    static let lightGray = Rswift.ColorResource(bundle: R.hostingBundle, name: "LightGray")
    /// Color `MainViewBackground`.
    static let mainViewBackground = Rswift.ColorResource(bundle: R.hostingBundle, name: "MainViewBackground")
    /// Color `MainViewTextColor`.
    static let mainViewTextColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "MainViewTextColor")
    /// Color `SetViewBackgroundColor`.
    static let setViewBackgroundColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "SetViewBackgroundColor")
    /// Color `SetViewTextColor`.
    static let setViewTextColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "SetViewTextColor")
    /// Color `TextColor`.
    static let textColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "TextColor")
    /// Color `tfBlue`.
    static let tfBlue = Rswift.ColorResource(bundle: R.hostingBundle, name: "tfBlue")
    /// Color `tfGreen`.
    static let tfGreen = Rswift.ColorResource(bundle: R.hostingBundle, name: "tfGreen")
    /// Color `tfOrange`.
    static let tfOrange = Rswift.ColorResource(bundle: R.hostingBundle, name: "tfOrange")
    /// Color `tfRed`.
    static let tfRed = Rswift.ColorResource(bundle: R.hostingBundle, name: "tfRed")
    /// Color `tfTextColor`.
    static let tfTextColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "tfTextColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ArrayViewBackground", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func arrayViewBackground(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.arrayViewBackground, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ArrayViewCell", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func arrayViewCell(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.arrayViewCell, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ArrayViewText", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func arrayViewText(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.arrayViewText, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Blue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func blue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.blue, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "CollectionViewBackground", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func collectionViewBackground(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.collectionViewBackground, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "DictionaryViewBackground", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func dictionaryViewBackground(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.dictionaryViewBackground, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "DictionaryViewCell", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func dictionaryViewCell(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.dictionaryViewCell, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "DictionaryViewTextColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func dictionaryViewTextColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.dictionaryViewTextColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Gray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.gray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "LightGray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func lightGray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.lightGray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "MainViewBackground", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func mainViewBackground(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.mainViewBackground, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "MainViewTextColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func mainViewTextColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.mainViewTextColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "SetViewBackgroundColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func setViewBackgroundColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.setViewBackgroundColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "SetViewTextColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func setViewTextColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.setViewTextColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "TextColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func textColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.textColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tfBlue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tfBlue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tfBlue, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tfGreen", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tfGreen(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tfGreen, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tfOrange", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tfOrange(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tfOrange, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tfRed", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tfRed(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tfRed, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tfTextColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tfTextColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tfTextColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "ArrayViewBackground", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func arrayViewBackground(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.arrayViewBackground.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "ArrayViewCell", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func arrayViewCell(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.arrayViewCell.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "ArrayViewText", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func arrayViewText(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.arrayViewText.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Blue", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func blue(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.blue.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "CollectionViewBackground", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func collectionViewBackground(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.collectionViewBackground.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "DictionaryViewBackground", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func dictionaryViewBackground(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.dictionaryViewBackground.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "DictionaryViewCell", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func dictionaryViewCell(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.dictionaryViewCell.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "DictionaryViewTextColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func dictionaryViewTextColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.dictionaryViewTextColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "Gray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func gray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.gray.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "LightGray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func lightGray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.lightGray.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "MainViewBackground", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func mainViewBackground(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.mainViewBackground.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "MainViewTextColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func mainViewTextColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.mainViewTextColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "SetViewBackgroundColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func setViewBackgroundColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.setViewBackgroundColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "SetViewTextColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func setViewTextColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.setViewTextColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "TextColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func textColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.textColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tfBlue", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tfBlue(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tfBlue.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tfGreen", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tfGreen(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tfGreen.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tfOrange", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tfOrange(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tfOrange.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tfRed", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tfRed(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tfRed.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tfTextColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tfTextColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tfTextColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `SF-Pro-Display-Bold.otf`.
    static let sfProDisplayBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Display-Bold", pathExtension: "otf")
    /// Resource file `SF-Pro-Display-Regular.otf`.
    static let sfProDisplayRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Display-Regular", pathExtension: "otf")

    /// `bundle.url(forResource: "SF-Pro-Display-Bold", withExtension: "otf")`
    static func sfProDisplayBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProDisplayBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Display-Regular", withExtension: "otf")`
    static func sfProDisplayRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProDisplayRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 2 fonts.
  struct font: Rswift.Validatable {
    /// Font `SFProDisplay-Bold`.
    static let sfProDisplayBold = Rswift.FontResource(fontName: "SFProDisplay-Bold")
    /// Font `SFProDisplay-Regular`.
    static let sfProDisplayRegular = Rswift.FontResource(fontName: "SFProDisplay-Regular")

    /// `UIFont(name: "SFProDisplay-Bold", size: ...)`
    static func sfProDisplayBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProDisplayBold, size: size)
    }

    /// `UIFont(name: "SFProDisplay-Regular", size: ...)`
    static func sfProDisplayRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProDisplayRegular, size: size)
    }

    static func validate() throws {
      if R.font.sfProDisplayBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProDisplay-Bold' could not be loaded, is 'SF-Pro-Display-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProDisplayRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProDisplay-Regular' could not be loaded, is 'SF-Pro-Display-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `TextFieldView`.
    static let textFieldView = _R.nib._TextFieldView()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "TextFieldView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.textFieldView) instead")
    static func textFieldView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.textFieldView)
    }
    #endif

    static func textFieldView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.textFieldView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _TextFieldView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "TextFieldView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
