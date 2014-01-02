//
//  SMRInitialize.m
//  SentinelsOfTheMultiverseRandomizer
//
//  Created by Daniel Whalen on 12/22/13.
//  Copyright (c) 2013 Daniel Whalen. All rights reserved.
//

#import "SMRInitialize.h"
#import "SMRDataClass.h"
#import "SMRExpansion.h"
#import "SMRUpload.h"


@implementation SMRInitialize
+ (void) initializeGameData {
    
    SMRDeck *h1=[[SMRDeck alloc] init:@"Absolute Zero" publicName:@"Absolute Zero" displayText:@"Absolute Zero" detailName:@"" deck:@"Absolute Zero" score3:@(-29.40) score4:@(-31.27) score5:@(-31.27) imageName:@"1.jpg"];
    SMRDeck *h2=[[SMRDeck alloc] init:@"Absolute Zero (Elemental Wrath)" publicName:@"Absolute Zero: Elemental Wrath" displayText:@"Absolute Zero: Elemental Wrath" detailName:@"" deck:@"Absolute Zero" score3:@(-75.35) score4:@(-28.60) score5:@(-28.60) imageName:@"24.jpg"];
    SMRDeck *v1=[[SMRDeck alloc] init:@"Akash\'bhuta" publicName:@"Akash\'bhuta" displayText:@"Akash\'bhuta" detailName:@"" deck:@"Akash'bhuta" score3:@(84.30) score4:@(41.10) score5:@(41.10) imageName:@"v9.jpg"];
    SMRDeck *v2=[[SMRDeck alloc] init:@"Ambuscade" publicName:@"Ambuscade" displayText:@"Ambuscade" detailName:@"" deck:@"Ambuscade" score3:@(132.32) score4:@(187.73) score5:@(187.73) imageName:@"v13.jpg"];
    SMRDeck *v3=[[SMRDeck alloc] init:@"Apostate" publicName:@"Apostate" displayText:@"Apostate" detailName:@"" deck:@"Apostate" score3:@(64.16) score4:@(30.18) score5:@(30.18) imageName:@"v10.jpg"];
    SMRDeck *v4=[[SMRDeck alloc] init:@"Baron Blade" publicName:@"Baron Blade" displayText:@"Baron Blade" detailName:@"" deck:@"Baron Blade" score3:@(69.46) score4:@(199.64) score5:@(199.64) imageName:@"v1.jpg"];
    SMRDeck *v12=[[SMRDeck alloc] init:@"Baron Blade (Mad Bomber)" publicName:@"Mad Bomber Blade" displayText:@"Mad Bomber Blade" detailName:@"" deck:@"Mad Bomber Blade" score3:@(11.43) score4:@(109.02) score5:@(109.02) imageName:@"v15.jpg"];
    SMRDeck *v53=[[SMRDeck alloc] init:@"Baron Blade Vengeance" publicName:@"Baron Blade Vengeance" displayText:@"Baron Blade Vengeance" detailName:@"" deck:@"Baron Blade Vengeance" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"Vengeance Baron Blade.jpg"];
    SMRDeck *h3=[[SMRDeck alloc] init:@"Bunker" publicName:@"Bunker" displayText:@"Bunker" detailName:@"" deck:@"Bunker" score3:@(-52.92) score4:@(-11.74) score5:@(-11.74) imageName:@"2.jpg"];
    SMRDeck *h4=[[SMRDeck alloc] init:@"Bunker (Engine of War)" publicName:@"Bunker: Engine of War" displayText:@"Bunker: Engine of War" detailName:@"" deck:@"Bunker" score3:@(-65.44) score4:@(-28.92) score5:@(-28.92) imageName:@"28.jpg"];
    SMRDeck *h41=[[SMRDeck alloc] init:@"Bunker (G. I.)" publicName:@"G. I. Bunker" displayText:@"G. I. Bunker" detailName:@"" deck:@"Bunker" score3:@(-52.92) score4:@(-11.74) score5:@(-11.74) imageName:@"32.jpg"];
    SMRDeck *h5=[[SMRDeck alloc] init:@"Chrono Ranger" publicName:@"Chrono Ranger" displayText:@"Chrono Ranger" detailName:@"" deck:@"Chrono Ranger" score3:@(10.76) score4:@(19.27) score5:@(19.27) imageName:@"20.jpg"];
    SMRDeck *v5=[[SMRDeck alloc] init:@"Citizen Dawn" publicName:@"Citizen Dawn" displayText:@"Citizen Dawn" detailName:@"" deck:@"Citizen Dawn" score3:@(-4.93) score4:@(-15.02) score5:@(-15.02) imageName:@"v2.jpg"];
    SMRDeck *v47=[[SMRDeck alloc] init:@"Ermine" publicName:@"Ermine" displayText:@"Ermine" detailName:@"" deck:@"Ermine" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"Ermine.jpg"];
    SMRDeck *h7=[[SMRDeck alloc] init:@"Expatriette" publicName:@"Expatriette" displayText:@"Expatriette" detailName:@"" deck:@"Expatriette" score3:@(-40.20) score4:@(-30.55) score5:@(-30.55) imageName:@"12.jpg"];
    SMRDeck *h8=[[SMRDeck alloc] init:@"Expatriette (Dark Watch)" publicName:@"Dark Watch Expatriette" displayText:@"Dark Watch Expatriette" detailName:@"" deck:@"Expatriette" score3:@(-40.20) score4:@(-30.55) score5:@(-30.55) imageName:@"38.jpg"];
    SMRDeck *h9=[[SMRDeck alloc] init:@"Fanatic" publicName:@"Fanatic" displayText:@"Fanatic" detailName:@"" deck:@"Fanatic" score3:@(-2.31) score4:@(3.06) score5:@(3.06) imageName:@"3.jpg"];
    SMRDeck *h20=[[SMRDeck alloc] init:@"Fanatic (Redeemer)" publicName:@"Redeemer Fanatic" displayText:@"Redeemer Fanatic" detailName:@"" deck:@"Fanatic" score3:@(31.03) score4:@(13.15) score5:@(13.15) imageName:@"18.jpg"];
    SMRDeck *e14=[[SMRDeck alloc] init:@"Freedom Tower" publicName:@"Freedom Tower" displayText:@"Freedom Tower" detailName:@"" deck:@"Freedom Tower" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"Freedom Tower.jpg"];
    SMRDeck *v51=[[SMRDeck alloc] init:@"Friction" publicName:@"Friction" displayText:@"Friction" detailName:@"" deck:@"Friction" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"Fr.jpg"];
    SMRDeck *v45=[[SMRDeck alloc] init:@"Fright Train" publicName:@"Fright Train" displayText:@"Fright Train" detailName:@"" deck:@"Fright Train" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"FT.jpg"];
    SMRDeck *v7=[[SMRDeck alloc] init:@"Gloomweaver" publicName:@"Gloomweaver" displayText:@"Gloomweaver" detailName:@"" deck:@"Gloomweaver" score3:@(149.54) score4:@(128.26) score5:@(128.26) imageName:@"v12.jpg"];
    SMRDeck *v22=[[SMRDeck alloc] init:@"Gloomweaver (Skinwalker)" publicName:@"Gloomweaver, Skinwalker" displayText:@"Gloomweaver, Skinwalker" detailName:@"" deck:@"Gloomweaver" score3:@(149.54) score4:@(128.26) score5:@(128.26) imageName:@"v22.jpg"];
    SMRDeck *v8=[[SMRDeck alloc] init:@"Grand Warlord Voss" publicName:@"Grand Warlord Voss" displayText:@"Grand Warlord Voss" detailName:@"" deck:@"Grand Warlord Voss" score3:@(-19.96) score4:@(132.84) score5:@(132.84) imageName:@"v3.jpg"];
    SMRDeck *h11=[[SMRDeck alloc] init:@"Haka" publicName:@"Haka" displayText:@"Haka" detailName:@"" deck:@"Haka" score3:@(2.95) score4:@(-5.39) score5:@(-5.39) imageName:@"4.jpg"];
    SMRDeck *h27=[[SMRDeck alloc] init:@"Haka (The Eternal)" publicName:@"The Eternal Haka" displayText:@"The Eternal Haka" detailName:@"" deck:@"Haka" score3:@(-30.26) score4:@(24.21) score5:@(24.21) imageName:@"29.jpg"];
    SMRDeck *e1=[[SMRDeck alloc] init:@"Insula Primalis" publicName:@"Insula Primalis" displayText:@"Insula Primalis" detailName:@"" deck:@"Insula Primalis" score3:@(44.12) score4:@(179.55) score5:@(179.55) imageName:@"e1.jpg"];
    SMRDeck *v9=[[SMRDeck alloc] init:@"Iron Legacy" publicName:@"Iron Legacy" displayText:@"Iron Legacy" detailName:@"" deck:@"Iron Legacy" score3:@(-84.20) score4:@(-86.88) score5:@(-86.88) imageName:@"v19.jpg"];
    SMRDeck *h37=[[SMRDeck alloc] init:@"K N I F E" publicName:@"K N I F E" displayText:@"K N I F E" detailName:@"" deck:@"K N I F E" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"33.jpg"];
    SMRDeck *v10=[[SMRDeck alloc] init:@"Kismet" publicName:@"Kismet" displayText:@"Kismet" detailName:@"" deck:@"Kismet" score3:@(43.87) score4:@(190.00) score5:@(190.00) imageName:@"v18.jpg"];
    SMRDeck *v11=[[SMRDeck alloc] init:@"La Capitan" publicName:@"La Capitan" displayText:@"La Capitan" detailName:@"" deck:@"La Capitan" score3:@(-32.87) score4:@(44.49) score5:@(44.49) imageName:@"v16.jpg"];
    SMRDeck *h12=[[SMRDeck alloc] init:@"Legacy" publicName:@"Legacy" displayText:@"Legacy" detailName:@"" deck:@"Legacy" score3:@(28.64) score4:@(55.24) score5:@(55.24) imageName:@"5.jpg"];
    SMRDeck *h28=[[SMRDeck alloc] init:@"Legacy (The Greatest)" publicName:@"The Greatest Legacy" displayText:@"The Greatest Legacy" detailName:@"" deck:@"Legacy" score3:@(82.24) score4:@(120.13) score5:@(120.13) imageName:@"31.jpg"];
    SMRDeck *h34=[[SMRDeck alloc] init:@"Legacy (Young)" publicName:@"Young Legacy" displayText:@"Young Legacy" detailName:@"" deck:@"Legacy" score3:@(19.03) score4:@(6.62) score5:@(6.62) imageName:@"11.jpg"];
    SMRDeck *e2=[[SMRDeck alloc] init:@"Megalopolis" publicName:@"Megalopolis" displayText:@"Megalopolis" detailName:@"" deck:@"Megalopolis" score3:@(72.16) score4:@(159.58) score5:@(159.58) imageName:@"e2.jpg"];
    SMRDeck *v13=[[SMRDeck alloc] init:@"Miss Information" publicName:@"Miss Information" displayText:@"Miss Information" detailName:@"" deck:@"Miss Information" score3:@(106.04) score4:@(2.98) score5:@(2.98) imageName:@"v20.jpg"];
    SMRDeck *e13=[[SMRDeck alloc] init:@"Mobile Defense Platform" publicName:@"Mobile Defense Platform" displayText:@"Mobile Defense Platform" detailName:@"" deck:@"Mobile Defense Platform" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"MDP.jpg"];
    SMRDeck *h13=[[SMRDeck alloc] init:@"Mr. Fixer" publicName:@"Mr. Fixer" displayText:@"Mr. Fixer" detailName:@"" deck:@"Mr. Fixer" score3:@(-26.13) score4:@(-44.63) score5:@(-44.63) imageName:@"13.jpg"];
    SMRDeck *h14=[[SMRDeck alloc] init:@"Mr. Fixer (Dark Watch)" publicName:@"Dark Watch Mr. Fixer" displayText:@"Dark Watch Mr. Fixer" detailName:@"" deck:@"Mr. Fixer" score3:@(-46.13) score4:@(-64.63) score5:@(-64.63) imageName:@"39.jpg"];
    SMRDeck *h15=[[SMRDeck alloc] init:@"Nightmist" publicName:@"Nightmist" displayText:@"Nightmist" detailName:@"" deck:@"Nightmist" score3:@(7.52) score4:@(5.91) score5:@(5.91) imageName:@"16.jpg"];
    SMRDeck *h16=[[SMRDeck alloc] init:@"Nightmist (Dark Watch)" publicName:@"Dark Watch Nightmist" displayText:@"Dark Watch Nightmist" detailName:@"" deck:@"Nightmist" score3:@(7.52) score4:@(5.91) score5:@(5.91) imageName:@"40.jpg"];
    SMRDeck *v14=[[SMRDeck alloc] init:@"Omnitron" publicName:@"Omnitron" displayText:@"Omnitron" detailName:@"" deck:@"Omnitron" score3:@(-28.09) score4:@(63.39) score5:@(63.39) imageName:@"v4.jpg"];
    SMRDeck *v6=[[SMRDeck alloc] init:@"Omnitron (Cosmic)" publicName:@"Cosmic Omnitron" displayText:@"Cosmic Omnitron" detailName:@"" deck:@"Omnitron" score3:@(-165.74) score4:@(-27.07) score5:@(-27.07) imageName:@"v14.jpg"];
    SMRDeck *h17=[[SMRDeck alloc] init:@"Omnitron-X" publicName:@"Omnitron-X" displayText:@"Omnitron-X" detailName:@"" deck:@"Omnitron-X" score3:@(47.36) score4:@(21.01) score5:@(21.01) imageName:@"21.jpg"];
    SMRDeck *h40=[[SMRDeck alloc] init:@"Parse" publicName:@"Parse" displayText:@"Parse" detailName:@"" deck:@"Parse" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"35.jpg"];
    SMRDeck *e3=[[SMRDeck alloc] init:@"Pike Industrial Complex" publicName:@"Pike Industrial Complex" displayText:@"Pike Industrial Complex" detailName:@"" deck:@"Pike Industrial Complex" score3:@(67.21) score4:@(137.99) score5:@(137.99) imageName:@"e5.jpg"];
    SMRDeck *v15=[[SMRDeck alloc] init:@"Plague Rat" publicName:@"Plague Rat" displayText:@"Plague Rat" detailName:@"" deck:@"Plague Rat" score3:@(-5.10) score4:@(76.13) score5:@(76.13) imageName:@"v7.jpg"];
    SMRDeck *v49=[[SMRDeck alloc] init:@"Proletariat" publicName:@"Proletariat" displayText:@"Proletariat" detailName:@"" deck:@"Proletariat" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"Proletariat.jpg"];
    SMRDeck *h18=[[SMRDeck alloc] init:@"Ra" publicName:@"Ra" displayText:@"Ra" detailName:@"" deck:@"Ra" score3:@(1.71) score4:@(-8.86) score5:@(-8.86) imageName:@"6.jpg"];
    SMRDeck *h19=[[SMRDeck alloc] init:@"Ra (Horus of the Two Horizons)" publicName:@"Ra: Horus of Two Horizons" displayText:@"Ra: Horus of the Two Horizons" detailName:@"" deck:@"Ra" score3:@(-3.33) score4:@(17.26) score5:@(17.26) imageName:@"19.jpg"];
    SMRDeck *e4=[[SMRDeck alloc] init:@"Realm of Discord" publicName:@"Realm of Discord" displayText:@"Realm of Discord" detailName:@"" deck:@"Realm of Discord" score3:@(66.50) score4:@(177.00) score5:@(177.00) imageName:@"e8.jpg"];
    SMRDeck *e5=[[SMRDeck alloc] init:@"Rook City" publicName:@"Rook City" displayText:@"Rook City" detailName:@"" deck:@"Rook City" score3:@(-10.76) score4:@(55.00) score5:@(55.00) imageName:@"e6.jpg"];
    SMRDeck *e6=[[SMRDeck alloc] init:@"Ruins of Atlantis" publicName:@"Ruins of Atlantis" displayText:@"Ruins of Atlantis" detailName:@"" deck:@"Ruins of Atlantis" score3:@(23.55) score4:@(109.34) score5:@(109.34) imageName:@"e3.jpg"];
    SMRDeck *h36=[[SMRDeck alloc] init:@"Setback" publicName:@"Setback" displayText:@"Setback" detailName:@"" deck:@"Setback" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"37.jpg"];
    SMRDeck *h35=[[SMRDeck alloc] init:@"Setback (Dark Watch)" publicName:@"Dark Watch Setback" displayText:@"Dark Watch Setback" detailName:@"" deck:@"Setback" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"41.jpg"];
    SMRDeck *e7=[[SMRDeck alloc] init:@"Silver Gulch 1883" publicName:@"Silver Gulch 1883" displayText:@"Silver Gulch 1883" detailName:@"" deck:@"Silver Gulch 1883" score3:@(58.05) score4:@(166.70) score5:@(166.70) imageName:@"e11.jpg"];
    SMRDeck *v16=[[SMRDeck alloc] init:@"Spite" publicName:@"Spite" displayText:@"Spite" detailName:@"" deck:@"Spite" score3:@(76.99) score4:@(-18.50) score5:@(-18.50) imageName:@"v8.jpg"];
    SMRDeck *v17=[[SMRDeck alloc] init:@"Spite (Agent of Gloom)" publicName:@"Spite, Agent of Gloom" displayText:@"Spite, Agent of Gloom" detailName:@"" deck:@"Spite" score3:@(76.99) score4:@(-18.50) score5:@(-18.50) imageName:@"v21.jpg"];
    SMRDeck *h22=[[SMRDeck alloc] init:@"Tachyon" publicName:@"Tachyon" displayText:@"Tachyon" detailName:@"" deck:@"Tachyon" score3:@(2.49) score4:@(4.12) score5:@(4.12) imageName:@"7.jpg"];
    SMRDeck *h23=[[SMRDeck alloc] init:@"Tachyon (Team Leader)" publicName:@"Team Leader Tachyon" displayText:@"Team Leader Tachyon" detailName:@"" deck:@"Tachyon" score3:@(75.34) score4:@(79.24) score5:@(79.24) imageName:@"23.jpg"];
    SMRDeck *h24=[[SMRDeck alloc] init:@"Tempest" publicName:@"Tempest" displayText:@"Tempest" detailName:@"" deck:@"Tempest" score3:@(-3.44) score4:@(22.52) score5:@(22.52) imageName:@"8.jpg"];
    SMRDeck *h25=[[SMRDeck alloc] init:@"Tempest (Freedom)" publicName:@"Tempest: Freedom" displayText:@"Tempest: Freedom" detailName:@"" deck:@"Tempest" score3:@(6.03) score4:@(-29.06) score5:@(-29.06) imageName:@"25.jpg"];
    SMRDeck *h26=[[SMRDeck alloc] init:@"The Argent Adept" publicName:@"The Argent Adept" displayText:@"The Argent Adept" detailName:@"" deck:@"The Argent Adept" score3:@(-10.60) score4:@(-29.15) score5:@(-29.15) imageName:@"15.jpg"];
    SMRDeck *e8=[[SMRDeck alloc] init:@"The Block" publicName:@"The Block" displayText:@"The Block" detailName:@"" deck:@"The Block" score3:@(134.64) score4:@(187.73) score5:@(187.73) imageName:@"e10.jpg"];
    SMRDeck *v18=[[SMRDeck alloc] init:@"The Chairman" publicName:@"The Chairman" displayText:@"The Chairman" detailName:@"" deck:@"The Chairman" score3:@(-136.38) score4:@(-78.26) score5:@(-78.26) imageName:@"v5.jpg"];
    SMRDeck *v19=[[SMRDeck alloc] init:@"The Dreamer" publicName:@"The Dreamer" displayText:@"The Dreamer" detailName:@"" deck:@"The Dreamer" score3:@(47.90) score4:@(-77.33) score5:@(-77.33) imageName:@"v17.jpg"];
    SMRDeck *v20=[[SMRDeck alloc] init:@"The Ennead" publicName:@"The Ennead" displayText:@"The Ennead" detailName:@"" deck:@"The Ennead" score3:@(140.40) score4:@(34.83) score5:@(34.83) imageName:@"v11.jpg"];
    SMRDeck *e9=[[SMRDeck alloc] init:@"The Final Wasteland" publicName:@"The Final Wasteland" displayText:@"The Final Wasteland" detailName:@"" deck:@"The Final Wasteland" score3:@(162.60) score4:@(200.62) score5:@(200.62) imageName:@"e12.jpg"];
    SMRDeck *v21=[[SMRDeck alloc] init:@"The Matriarch" publicName:@"The Matriarch" displayText:@"The Matriarch" detailName:@"" deck:@"The Matriarch" score3:@(-68.05) score4:@(-91.94) score5:@(-91.94) imageName:@"v6.jpg"];
    SMRDeck *h39=[[SMRDeck alloc] init:@"The Naturalist" publicName:@"The Naturalist" displayText:@"The Naturalist" detailName:@"" deck:@"The Naturalist" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"34.jpg"];
    SMRDeck *h29=[[SMRDeck alloc] init:@"The Scholar" publicName:@"The Scholar" displayText:@"The Scholar" detailName:@"" deck:@"The Scholar" score3:@(29.25) score4:@(-2.01) score5:@(-2.01) imageName:@"30.jpg"];
    SMRDeck *h38=[[SMRDeck alloc] init:@"The Sentinels" publicName:@"The Sentinels" displayText:@"The Sentinels" detailName:@"" deck:@"The Sentinels" score3:@(0.00) score4:@(0.00) score5:@(0.00) imageName:@"36.jpg"];
    SMRDeck *h30=[[SMRDeck alloc] init:@"The Visionary" publicName:@"The Visionary" displayText:@"The Visionary" detailName:@"" deck:@"The Visionary" score3:@(-6.70) score4:@(19.55) score5:@(19.55) imageName:@"9.jpg"];
    SMRDeck *h6=[[SMRDeck alloc] init:@"The Visionary (Dark)" publicName:@"Dark Visionary" displayText:@"Dark Visionary" detailName:@"" deck:@"The Visionary" score3:@(52.79) score4:@(24.46) score5:@(24.46) imageName:@"22.jpg"];
    SMRDeck *e10=[[SMRDeck alloc] init:@"Time Cataclysm" publicName:@"Time Cataclysm" displayText:@"Time Cataclysm" detailName:@"" deck:@"Time Cataclysm" score3:@(71.56) score4:@(152.38) score5:@(152.38) imageName:@"e9.jpg"];
    SMRDeck *e11=[[SMRDeck alloc] init:@"Tomb of Anubis" publicName:@"Tomb of Anubis" displayText:@"Tomb of Anubis" detailName:@"" deck:@"Tomb of Anubis" score3:@(83.93) score4:@(154.45) score5:@(154.45) imageName:@"e7.jpg"];
    SMRDeck *h31=[[SMRDeck alloc] init:@"Unity" publicName:@"Unity" displayText:@"Unity" detailName:@"" deck:@"Unity" score3:@(19.03) score4:@(-34.34) score5:@(-34.34) imageName:@"17.jpg"];
    SMRDeck *h10=[[SMRDeck alloc] init:@"Unity (Golem)" publicName:@"Golem Unity" displayText:@"Golem Unity" detailName:@"" deck:@"Unity" score3:@(13.72) score4:@(2.06) score5:@(2.06) imageName:@"27.jpg"];
    SMRDeck *e12=[[SMRDeck alloc] init:@"Wagner Mars Base" publicName:@"Wagner Mars Base" displayText:@"Wagner Mars Base" detailName:@"" deck:@"Wagner Mars Base" score3:@(67.49) score4:@(150.67) score5:@(150.67) imageName:@"e4.jpg"];
    SMRDeck *h32=[[SMRDeck alloc] init:@"Wraith" publicName:@"Wraith" displayText:@"Wraith" detailName:@"" deck:@"Wraith" score3:@(0.54) score4:@(3.02) score5:@(3.02) imageName:@"10.jpg"];
    SMRDeck *h33=[[SMRDeck alloc] init:@"Wraith (Price of Freedom)" publicName:@"Wraith: Price of Freedom" displayText:@"Wraith: the Price of Freedom" detailName:@"" deck:@"Wraith" score3:@(-0.72) score4:@(18.01) score5:@(18.01) imageName:@"26.jpg"];
    SMRDeck *h21=[[SMRDeck alloc] init:@"Wraith (Rook City)" publicName:@"Rook City Wraith" displayText:@"Rook City Wraith" detailName:@"" deck:@"Wraith" score3:@(-28.66) score4:@(-29.13) score5:@(-29.13) imageName:@"14.jpg"];
    SMRDeck *v23=[[SMRDeck alloc] init:@"z(Advanced) Akash\'bhuta" publicName:@"Akash\'bhuta (Advanced)" displayText:@"Akash\'bhuta" detailName:@"(Advanced)" deck:@"Akash'bhuta" score3:@(6.03) score4:@(-66.33) score5:@(-66.33) imageName:@"v9.jpg"];
    SMRDeck *v24=[[SMRDeck alloc] init:@"z(Advanced) Ambuscade" publicName:@"Ambuscade (Advanced)" displayText:@"Ambuscade" detailName:@"(Advanced)" deck:@"Ambuscade" score3:@(51.98) score4:@(162.35) score5:@(162.35) imageName:@"v13.jpg"];
    SMRDeck *v25=[[SMRDeck alloc] init:@"z(Advanced) Apostate" publicName:@"Apostate (Advanced)" displayText:@"Apostate" detailName:@"(Advanced)" deck:@"Apostate" score3:@(-9.39) score4:@(49.59) score5:@(49.59) imageName:@"v10.jpg"];
    SMRDeck *v26=[[SMRDeck alloc] init:@"z(Advanced) Baron Blade" publicName:@"Baron Blade (Advanced)" displayText:@"Baron Blade" detailName:@"(Advanced)" deck:@"Baron Blade" score3:@(-22.74) score4:@(3.24) score5:@(3.24) imageName:@"v1.jpg"];
    SMRDeck *v35=[[SMRDeck alloc] init:@"z(Advanced) Baron Blade (Mad Bomber)" publicName:@"Mad Bomber Blade (Advanced)" displayText:@"Mad Bomber Blade" detailName:@"(Advanced)" deck:@"Mad Bomber Blade" score3:@(-96.93) score4:@(-14.01) score5:@(-14.01) imageName:@"v15.jpg"];
    SMRDeck *v54=[[SMRDeck alloc] init:@"z(Advanced) Baron Blade Vengeance" publicName:@"Baron Blade Vengeance (Advanced)" displayText:@"Baron Blade Vengeance" detailName:@"(Advanced)" deck:@"Baron Blade Vengeance" score3:@(75.00) score4:@(75.00) score5:@(75.00) imageName:@"Vengeance Baron Blade.jpg"];
    SMRDeck *v27=[[SMRDeck alloc] init:@"z(Advanced) Citizen Dawn" publicName:@"Citizen Dawn (Advanced)" displayText:@"Citizen Dawn" detailName:@"(Advanced)" deck:@"Citizen Dawn" score3:@(-123.90) score4:@(-10.37) score5:@(-10.37) imageName:@"v2.jpg"];
    SMRDeck *v48=[[SMRDeck alloc] init:@"z(Advanced) Ermine" publicName:@"Ermine (Advanced)" displayText:@"Ermine" detailName:@"(Advanced)" deck:@"Ermine" score3:@(75.00) score4:@(75.00) score5:@(75.00) imageName:@"Ermine.jpg"];
    SMRDeck *v52=[[SMRDeck alloc] init:@"z(Advanced) Friction" publicName:@"Friction (Advanced)" displayText:@"Friction" detailName:@"(Advanced)" deck:@"Friction" score3:@(75.00) score4:@(75.00) score5:@(75.00) imageName:@"Fr.jpg"];
    SMRDeck *v46=[[SMRDeck alloc] init:@"z(Advanced) Fright Train" publicName:@"Fright Train (Advanced)" displayText:@"Fright Train" detailName:@"(Advanced)" deck:@"Fright Train" score3:@(75.00) score4:@(75.00) score5:@(75.00) imageName:@"FT.jpg"];
    SMRDeck *v29=[[SMRDeck alloc] init:@"z(Advanced) Gloomweaver" publicName:@"Gloomweaver (Advanced)" displayText:@"Gloomweaver" detailName:@"(Advanced)" deck:@"Gloomweaver" score3:@(50.66) score4:@(109.40) score5:@(109.40) imageName:@"v12.jpg"];
    SMRDeck *v30=[[SMRDeck alloc] init:@"z(Advanced) Gloomweaver (Skinwalker)" publicName:@"Gloomweaver, Skinwalker (Advanced)" displayText:@"Gloomweaver, Skinwalker" detailName:@"(Advanced)" deck:@"Gloomweaver" score3:@(50.66) score4:@(109.40) score5:@(109.40) imageName:@"v22.jpg"];
    SMRDeck *v31=[[SMRDeck alloc] init:@"z(Advanced) Grand Warlord Voss" publicName:@"Grand Warlord Voss (Advanced)" displayText:@"Grand Warlord Voss" detailName:@"(Advanced)" deck:@"Grand Warlord Voss" score3:@(-139.06) score4:@(-39.14) score5:@(-39.14) imageName:@"v3.jpg"];
    SMRDeck *v32=[[SMRDeck alloc] init:@"z(Advanced) Iron Legacy" publicName:@"Iron Legacy (Advanced)" displayText:@"Iron Legacy" detailName:@"(Advanced)" deck:@"Iron Legacy" score3:@(-132.60) score4:@(-137.88) score5:@(-137.88) imageName:@"v19.jpg"];
    SMRDeck *v33=[[SMRDeck alloc] init:@"z(Advanced) Kismet" publicName:@"Kismet (Advanced)" displayText:@"Kismet" detailName:@"(Advanced)" deck:@"Kismet" score3:@(1.38) score4:@(33.46) score5:@(33.46) imageName:@"v18.jpg"];
    SMRDeck *v34=[[SMRDeck alloc] init:@"z(Advanced) La Capitan" publicName:@"La Capitan (Advanced)" displayText:@"La Capitan" detailName:@"(Advanced)" deck:@"La Capitan" score3:@(-78.70) score4:@(-28.60) score5:@(-28.60) imageName:@"v16.jpg"];
    SMRDeck *v36=[[SMRDeck alloc] init:@"z(Advanced) Miss Information" publicName:@"Miss Information (Advanced)" displayText:@"Miss Information" detailName:@"(Advanced)" deck:@"Miss Information" score3:@(-63.29) score4:@(-122.17) score5:@(-122.17) imageName:@"v20.jpg"];
    SMRDeck *v37=[[SMRDeck alloc] init:@"z(Advanced) Omnitron" publicName:@"Omnitron (Advanced)" displayText:@"Omnitron" detailName:@"(Advanced)" deck:@"Omnitron" score3:@(-75.80) score4:@(-76.17) score5:@(-76.17) imageName:@"v4.jpg"];
    SMRDeck *v28=[[SMRDeck alloc] init:@"z(Advanced) Omnitron (Cosmic)" publicName:@"Cosmic Omnitron (Advanced)" displayText:@"Cosmic Omnitron" detailName:@"(Advanced)" deck:@"Omnitron" score3:@(-114.37) score4:@(-142.54) score5:@(-142.54) imageName:@"v14.jpg"];
    SMRDeck *v38=[[SMRDeck alloc] init:@"z(Advanced) Plague Rat" publicName:@"Plague Rat (Advanced)" displayText:@"Plague Rat" detailName:@"(Advanced)" deck:@"Plague Rat" score3:@(-229.11) score4:@(-49.67) score5:@(-49.67) imageName:@"v7.jpg"];
    SMRDeck *v50=[[SMRDeck alloc] init:@"z(Advanced) Proletariat" publicName:@"Proletariat (Advanced)" displayText:@"Proletariat" detailName:@"(Advanced)" deck:@"Proletariat" score3:@(75.00) score4:@(75.00) score5:@(75.00) imageName:@"Proletariat.jpg"];
    SMRDeck *v39=[[SMRDeck alloc] init:@"z(Advanced) Spite" publicName:@"Spite (Advanced)" displayText:@"Spite" detailName:@"(Advanced)" deck:@"Spite" score3:@(-45.06) score4:@(150.58) score5:@(150.58) imageName:@"v8.jpg"];
    SMRDeck *v40=[[SMRDeck alloc] init:@"z(Advanced) Spite (Agent of Gloom)" publicName:@"Spite, Agent of Gloom (Advanced)" displayText:@"Spite, Agent of Gloom" detailName:@"(Advanced)" deck:@"Spite" score3:@(-45.06) score4:@(150.58) score5:@(150.58) imageName:@"v21.jpg"];
    SMRDeck *v41=[[SMRDeck alloc] init:@"z(Advanced) The Chairman" publicName:@"The Chairman (Advanced)" displayText:@"The Chairman" detailName:@"(Advanced)" deck:@"The Chairman" score3:@(-173.15) score4:@(-10.37) score5:@(-10.37) imageName:@"v5.jpg"];
    SMRDeck *v42=[[SMRDeck alloc] init:@"z(Advanced) The Dreamer" publicName:@"The Dreamer (Advanced)" displayText:@"The Dreamer" detailName:@"(Advanced)" deck:@"The Dreamer" score3:@(156.44) score4:@(-93.04) score5:@(-93.04) imageName:@"v17.jpg"];
    SMRDeck *v43=[[SMRDeck alloc] init:@"z(Advanced) The Ennead" publicName:@"The Ennead (Advanced)" displayText:@"The Ennead" detailName:@"(Advanced)" deck:@"The Ennead" score3:@(-63.29) score4:@(-88.38) score5:@(-88.38) imageName:@"v11.jpg"];
    SMRDeck *v44=[[SMRDeck alloc] init:@"z(Advanced) The Matriarch" publicName:@"The Matriarch (Advanced)" displayText:@"The Matriarch" detailName:@"(Advanced)" deck:@"The Matriarch" score3:@(-188.56) score4:@(-22.15) score5:@(-22.15) imageName:@"v6.jpg"];
    NSMutableArray *villains = [NSMutableArray arrayWithObjects:v1,v2,v3,v4,v12,v53,v5,v47,v51,v45,v7,v22,v8,v9,v10,v11,v13,v14,v6,v15,v49,v16,v17,v18,v19,v20,v21,v23,v24,v25,v26,v35,v54,v27,v48,v52,v46,v29,v30,v31,v32,v33,v34,v36,v37,v28,v38,v50,v39,v40,v41,v42,v43,v44, nil];
    [SMRGlobals singleton].villains = villains;
    
    NSMutableArray *environments = [NSMutableArray arrayWithObjects:e14,e1,e2,e13,e3,e4,e5,e6,e7,e8,e9,e10,e11,e12, nil];
    [SMRGlobals singleton].environments = environments;
    
    NSMutableArray *heroes = [NSMutableArray arrayWithObjects:h1,h2,h3,h4,h41,h5,h7,h8,h9,h20,h11,h27,h37,h12,h28,h34,h13,h14,h15,h16,h17,h40,h18,h19,h36,h35,h22,h23,h24,h25,h26,h39,h29,h38,h30,h6,h31,h10,h32,h33,h21, nil];
    [SMRGlobals singleton].heroes = heroes;
    
    SMRExpansion *ex1 = [[SMRExpansion alloc] init:@"Base Set" heroes:@[@"Absolute Zero",@"Bunker",@"Fanatic",@"Haka",@"Legacy",@"Ra",@"Tachyon",@"Tempest",@"The Visionary",@"Wraith"] villains:@[@"Baron Blade",@"Citizen Dawn",@"Grand Warlord Voss",@"Omnitron",@"z(Advanced) Baron Blade",@"z(Advanced) Citizen Dawn",@"z(Advanced) Grand Warlord Voss",@"z(Advanced) Omnitron"] environments:@[@"Insula Primalis",@"Megalopolis",@"Ruins of Atlantis",@"Wagner Mars Base"] imageName:@"BaseSet.jpg"];
    
    
    
    SMRExpansion *ex7 = [[SMRExpansion alloc] init:@"Promo Cards" heroes:@[@"Absolute Zero (Elemental Wrath)",@"Bunker (Engine of War)",@"Bunker (G. I.)",@"Expatriette (Dark Watch)",@"Fanatic (Redeemer)",@"Haka (The Eternal)",@"Legacy (The Greatest)",@"Legacy (Young)",@"Mr. Fixer (Dark Watch)",@"Nightmist (Dark Watch)",@"Ra (Horus of the Two Horizons)",@"Setback (Dark Watch)",@"Tachyon (Team Leader)",@"Tempest (Freedom)",@"The Visionary (Dark)",@"Unity (Golem)",@"Wraith (Price of Freedom)",@"Wraith (Rook City)"] villains:@[@"Baron Blade (Mad Bomber)",@"Gloomweaver (Skinwalker)",@"Omnitron (Cosmic)",@"Spite (Agent of Gloom)",@"z(Advanced) Baron Blade (Mad Bomber)",@"z(Advanced) Gloomweaver (Skinwalker)",@"z(Advanced) Omnitron (Cosmic)",@"z(Advanced) Spite (Agent of Gloom)"] environments:@[] imageName:@"Promo.jpg"];
    
    
    
    SMRExpansion *ex6 = [[SMRExpansion alloc] init:@"Mini-Expansions" heroes:@[@"The Scholar",@"Unity"] villains:@[@"Ambuscade",@"Miss Information",@"z(Advanced) Ambuscade",@"z(Advanced) Miss Information"] environments:@[@"Silver Gulch 1883",@"The Final Wasteland"] imageName:@"mini.jpg"];
    
    
    
    SMRExpansion *ex3 = [[SMRExpansion alloc] init:@"Infernal Relics" heroes:@[@"Nightmist",@"The Argent Adept"] villains:@[@"Akash\'bhuta",@"Apostate",@"Gloomweaver",@"The Ennead",@"z(Advanced) Akash\'bhuta",@"z(Advanced) Apostate",@"z(Advanced) Gloomweaver",@"z(Advanced) The Ennead"] environments:@[@"Realm of Discord",@"Tomb of Anubis"] imageName:@"InfernalRelics.jpg"];
    
    
    
    SMRExpansion *ex4 = [[SMRExpansion alloc] init:@"Shattered Timelines" heroes:@[@"Chrono Ranger",@"Omnitron-X"] villains:@[@"Iron Legacy",@"Kismet",@"La Capitan",@"The Dreamer",@"z(Advanced) Iron Legacy",@"z(Advanced) Kismet",@"z(Advanced) La Capitan",@"z(Advanced) The Dreamer"] environments:@[@"The Block",@"Time Cataclysm"] imageName:@"ShatteredTimelines.jpg"];
    
    
    
    SMRExpansion *ex2 = [[SMRExpansion alloc] init:@"Rook City" heroes:@[@"Expatriette",@"Mr. Fixer"] villains:@[@"Plague Rat",@"Spite",@"The Chairman",@"The Matriarch",@"z(Advanced) Plague Rat",@"z(Advanced) Spite",@"z(Advanced) The Chairman",@"z(Advanced) The Matriarch"] environments:@[@"Pike Industrial Complex",@"Rook City"] imageName:@"RookCity.jpg"];
    
    
    
    SMRExpansion *ex5 = [[SMRExpansion alloc] init:@"Vengeance" heroes:@[@"K N I F E",@"Parse",@"Setback",@"The Naturalist",@"The Sentinels"] villains:@[@"Baron Blade Vengeance",@"Ermine",@"Friction",@"Fright Train",@"Proletariat",@"z(Advanced) Baron Blade Vengeance",@"z(Advanced) Ermine",@"z(Advanced) Friction",@"z(Advanced) Fright Train",@"z(Advanced) Proletariat"] environments:@[@"Freedom Tower",@"Mobile Defense Platform"] imageName:@"Vengeance.jpg"];

    
    
    NSMutableArray *expansions = [NSMutableArray arrayWithObjects:ex1,ex2,ex3,ex4,ex5,ex6,ex7, nil];
    [SMRGlobals singleton].expansions = expansions;
    
}

