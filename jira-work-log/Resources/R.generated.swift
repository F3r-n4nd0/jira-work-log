//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `MainColor`.
    static let mainColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "MainColor")
    
    /// `UIColor(named: "MainColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func mainColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.mainColor, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `LaunchImage`.
    static let launchImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "LaunchImage")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    
    /// `UIImage(named: "LaunchImage", bundle: ..., traitCollection: ...)`
    static func launchImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.launchImage, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `ProjectTableViewCell`.
    static let projectTableViewCell = _R.nib._ProjectTableViewCell()
    
    /// `UINib(name: "ProjectTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.projectTableViewCell) instead")
    static func projectTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.projectTableViewCell)
    }
    
    static func projectTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProjectTableViewCell? {
      return R.nib.projectTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProjectTableViewCell
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `ProjectTableViewCell`.
    static let projectTableViewCell: Rswift.ReuseIdentifier<ProjectTableViewCell> = Rswift.ReuseIdentifier(identifier: "ProjectTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 4 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `ListProjectsStoryboard`.
    static let listProjectsStoryboard = _R.storyboard.listProjectsStoryboard()
    /// Storyboard `LoginStoryboard`.
    static let loginStoryboard = _R.storyboard.loginStoryboard()
    /// Storyboard `StartStoryboard`.
    static let startStoryboard = _R.storyboard.startStoryboard()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "ListProjectsStoryboard", bundle: ...)`
    static func listProjectsStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.listProjectsStoryboard)
    }
    
    /// `UIStoryboard(name: "LoginStoryboard", bundle: ...)`
    static func loginStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.loginStoryboard)
    }
    
    /// `UIStoryboard(name: "StartStoryboard", bundle: ...)`
    static func startStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.startStoryboard)
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
    try storyboard.validate()
  }
  
  struct nib {
    struct _ProjectTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = ProjectTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "ProjectTableViewCell"
      let name = "ProjectTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProjectTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProjectTableViewCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
      try listProjectsStoryboard.validate()
      try loginStoryboard.validate()
      try startStoryboard.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "logo", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'logo' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    struct listProjectsStoryboard: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let listProjectsViewController = StoryboardViewControllerResource<ListProjectsViewController>(identifier: "ListProjectsViewController")
      let name = "ListProjectsStoryboard"
      
      func listProjectsViewController(_: Void = ()) -> ListProjectsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: listProjectsViewController)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
          if UIKit.UIColor(named: "MainColor", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'MainColor' is used in storyboard 'ListProjectsStoryboard', but couldn't be loaded.") }
        }
        if _R.storyboard.listProjectsStoryboard().listProjectsViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'listProjectsViewController' could not be loaded from storyboard 'ListProjectsStoryboard' as 'ListProjectsViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct loginStoryboard: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "LoginStoryboard"
      
      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "logo", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'logo' is used in storyboard 'LoginStoryboard', but couldn't be loaded.") }
        if #available(iOS 11.0, *) {
          if UIKit.UIColor(named: "MainColor", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'MainColor' is used in storyboard 'LoginStoryboard', but couldn't be loaded.") }
        }
        if _R.storyboard.loginStoryboard().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'LoginStoryboard' as 'LoginViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct startStoryboard: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = StartViewController
      
      let bundle = R.hostingBundle
      let name = "StartStoryboard"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
