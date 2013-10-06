require "spec_helper"

describe WordScanners::ExtendibleScanner do
  context "looking for six letter words which are composed of two concatenated smaller words" do
    context "when required words can be found" do
      let(:dictionary) {
        File.read(WORD_LIST_PATH).split("\r\n")
      }
      let(:scan_result) { ["action", "adages", "adhere", "adjoin", "adjust", "admire", "adopts", "adored", "adores", "adrift", "adsorb", "advent", "adverb", "advice", "airbag", "airman", "airmen", "airway", "ambled", "ambush", "amends", "amoral", "amours", "ampere", "amused", "amuser", "amuses", "angels", "anions", "anodes", "anthem", "anther", "anyhow", "anyone", "anyway", "archer", "armpit", "ascent", "ashman", "ashore", "asking", "aspire", "assail", "assent", "assets", "assign", "assort", "assure", "astray", "atones", "attack", "attend", "attest", "attire", "attune", "axions", "backup", "bagels", "ballad", "bandit", "barbed", "barfly", "barons", "barred", "barrow", "basher", "basins", "basset", "bather", "batons", "batten", "beaver", "becalm", "became", "beckon", "become", "bedbug", "beefed", "beeper", "befall", "befell", "befits", "befogs", "before", "befoul", "begets", "begins", "behalf", "behave", "behead", "beheld", "behind", "behold", "belays", "belied", "belier", "belies", "belong", "bemoan", "berate", "besets", "beside", "bestow", "betide", "betray", "bevies", "bewail", "beware", "bibbed", "bidden", "bitmap", "bitten", "blowup", "bobbed", "bobbin", "booboo", "boomed", "boomer", "bowels", "bowled", "bowman", "boxcar", "brains", "budget", "bugled", "bummed", "bummer", "bumper", "bunion", "busboy", "bushel", "button", "bygone", "bylaws", "byline", "bypass", "byways", "byword", "cabins", "cabled", "campus", "candid", "cannon", "cannot", "canons", "canton", "canyon", "carpet", "carrot", "carton", "catsup", "caveat", "chapel", "combat", "cooled", "coolie", "cooper", "copper", "cotton", "cowboy", "cowled", "curbed", "curfew", "curled", "cursor", "cutoff", "damage", "damask", "dampen", "damper", "damply", "damsel", "debtor", "digits", "dimmed", "dimmer", "dipper", "domain", "doming", "donate", "donkey", "doping", "dosing", "doused", "douser", "douses", "dragon", "editor", "elapse", "elbows", "eleven", "endear", "errand", "eyelid", "factor", "farmed", "farmer", "father", "fatten", "firmed", "firmer", "fixate", "flabby", "forage", "forbid", "forego", "forget", "forgot", "format", "formed", "former", "furrow", "gadget", "gallon", "gasper", "gelled", "goring", "gotten", "habits", "hamlet", "hammer", "hamper", "happen", "hashed", "hasher", "hasten", "hatred", "heaped", "hearts", "heaver", "hempen", "hereby", "herein", "heroes", "heroin", "herons", "hewing", "hidden", "hither", "hopper", "hotels", "howled", "hummed", "idlest", "impact", "impair", "impart", "impels", "inborn", "inbred", "incite", "income", "incurs", "indeed", "indent", "indoor", "inform", "infuse", "inhale", "inhere", "injury", "inking", "inlaid", "inland", "inlets", "inlier", "inmate", "innate", "inputs", "inroad", "insane", "insect", "insets", "inside", "insure", "intact", "intend", "intent", "invent", "invest", "inward", "island", "islets", "issued", "issuer", "issues", "itself", "jabbed", "jammed", "jarred", "keypad", "kidnap", "kitten", "labels", "lapels", "layman", "laymen", "layout", "leered", "legend", "legion", "lesson", "lockup", "logins", "logout", "lookup", "madams", "madden", "madman", "makeup", "manage", "margin", "marrow", "marten", "mayhap", "mayhem", "meager", "menace", "merely", "merest", "merits", "meshed", "meteor", "midday", "midway", "muffin", "myself", "napkin", "nearby", "nether", "nickel", "nobody", "normed", "nosing", "notice", "notion", "novice", "offend", "office", "offset", "onions", "online", "onsets", "onward", "option", "orally", "orbits", "ordeal", "outcry", "outfit", "outlaw", "outlay", "outlet", "output", "outrun", "outset", "outwit", "palace", "palate", "palest", "pallid", "palmed", "palmer", "panels", "pantry", "pardon", "parent", "paring", "parole", "parrot", "parson", "pastor", "pastry", "patent", "paused", "pauses", "pawing", "payoff", "pealed", "peanut", "pepper", "person", "peruse", "pickup", "piking", "pilots", "pinion", "piping", "pirate", "pitied", "pitier", "pities", "potash", "probed", "probes", "profit", "prolog", "propel", "proper", "proton", "pulpit", "puppet", "rather", "ration", "reacts", "really", "realms", "reaped", "reaper", "rearms", "rebids", "reboot", "reborn", "rebuff", "recall", "recast", "recent", "recite", "recode", "recoil", "record", "recurs", "redden", "redeem", "redone", "redraw", "reeves", "refill", "refine", "reform", "refuel", "refund", "refuse", "regain", "rehash", "rejoin", "reknit", "relate", "relays", "relent", "relied", "relier", "relies", "relive", "reload", "remade", "remain", "remark", "remind", "remove", "rename", "renews", "reopen", "repaid", "repair", "repast", "repays", "repeal", "repeat", "repent", "repine", "replay", "report", "repose", "repost", "reread", "reruns", "rescan", "rescue", "resell", "resent", "resets", "reside", "resign", "resins", "resize", "resold", "resort", "retail", "retied", "retire", "retold", "return", "retype", "reused", "reuses", "reveal", "review", "revile", "revolt", "reward", "rewind", "reword", "rework", "ribbed", "ridden", "robbed", "robins", "rotate", "rotten", "rubbed", "rubout", "rumply", "sadden", "sailor", "satire", "sealed", "seaman", "seamed", "seamen", "seamer", "seared", "season", "sector", "seemed", "seethe", "setups", "soaped", "solace", "solids", "sonnet", "sooner", "soothe", "sorely", "sorest", "subdue", "subset", "subway", "suitor", "summed", "summer", "sundry", "sunken", "sunset", "supper", "supply", "tabled", "tablet", "tailor", "tapper", "target", "tauten", "teamed", "teared", "tenant", "tensor", "tiered", "tipper", "tiptoe", "tither", "titled", "todays", "tooled", "toping", "toward", "towels", "towing", "update", "upheld", "uphill", "uphold", "upkeep", "upland", "uplift", "upload", "uproar", "uproot", "upsets", "upshot", "upside", "upturn", "upward", "usable", "usably", "usages", "ushers", "vendor", "viable", "viably", "viewed", "viewer", "vilest", "visage", "vision", "visits", "vowels", "wagons", "wanton", "warden", "warmed", "warmer", "warper", "warred", "washer", "weaver", "weeper", "whores", "wintry", "wither", "within", "wooden", "woofed", "wooled", "writhe", "zoomed"] }
      let(:scanner) { described_class.new(options) }
      let(:options) {
        {
          matching_word_length: 6
        }
      }
      it "returns all required words with no duplicates" do
        expect(scanner.scan(dictionary)).to eq scan_result
      end
    end
  end
end