//@implementation SMRInitialize
//+ (void) initializeGameData {
//    // Add in the game data by hand because we're hardcore like that.
//    
//    // VILLAIN DECKS
//    SMRDeck *v1 = [[SMRDeck alloc] init:@"v1" deck:@"v1deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v1.jpg"];
//    SMRDeck *v2 = [[SMRDeck alloc] init:@"v2" deck:@"v2deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v2.jpg"];
//    SMRDeck *v3 = [[SMRDeck alloc] init:@"v3" deck:@"v3deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v3.jpg"];
//    NSMutableArray *villains = [NSMutableArray arrayWithObjects:v1,v2,v3, nil];
//    
//    
//    // ENVIRONMENT DECKS
//    SMRDeck *e1 = [[SMRDeck alloc] init:@"e1" deck:@"e1deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v4.jpg"];
//    SMRDeck *e2 = [[SMRDeck alloc] init:@"e2" deck:@"e2deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v1.jpg"];
//    NSMutableArray *environments = [NSMutableArray arrayWithObjects:e1,e2, nil];
//    [SMRGlobals singleton].environments = environments;
//    
//    // HERO DECKS
//    SMRDeck *h1 = [[SMRDeck alloc] init:@"h1" deck:@"h12deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v1.jpg"];
//    SMRDeck *h2 = [[SMRDeck alloc] init:@"h2" deck:@"h12deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v2.jpg"];
//    SMRDeck *h3 = [[SMRDeck alloc] init:@"h3" deck:@"h3deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v3.jpg"];
//    SMRDeck *h4 = [[SMRDeck alloc] init:@"h4" deck:@"h4deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v4.jpg"];
//    SMRDeck *h5 = [[SMRDeck alloc] init:@"h5" deck:@"h5deck" score3:@0.0 score4:@0.0 score5:@0.0 imageName:@"v1.jpg"];
//    NSMutableArray *heroes = [NSMutableArray arrayWithObjects:h1,h2,h3,h4,h5, nil];
//    [SMRGlobals singleton].heroes = heroes;
//    
//    // GAMES MODE DECKS (Only implement "base")
//    SMRDeck *g1 = [[SMRDeck alloc] init:@"base" deck:@"Not Applicable" score3:@63.3 score4:@149.0 score5:@147.8 imageName:nil];
//    NSMutableArray *gameModes = [NSMutableArray arrayWithObjects:g1, nil];
//    [SMRGlobals singleton].gameModes = gameModes;
//    
//    
//    // EXPANSIONS
//    SMRExpansion *ex1 = [[SMRExpansion alloc] init:@"ex1" heroes:@[@"h1",@"h3",@"h4",@"h5"] villains:@[@"v1",@"v2"] environments:@[@"e1"] imageName:@"v4.jpg"];
//    SMRExpansion *ex2 = [[SMRExpansion alloc] init:@"ex2" heroes:@[@"h2"] villains:@[@"v3"] environments:@[@"e2"] imageName:@"v4.jpg"];
//    NSMutableArray *expansions = [NSMutableArray arrayWithObjects:ex1,ex2, nil];
//    [SMRGlobals singleton].expansions = expansions;
//    
//}





