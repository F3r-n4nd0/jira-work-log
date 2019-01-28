//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import SideMenu
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
  
  /// This `R.nib` struct is generated, and contains static references to 4 nibs.
  struct nib {
    /// Nib `IssueTableViewCell`.
    static let issueTableViewCell = _R.nib._IssueTableViewCell()
    /// Nib `ProjectTableViewCell`.
    static let projectTableViewCell = _R.nib._ProjectTableViewCell()
    /// Nib `SprintTableViewCell`.
    static let sprintTableViewCell = _R.nib._SprintTableViewCell()
    /// Nib `VersionTableViewCell`.
    static let versionTableViewCell = _R.nib._VersionTableViewCell()
    
    /// `UINib(name: "IssueTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.issueTableViewCell) instead")
    static func issueTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.issueTableViewCell)
    }
    
    /// `UINib(name: "ProjectTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.projectTableViewCell) instead")
    static func projectTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.projectTableViewCell)
    }
    
    /// `UINib(name: "SprintTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.sprintTableViewCell) instead")
    static func sprintTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.sprintTableViewCell)
    }
    
    /// `UINib(name: "VersionTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.versionTableViewCell) instead")
    static func versionTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.versionTableViewCell)
    }
    
    static func issueTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> IssueTableViewCell? {
      return R.nib.issueTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? IssueTableViewCell
    }
    
    static func projectTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProjectTableViewCell? {
      return R.nib.projectTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProjectTableViewCell
    }
    
    static func sprintTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> SprintTableViewCell? {
      return R.nib.sprintTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SprintTableViewCell
    }
    
    static func versionTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> VersionTableViewCell? {
      return R.nib.versionTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? VersionTableViewCell
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 4 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `IssueTableViewCell`.
    static let issueTableViewCell: Rswift.ReuseIdentifier<IssueTableViewCell> = Rswift.ReuseIdentifier(identifier: "IssueTableViewCell")
    /// Reuse identifier `ProjectTableViewCell`.
    static let projectTableViewCell: Rswift.ReuseIdentifier<ProjectTableViewCell> = Rswift.ReuseIdentifier(identifier: "ProjectTableViewCell")
    /// Reuse identifier `SprintTableViewCell`.
    static let sprintTableViewCell: Rswift.ReuseIdentifier<SprintTableViewCell> = Rswift.ReuseIdentifier(identifier: "SprintTableViewCell")
    /// Reuse identifier `VersionTableViewCell`.
    static let versionTableViewCell: Rswift.ReuseIdentifier<VersionTableViewCell> = Rswift.ReuseIdentifier(identifier: "VersionTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 8 storyboards.
  struct storyboard {
    /// Storyboard `BoardStoryboard`.
    static let boardStoryboard = _R.storyboard.boardStoryboard()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `ListProjectsStoryboard`.
    static let listProjectsStoryboard = _R.storyboard.listProjectsStoryboard()
    /// Storyboard `ListSprintsStoryboard`.
    static let listSprintsStoryboard = _R.storyboard.listSprintsStoryboard()
    /// Storyboard `ListVertionsStoryboard`.
    static let listVertionsStoryboard = _R.storyboard.listVertionsStoryboard()
    /// Storyboard `LoginStoryboard`.
    static let loginStoryboard = _R.storyboard.loginStoryboard()
    /// Storyboard `SettingsStoryboard`.
    static let settingsStoryboard = _R.storyboard.settingsStoryboard()
    /// Storyboard `StartStoryboard`.
    static let startStoryboard = _R.storyboard.startStoryboard()
    
    /// `UIStoryboard(name: "BoardStoryboard", bundle: ...)`
    static func boardStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.boardStoryboard)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "ListProjectsStoryboard", bundle: ...)`
    static func listProjectsStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.listProjectsStoryboard)
    }
    
    /// `UIStoryboard(name: "ListSprintsStoryboard", bundle: ...)`
    static func listSprintsStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.listSprintsStoryboard)
    }
    
    /// `UIStoryboard(name: "ListVertionsStoryboard", bundle: ...)`
    static func listVertionsStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.listVertionsStoryboard)
    }
    
    /// `UIStoryboard(name: "LoginStoryboard", bundle: ...)`
    static func loginStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.loginStoryboard)
    }
    
    /// `UIStoryboard(name: "SettingsStoryboard", bundle: ...)`
    static func settingsStoryboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.settingsStoryboard)
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
    struct _IssueTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = IssueTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "IssueTableViewCell"
      let name = "IssueTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> IssueTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? IssueTableViewCell
      }
      
      fileprivate init() {}
    }
    
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
    
    struct _SprintTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = SprintTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "SprintTableViewCell"
      let name = "SprintTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> SprintTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SprintTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _VersionTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = VersionTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "VersionTableViewCell"
      let name = "VersionTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> VersionTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? VersionTableViewCell
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try boardStoryboard.validate()
      try launchScreen.validate()
      try listProjectsStoryboard.validate()
      try listSprintsStoryboard.validate()
      try listVertionsStoryboard.validate()
      try loginStoryboard.validate()
      try settingsStoryboard.validate()
      try startStoryboard.validate()
    }
    
    struct boardStoryboard: Rswift.StoryboardResourceType, Rswift.Validatable {
      let boardViewController = StoryboardViewControllerResource<BoardViewController>(identifier: "BoardViewController")
      let bundle = R.hostingBundle
      let name = "BoardStoryboard"
      let uiSideMenuNavigationController = StoryboardViewControllerResource<SideMenu.UISideMenuNavigationController>(identifier: "UISideMenuNavigationController")
      
      func boardViewController(_: Void = ()) -> BoardViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: boardViewController)
      }
      
      func uiSideMenuNavigationController(_: Void = ()) -> SideMenu.UISideMenuNavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: uiSideMenuNavigationController)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
          if UIKit.UIColor(named: "MainColor", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'MainColor' is used in storyboard 'BoardStoryboard', but couldn't be loaded.") }
        }
        if _R.storyboard.boardStoryboard().boardViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'boardViewController' could not be loaded from storyboard 'BoardStoryboard' as 'BoardViewController'.") }
        if _R.storyboard.boardStoryboard().uiSideMenuNavigationController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'uiSideMenuNavigationController' could not be loaded from storyboard 'BoardStoryboard' as 'SideMenu.UISideMenuNavigationController'.") }
      }
      
      fileprivate init() {}
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
    
    struct listSprintsStoryboard: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let listSprintsViewController = StoryboardViewControllerResource<ListSprintsViewController>(identifier: "ListSprintsViewController")
      let name = "ListSprintsStoryboard"
      
      func listSprintsViewController(_: Void = ()) -> ListSprintsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: listSprintsViewController)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
          if UIKit.UIColor(named: "MainColor", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'MainColor' is used in storyboard 'ListSprintsStoryboard', but couldn't be loaded.") }
        }
        if _R.storyboard.listSprintsStoryboard().listSprintsViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'listSprintsViewController' could not be loaded from storyboard 'ListSprintsStoryboard' as 'ListSprintsViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct listVertionsStoryboard: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let listVertionsViewController = StoryboardViewControllerResource<ListVertionsViewController>(identifier: "ListVertionsViewController")
      let name = "ListVertionsStoryboard"
      
      func listVertionsViewController(_: Void = ()) -> ListVertionsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: listVertionsViewController)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
          if UIKit.UIColor(named: "MainColor", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'MainColor' is used in storyboard 'ListVertionsStoryboard', but couldn't be loaded.") }
        }
        if _R.storyboard.listVertionsStoryboard().listVertionsViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'listVertionsViewController' could not be loaded from storyboard 'ListVertionsStoryboard' as 'ListVertionsViewController'.") }
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
    
    struct settingsStoryboard: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "SettingsStoryboard"
      let settingsViewController = StoryboardViewControllerResource<SettingsViewController>(identifier: "SettingsViewController")
      
      func settingsViewController(_: Void = ()) -> SettingsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: settingsViewController)
      }
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
        if _R.storyboard.settingsStoryboard().settingsViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'settingsViewController' could not be loaded from storyboard 'SettingsStoryboard' as 'SettingsViewController'.") }
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
