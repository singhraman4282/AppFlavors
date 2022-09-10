// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// MARK: Localizations

struct Localizations {

// MARK: - Common

    static let appBanner: String = L10n.Localizations.appBanner

// MARK: - Flavors

    static let funnyGuy: String = {
#warning("funnyGuy is unique to DCLocalizations")
        return L10n.DCLocalizations.funnyGuy
    }()

    static let greenGuy: String = {
#warning("greenGuy is unique to MarvelLocalizations")
        return L10n.MarvelLocalizations.greenGuy
    }()

    static let flyingMan: String = {
#if Marvel
        L10n.MarvelLocalizations.flyingMan
#else
        L10n.DCLocalizations.flyingMan
#endif
    }()

    static let femaleSuperhero: String = {
#if Marvel
        L10n.MarvelLocalizations.femaleSuperhero
#else
        L10n.DCLocalizations.femaleSuperhero
#endif
    }()

    static let richMan: String = {
#if Marvel
        L10n.MarvelLocalizations.richMan
#else
        L10n.DCLocalizations.richMan
#endif
    }()

}

// MARK: Image Assets

extension Asset {

    static let appBanner: ImageAsset = {
        Asset.Assets.appBanner
    }()

    static let femaleSuperhero: ImageAsset = {
#if Marvel
        Asset.MarvelAssets.femaleSuperhero
#else
        Asset.DCAssets.femaleSuperhero
#endif
    }()

    static let flyingMan: ImageAsset = {
#if Marvel
        Asset.MarvelAssets.flyingMan
#else
        Asset.DCAssets.flyingMan
#endif
    }()

    static let richGuy: ImageAsset = {
#if Marvel
        Asset.MarvelAssets.richGuy
#else
        Asset.DCAssets.richGuy
#endif
    }()

}