+ (NSDictionary *) createDictionary:(NSDictionary*) oldDictionary decks:(NSMutableArray *)decks {
    NSMutableDictionary *tmp = [oldDictionary mutableCopy];
    
    for (int i = 0; i < [decks count]; i ++)
    {
        SMRDeck *currentDeck = [decks objectAtIndex:i];
        NSString *key = currentDeck.name;
        [tmp setObject:currentDeck forKey:key];
    }
    return tmp;
}

+ (void) initializeSMR {
    // Loads deck and expansion data
    [SMRInitialize initializeGameData];
    
    // Creates a dictionary that takes names to decks
    SMRGlobals *globals = [SMRGlobals singleton];
    
    
    NSDictionary *newDicationary = @{};
    newDicationary = [SMRInitialize createDictionary:newDicationary decks:globals.heroes];
    newDicationary = [SMRInitialize createDictionary:newDicationary decks:globals.villains];
    newDicationary = [SMRInitialize createDictionary:newDicationary decks:globals.environments];
    newDicationary = [SMRInitialize createDictionary:newDicationary decks:globals.gameModes];
    globals.dictionary = newDicationary;


    
    //GIVE SOME FAKE GAMES.
    //[self initializeFakeGameHistory];
    globals.pastGames = [[NSMutableArray alloc] init];
    
    
    // now load old data.
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"notUploadGameStatistics"]) {
        globals.notUploadGameStatistics = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"notUploadGameStatistics"] boolValue];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"allowDuplicateHeroes"]) {
        globals.allowDuplicateHeroes = [(NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"allowDuplicateHeroes"] boolValue];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"pastGames"]) {
        NSData *data = [[[NSUserDefaults standardUserDefaults] objectForKey:@"pastGames"] copy];
        globals.pastGames = (NSMutableArray*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"availables"]) {
        NSData *data = [[[NSUserDefaults standardUserDefaults] objectForKey:@"availables"] copy];
        NSMutableArray *availables = (NSMutableArray*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [SMRInitialize mergeOldAvailability:availables];
    } else {
        // SET THE FIRST EXPANSION AS AVAILABLE BY DEFAULT, if we don't find any availability information
        SMRExpansion *firstExpansion = [globals.expansions objectAtIndex:0];
        [firstExpansion setAvailability:YES];
    }
    
    //Now try to upload the data
    [SMRUpload upload];
    
}

