module Worldfactbook
  class NoCountryAvailable < StandardError; end

  class CountryCode
    attr_accessor :country

    def initialize(country)
      @country = country
      @codes = { 'world' => 'xx',
                'afghanistan' => 'af',
                'akrotiri' => 'ax',
                'albania' => 'al',
                'algeria' => 'ag',
                'american samoa' => 'aq',
                'andorra' => 'an',
                'angola' => 'ao',
                'anguilla' => 'av',
                'antarctica' => 'ay',
                'antigua' => 'ac',
                'barbuda' => 'ac',
                'antigua and barbuda' => 'ac',
                'arctic ocean' => 'xq',
                'argentina' => 'ar',
                'algeria' => 'ag',
                'armenia' => 'am',
                'algeria' => 'ag',
                'aruba' => 'aa',
                'ashmore and cartier islands' => 'at',
                'atlantic ocean' => 'zh',
                'australia' => 'as',
                'austria' => 'au',
                'azerbaijan' => 'aj',
                'bahamas' => 'bf',
                'the bahamas' => 'bf',
                'bahrain' => 'ba',
                'bangladesh' => 'bg',                
                'barbados' => 'bb',
                'belarus' => 'bo',
                'belgium' => 'be',
                'belize' => 'bh',
                'benin' => 'bn',
                'bermuda' => 'bd',
                'bhutan' => 'bt',
                'bolivia' => 'bl',
                'bosnia' => 'bk',
                'herzegovina' => 'bk',
                'bosnia and herzegovina' => 'bk',
                'botswana' => 'bc',
                'bouvet island' => 'bv',
                'brazil' => 'br',
                'british indian ocean territory' => 'io',
                'british virgin islands' => 'vi',
                'brunei' => 'bx',
                'bulgaria' => 'bu',
                'burkina faso' => 'uv',
                'burma' => 'bm',
                'burundi' => 'by',
                'cambodia' => 'cb',
                'cameroon' => 'cm',
                'canada' => 'ca',
                'cape verde' => 'cv',
                'cayman islands' => 'cj',
                'central african republic' => 'ct',
                'chad' => 'cd',
                'chile' => 'ci',
                'china' => 'ch',
                'christmas island' => 'kt',
                'clipperton island' => 'ip',
                'cocos islands' => 'ck',
                'keeling islands' => 'ck',
                'colombia' => 'co',
                'comoros' => 'cn',
                'democratic republic of the congo' => 'cg',
                'republic of the congo' => 'cf',
                'cook islands' => 'cw',
                'coral sea islands' => 'cr',
                'costa rica' => 'cs',
                "cote d'ivoire" => 'iv',
                'croatia' => 'hr',
                'cuba' => 'cu',
                'curacao' => 'cc',
                'cyprus' => 'cy',
                'czech republic' => 'ez',
                'denmark' => 'da',
                'dhekelia' => 'dx',
                'djibouti' => 'dj',
                'dominica' => 'do',
                'dominican republic' => 'dr',
                'ecuador' => 'ec',
                'egypt' => 'eg',
                'el salvador' => 'es',
                'equatorial guinea' => 'ek',
                'eritrea' => 'er',
                'estonia' => 'en',
                'ethiopia' => 'et',
                'falkland islands' => 'fk',
                'faroe islands' => 'fo',
                'fiji' => 'fj',
                'finland' => 'fi',
                'france' => 'fr',
                'french polynesia' => 'fp',
                'french southern and antarctic lands' => 'fs',
                'gabon' => 'gb',
                'the gambia' => 'gb',
                'gaza strip' => 'gz',
                'georgia' => 'gg',
                'germany' => 'gm',
                'ghana' => 'gh',
                'gibraltar' => 'gi',
                'greece' => 'gr',
                'greenland' => 'gl',        
                'grenada' => 'gj',
                'guam' => 'gq',
                'guatemala' => 'gt',
                'guernsey' => 'gk',
                'guinea' => 'gv',
                'guinea-bissau' => 'pu',
                'guyana' => 'gy',
                'haiti' => 'ha',
                'heard island and mcdonald islands' => 'hm',
                'holy see' => 'vt',
                'vatican city' => 'vt',
                'honduras' => 'ho',
                'hong kong' => 'hk',
                'hungary' => 'hu',
                'iceland' => 'ic',
                'india' => 'in',
                'indian ocean' => 'xo',
                'iran' => 'ir',
                'iraq' => 'iz',
                'ireland' => 'ei',
                'isle of man' => 'im',
                'israel' => 'is',
                'italy' => 'it',
                'jamaica' => 'jm',
                'jan mayen' => 'jn',
                'japan' => 'ja',
                'jersey' => 'je',
                'jordan' => 'jo',
                'kazakhstan' => 'kz',
                'kenya' => 'ke',
                'kiribati' => 'kr',
                'north korea' => 'kn',
                'south korea' => 'ks',
                'kosovo' => 'kv',
                'kuwait' => 'ku',
                'kyrgyzstan' => 'kg',
                'laos' => 'la',
                'latvia' => 'lg',
                'lebanon' => 'le',
                'lesotho' => 'lt',
                'liberia' => 'li',
                'libya' => 'ly',
                'liechtenstein' => 'ls',
                'lithuania' => 'lh',
                'luxembourg' => 'lu',
                'macau' => 'mc',
                'macedonia' => 'mk',
                'madagascar' => 'ma',
                'malawi' => 'mi',
                'malaysia' => 'my',
                'maldives' => 'mv',
                'mali' => 'ml',
                'malta' => 'mt',
                'marshall islands' => 'rm',
                'mauritania' => 'mr',
                'mauritius' => 'mp',
                'mexico' => 'mx',
                'micronesia' => 'fm',
                'moldova' => 'md',
                'monaco' => 'mn',
                'mongolia' => 'mg',
                'montenegro' => 'mj',
                'montserrat' => 'mh',
                'morocco' => 'mo',
                'moldova' => 'md',
                'mozambique' => 'mz',
                'nambia' => 'wa',
                'nauru' => 'nr',
                'navassa island' => 'bq',
                'nepal' => 'np',
                'netherlands' => 'nl',
                'new caledonia' => 'nc',
                'new zealand' => 'nz',
                'nicaragua' => 'nu',
                'niger' => 'ng',
                'nigeria' => 'ni',
                'niue' => 'ne',
                'norfolk island' => 'nf',
                'northern mariana islands' => 'cq',
                'norway' => 'no',
                'oman' => 'mu',
                'pacific ocean' => 'zn',
                'pakistan' => 'pk',
                'palau' => 'ps',
                'panama' => 'pm',
                'papua new guinea' => 'pp',
                'paracel islands' => 'pf',
                'paraguay' => 'pa',
                'peru' => 'pe',
                'philippines' => 'rp',
                'pitcairn islands' => 'pc',
                'poland' => 'pl',
                'portugal' => 'po',
                'puerto rico' => 'rq',
                'qatar' => 'qa',
                'romania' => 'ro',
                'russia' => 'rs',
                'rwanda' => 'rw',
                'saint barthelemy' => 'tb',
                'saint helena' => 'sh',
                'ascension' => 'sh',
                'tristan da cunha' => 'sh',
                'saint kitts and nevis' => 'sc',
                'saint lucia' => 'st',
                'saint martin' => 'rn',
                'saint pierre' => 'sb',
                'miquelon' => 'sb',
                'saint vincent' => 'vc',        
                'the grenadines' => 'vc',
                'samoa' => 'ws',
                'san marino' => 'sm',
                'sao tome' => 'tp',
                'principe' => 'tp',
                'saudi arabia' => 'sa',
                'senegal' => 'sg',
                'serbia' => 'ri',
                'seychelles' => 'se',
                'sierra leone' => 'sl',
                'singapore' => 'sn',
                'sint maarten' => 'sk',
                'slovakia' => 'lo',
                'slovenia' => 'si',
                'solomon islands' => 'bp',
                'somalia' => 'so',
                'south africa' => 'sf',
                'south georgia' => 'sx',
                'south sandwich islands' => 'sx',
                'southern ocean' => 'oo',
                'spain' => 'sp',
                'spratly islands' => 'pg',
                'sri lanka' => 'ce',
                'sudan' => 'su',
                'suriname' => 'ns',
                'svalbard' => 'sv',
                'swaziland' => 'wz',
                'sweden' => 'sw',
                'switzerland' => 'sz',
                'syria' => 'sy',
                'taiwan' => 'tw',
                'tajikistan' => 'ti',
                'tanzania' => 'tz',
                'thailand' => 'th',
                'timor-leste' => 'tt',
                'togo' => 'to',
                'tokelau' => 'tl',
                'tonga' => 'tn',
                'trinidad' => 'td',
                'tobago' => 'td',
                'tunisia' => 'ts',
                'turkey' => 'tu',
                'turkmenistan' => 'tx',
                'turks and caicos islands' => 'tk',
                'tuvalu' => 'tv',
                'uganda' => 'ug',
                'ukraine' => 'up',
                'united arab emirates' => 'ae',
                'united kingdom' => 'uk',
                'united states' => 'us',
                'united states pacific island wildlife refuges' => 'um',
                'uruguay' => 'uy',
                'uzbekistan' => 'uz',
                'vanuatu' => 'nh',
                'venezuela' => 've',
                'vietnam' => 'vm',
                'virgin islands' => 'vq',
                'wake island' => 'wq',
                'wallis and futuna' => 'wf',
                'west bank' => 'we',
                'western sahara' => 'wi',
                'yemen' => 'ym',
                'zambia' => 'za',
                'zimbabwe' => 'zi',
                'european union' => 'ee' }
    end

    def code
      if @codes.has_key?(@country)
        @codes.fetch(@country) 
      elsif @codes.has_value?(@country)
        return @country
      else
        raise NoCountryAvailable.new("#{@country} isn't available in the CIA World Factbook.")
      end
    end

    def list
      return @codes
    end
  end

end