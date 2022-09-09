// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// MARK: Localization

extension L10n.Localizations {

    
    static let femaleSuperhero: String = {
#if DC
        L10n.DCLocalizations.femaleSuperhero
#elseif Marvel
        L10n.MarvelLocalizations.femaleSuperhero
#else
        ""
#endif
    }()

    static let flyingMan: String = {
#if DC
        L10n.DCLocalizations.flyingMan
#elseif Marvel
        L10n.MarvelLocalizations.flyingMan
#else
        ""
#endif
    }()

    static let richMan: String = {
#if DC
        L10n.DCLocalizations.richMan
#elseif Marvel
        L10n.MarvelLocalizations.richMan
#else
        ""
#endif
    }()
}

// MARK: Image Assets

extension Asset {

            
    static let appBanner: ImageAsset = {
        Asset.Assets.appBanner
    }()
                        
    static let femaleSuperhero: ImageAsset = {
#if DC
        Asset.DCAssets.femaleSuperhero
#elseif Marvel
        Asset.MarvelAssets.femaleSuperhero
#else
        Asset.DCAssets.femaleSuperhero
#endif
    }()
                    
    static let flyingMan: ImageAsset = {
#if DC
        Asset.DCAssets.flyingMan
#elseif Marvel
        Asset.MarvelAssets.flyingMan
#else
        Asset.DCAssets.flyingMan
#endif
    }()
                    
    static let richGuy: ImageAsset = {
#if DC
        Asset.DCAssets.richGuy
#elseif Marvel
        Asset.MarvelAssets.richGuy
#else
        Asset.DCAssets.richGuy
#endif
    }()
                                                    
}