+ (void) mergeOldAvailability:(NSMutableArray*) availables {
    SMRGlobals *globals = [SMRGlobals singleton];
    NSDictionary *dictionary = globals.dictionary;
    
    for (NSInteger i=0; i< availables.count; i++) {
        NSString *name = [availables objectAtIndex:i];
        SMRDeck *deck = dictionary[name];
        if (deck) {
            deck.available = YES;
        }
    }
}



//+ (void) initializeFakeGameHistory {
//    SMRGame *game1 = [[SMRGame alloc] initGameWithPlayers:3 villain:@"v1" environment:@"e2" hero1:@"h1" hero2:@"h2" hero3:@"h3" hero4:nil hero5:nil];
//    [game1 setVictory:@"Win"];
//    SMRGame *game2 = [[SMRGame alloc] initGameWithPlayers:4 villain:@"v2" environment:@"e2" hero1:@"h1" hero2:@"h2" hero3:@"h3" hero4:@"h4" hero5:nil];
//    SMRGame *game3 = [[SMRGame alloc] initGameWithPlayers:3 villain:@"v1" environment:@"e1" hero1:@"h1" hero2:@"h3" hero3:@"h4" hero4:nil hero5:nil];
//    [game3 setVictory:@"Loss"];
//    SMRGame *game4 = [[SMRGame alloc] initGameWithPlayers:5 villain:@"v3" environment:@"e1" hero1:@"h2" hero2:@"h3" hero3:@"h1" hero4:@"h4" hero5:@"h5"];
//    [game4 setVictory:@"Win"];
//    SMRGame *game5 = [[SMRGame alloc] initGameWithPlayers:5 villain:@"v1" environment:@"e2" hero1:@"h5" hero2:@"h2" hero3:@"h3" hero4:@"h1" hero5:@"h4"];
//    [game5 setVictory:@"Win"];
//    SMRGame *game6 = [[SMRGame alloc] initGameWithPlayers:3 villain:@"v1" environment:@"e2" hero1:@"h1" hero2:@"h2" hero3:@"h3" hero4:@"(None)" hero5:@"(None)"];
//    NSMutableArray *pastGames = [NSMutableArray arrayWithObjects:game1,game2,game3,game4,game5,game6, nil];
//    [SMRGlobals singleton].pastGames = pastGames;
//}
@end