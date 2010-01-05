class Character < BaseData
  include Structure
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  validates_numericality_of :experience
  
  #Need to find:
  #reincarnation count
  #stored levels
  #lover effect level? (might be calculated 'live', instead of being stored)
  structure(
    [:experience,             :uint64],
    [:items,                  [Item,4]],
    [:name,                   [:disgaea_string,41]], #FIXME: Story characters seem to use a string-table id
    [:class_name,             [:string,61]],
    [:tunknown,               [:unknown,138]],
    
    [:weapon_skills,          WeaponSkills],
    #Some stupid way of ordering the weapon skills, not exactly sure how it works
    [:weapon_skills_order_1,  [:int16,112]],
    [:weapon_skills_order_2,  [:int16,112]],
    
    [:weapon_skill_count,     :int32],
    
    [:current_hp,             :int32],
    [:current_sp,             :int32],
    [:stats,                  Stats], #calculated stats, recalculated often, according to naked_stats, equipped items, pupils, etc.
    [:naked_stats,            Stats], #intrinsic (naked) stats
    [:unknown02,              [:unknown,32]],
    [:mana,                   :uint32],
    [:unknown03,              [:unknown,24]], #8xint16s, something related to pupils? stat bonuses?
    [:weapon_mastery,         WeaponMastery],
    [:weapon_grade,           WeaponMastery], #adjusted for scrolls
    [:base_weapon_grade,      WeaponMastery],
    [:basic_stats,            BasicStats],
    [:unknown05,              [:unknown,22]],
    [:felonies_total,         :int16],
    [:felonies_displayed,     :int16],
    [:base_element_stats,     ElementalStats],
    [:element_stats,          ElementalStats],
    [:base_jmp,               :int8],
    [:jmp,                    :int8],
    [:base_mv,                :int8],
    [:mv,                     :int8],
    [:base_counter,           :int8],
    [:counter,                :int8],
    [:gender,                 :int8], #not sure, looks it though. 1 = male, 2 = female
    [:unknown07,              [:unknown,1]],
    [:rank_colour,            :int8], #changed when painted (used in-battle, doesn't change portrait)
    [:magic_number,           :int32], #int32 = 16776970 on EVERYTHING. maybe a magic number to say this character is valid?
    [:flying_movement,        :int8], #whether character can pass through enemies when moving
    [:equipped_weapon_range,  :int8], #set higher intrinsically for some monsters, usually 5 for guns, 2 for spears, 1 for almost everything else
    [:equipped_weapon_type,   :int8], #0=no weapon or monster weapon, rest are in same order as WeaponMastery struct
    [:unknown13,              [:unknown,1]], #maybe something to do with weapon graphics?
    [:class_id,               :int8], #whether a lady samurai, magic knight, etc.
    [:class_rank,             :int8], #what rank of class
    [:unknown06,              [:unknown,3]], #Last int8 = character name type? 1 = completely custom, 2 = randomly-selected name, 3 = storyline name?
    [:teacher_id,             :int8], #the character with the matching id_as_teacher, is this student's teacher. 255 = no teacher
    [:id_as_teacher,          :int8],
    [:unknown09,              [:unknown,46]],
    [:class_id_unknown,       :int8], #something unique for each character class. initial string table id?
    [:unknown11,              [:unknown,14]],
    [:magichange_2,           :int8],
    [:unknown10,              [:unknown,282]]
  )
  
  GENDERS = {
    1 => :male,
    2 => :female
  }
  
  #FIXME: Find out 'official' names (game uses rank 1 names, not proper class names)
  CLASS_IDS = {
    1  => :adell,
    2  => :rozalin,
    
    11 => :tink,
    12 => :hanako,
    
    26 => :raspberyl,
    
    40 => :fighter,
    41 => :lady_fighter,
    43 => :mage,
    44 => :lady_mage,
    45 => :ninja,#
    46 => :lady_ninja,#
    47 => :maijin, #
    48 => :heavy_knight,#
    49 => :sinnner, #
    50 => :geomancer, #
    51 => :samurai,
    52 => :gunner, #
    53 => :thief,
    54 => :healer,
    55 => :archer, #
    56 => :beast_tamer, #
    57 => :magic_knight,
    58 => :lady_samurai
  }
  
  RANK_IDS = {
    55 => [:archer,:hunter],
    56 => [:beast_tamer],
    57 => [:magic_knight,:dark_knight,:rune_knight],
    58 => [:exorcist,:diabolist]
  }
  
  IMAGE_TYPE_EXTENSIONS = {
    :cut    => 'jpg',
    :face   => 'jpg',
    :sprite => 'png'
  }
  
  CHARACTER_EXP_RATES = {
    :adell        => 5,
    :rozalin      => 5,
    :tink         => 3,
    :hanako       => 3,
    :yukimaru     => 5,
    :etna         => 5,
    :flonne       => 5,
    :laharl       => 5,
    :axel         => 5,
    :fubuki       => 5,
    :kurtis       => 5,
    :fighter      => 4,
    :lady_fighter => 4,
    :mage         => 4,
    :lady_mage    => 4,
    :ninja        => 6,
    :lady_ninja   => 6,
    :maijin       => 9,
    :heavy_knight => 5,
    :sinner       => 5,
    :geomancer    => 5,
    :samurai      => 6,
    :gunner       => 6,
    :thief        => 4,
    :healer       => 4,
    :archer       => 6,
    :beast_tamer  => 5,
    :rune_knight  => 5
  }
  DEFAULT_CHARACTER_EXP_RATE = 5
  
  BASE_EXP_NEXT_PER_LEVEL = {
    1 => 3,
    2 => 6,
    3 => 13,
    4 => 21,
    5 => 32,
    6 => 46,
    7 => 63,
    8 => 83,
    9 => 106,
    10 => 135,
    11 => 165,
    12 => 202,
    13 => 242,
    14 => 286,
    15 => 337,
    16 => 392,
    17 => 453,
    18 => 519,
    19 => 591,
    20 => 670,
    21 => 755,
    22 => 847,
    23 => 944,
    24 => 1051,
    25 => 1164,
    26 => 1284,
    27 => 1412,
    28 => 1549,
    29 => 1694,
    30 => 1848,
    31 => 2010,
    32 => 2181,
    33 => 2362,
    34 => 2552,
    35 => 2753,
    36 => 2962,
    37 => 3182,
    38 => 3414,
    39 => 3744,
    40 => 3908,
    41 => 4171,
    42 => 4446,
    43 => 4733,
    44 => 5032,
    45 => 5343,
    46 => 5666,
    47 => 6003,
    48 => 6351,
    49 => 6713,
    50 => 7090,
    51 => 7478,
    52 => 7881,
    53 => 8298,
    54 => 8729,
    55 => 9176,
    56 => 9637,
    57 => 10112,
    58 => 10603,
    59 => 11110,
    60 => 11633,
    61 => 12171,
    62 => 12726,
    63 => 13298,
    64 => 13885,
    65 => 14502,
    66 => 15113,
    67 => 15752,
    68 => 16410,
    69 => 17084,
    70 => 17778,
    71 => 18490,
    72 => 19221,
    73 => 19970,
    74 => 20739,
    75 => 21528,
    76 => 22334,
    77 => 23162,
    78 => 24010,
    79 => 24877,
    80 => 25767,
    81 => 26675,
    82 => 27606,
    83 => 28557,
    84 => 29531,
    85 => 30525,
    86 => 31542,
    87 => 32582,
    88 => 33644,
    89 => 34728,
    90 => 35836,
    91 => 36967,
    92 => 38121,
    93 => 39298,
    94 => 40500,
    95 => 41726,
    96 => 42977,
    97 => 44252,
    98 => 45551,
    99 => 98301,
    100 => 37047,
    101 => 36768,
    102 => 36560,
    103 => 36414,
    104 => 36321,
    105 => 36272,
    106 => 36260,
    107 => 36282,
    108 => 36331,
    109 => 36406,
    110 => 36502,
    111 => 36617,
    112 => 36749,
    113 => 36896,
    114 => 37055,
    115 => 37227,
    116 => 37409,
    117 => 37601,
    118 => 37801,
    119 => 38009,
    120 => 38223,
    121 => 38445,
    122 => 38671,
    123 => 38904,
    124 => 39140,
    125 => 39381,
    126 => 39627,
    127 => 39875,
    128 => 40127,
    129 => 40383,
    130 => 40640,
    131 => 40902,
    132 => 41165,
    133 => 41430,
    134 => 41698,
    135 => 41968,
    136 => 42239,
    137 => 42512,
    138 => 42787,
    139 => 43063,
    140 => 43341,
    141 => 43619,
    142 => 43900,
    143 => 44182,
    144 => 44463,
    145 => 44747,
    146 => 45032,
    147 => 45316,
    148 => 45603,
    149 => 45890,
    150 => 46177,
    151 => 46466,
    152 => 46754,
    153 => 47045,
    154 => 47334,
    155 => 47626,
    156 => 47917,
    157 => 48209,
    158 => 48501,
    159 => 48795,
    160 => 49086,
    161 => 49382,
    162 => 49675,
    163 => 49970,
    164 => 50265,
    165 => 50560,
    166 => 50856,
    167 => 51152,
    168 => 51448,
    169 => 51744,
    170 => 52042,
    171 => 52338,
    172 => 52635,
    173 => 52934,
    174 => 53231,
    175 => 53529,
    176 => 53827,
    177 => 54125,
    178 => 54425,
    179 => 54723,
    180 => 55022,
    181 => 55321,
    182 => 55621,
    183 => 55920,
    184 => 56219,
    185 => 56520,
    186 => 56820,
    187 => 57119,
    188 => 57420,
    189 => 57720,
    190 => 58021,
    191 => 58322,
    192 => 58622,
    193 => 58923,
    194 => 59223,
    195 => 59525,
    196 => 59827,
    197 => 60127,
    198 => 60429,
    199 => 60730,
    200 => 61031,
    201 => 61334,
    202 => 61635,
    203 => 61936,
    204 => 62239,
    205 => 62541,
    206 => 62842,
    207 => 63145,
    208 => 63447,
    209 => 63749,
    210 => 64051,
    211 => 64353,
    212 => 64656,
    213 => 64959,
    214 => 65261,
    215 => 65563,
    216 => 65867,
    217 => 66168,
    218 => 66472,
    219 => 66774,
    220 => 67077,
    221 => 67380,
    222 => 67683,
    223 => 67986,
    224 => 68289,
    225 => 68592,
    226 => 68895,
    227 => 69198,
    228 => 69501,
    229 => 69805,
    230 => 70108,
    231 => 70411,
    232 => 70714,
    233 => 71018,
    234 => 71321,
    235 => 71624,
    236 => 71928,
    237 => 72231,
    238 => 72535,
    239 => 72838,
    240 => 73142,
    241 => 73445,
    242 => 73749,
    243 => 74053,
    244 => 74356,
    245 => 74660,
    246 => 74964,
    247 => 75268,
    248 => 75571,
    249 => 75875,
    250 => 76179
  }
  
  def self.valid_characters(characters = [])
    characters.select { |character| character.magic_number != 0 }
  end
  
  def self.image_path(image_type,class_name,rank_id = 0)
    path = ['images','characters']
    class_name = CLASS_IDS[class_name] if class_name.is_a?(Numeric)
    path << class_name << rank_id
    path << "#{image_type.to_s}.#{IMAGE_TYPE_EXTENSIONS[image_type]}"
    '/' + path.join('/')
  end
  
  def image_path(image_type)
    self.class.image_path(image_type,class_id,rank_colour)
  end

end