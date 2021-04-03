DELETE FROM Buildings
WHERE BuildingType IN ('BUILDING_LIBRARY', 'BUILDING_UNIVERSITY', 'BUILDING_MADRASA', 'BUILDING_RESEARCH_LAB');

INSERT INTO Types (Type, Kind)
VALUES ('DISTRICT_LIBRARY', 'KIND_DISTRICT'),
       ('DISTRICT_UNIVERSITY', 'KIND_DISTRICT'),
       ('DISTRICT_MADRASA', 'KIND_DISTRICT'),
       ('DISTRICT_RESEARCH_LAB', 'KIND_DISTRICT'),
       ('FEATURE_CAMPUS_EXTENSION_DUMMY', 'KIND_FEATURE');

INSERT INTO Districts (DistrictType, Name, PrereqTech, PrereqCivic, Description, Cost, RequiresPlacement, RequiresPopulation, NoAdjacentCity, Aqueduct, InternalOnly, CaptureRemovesBuildings, CaptureRemovesCityDefenses, PlunderType, PlunderAmount, MilitaryDomain, TraitType, Housing, Maintenance)
VALUES ('DISTRICT_LIBRARY', 'LOC_BUILDING_LIBRARY_NAME', 'TECH_WRITING', NULL, NULL, 90, 1, 0, 0, 0, 0, 0, 0, 'PLUNDER_SCIENCE', 25, 'NO_DOMAIN', NULL, 0, 1),
       ('DISTRICT_UNIVERSITY', 'LOC_BUILDING_UNIVERSITY_NAME', 'TECH_EDUCATION', NULL, NULL, 250, 1, 0, 0, 0, 0, 0, 0, 'PLUNDER_SCIENCE', 25, 'NO_DOMAIN', NULL, 1, 2),
       ('DISTRICT_MADRASA', 'LOC_BUILDING_MADRASA_NAME', NULL, 'CIVIC_THEOLOGY', 'LOC_BUILDING_MADRASA_DESCRIPTION', 250, 1, 0, 0, 0, 0, 0, 0, 'PLUNDER_SCIENCE', 25, 'NO_DOMAIN', 'TRAIT_CIVILIZATION_BUILDING_MADRASA', 1, 2),
       ('DISTRICT_RESEARCH_LAB', 'LOC_BUILDING_RESEARCH_LAB_NAME', 'TECH_CHEMISTRY', NULL, NULL, 580, 1, 0, 0, 0, 0, 0, 0, 'PLUNDER_SCIENCE', 25, 'NO_DOMAIN', NULL, 0, 3);

INSERT INTO DistrictReplaces (CivUniqueDistrictType, ReplacesDistrictType)
VALUES ('DISTRICT_MADRASA', 'DISTRICT_UNIVERSITY');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES ('LIBRARY_SCIENCE', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE'),
       ('UNIVERSITY_SCIENCE', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE'),
       ('MADRASA_SCIENCE', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE'),
       ('RESEARCH_LAB_SCIENCE', 'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('LIBRARY_SCIENCE', 'Amount', 1),
       ('LIBRARY_SCIENCE', 'YieldType', 'YIELD_SCIENE'),
       ('UNIVERSITY_SCIENCE', 'Amount', 3),
       ('UNIVERSITY_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
       ('MADRASA_SCIENCE', 'Amount', 4),
       ('MADRASA_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
       ('RESEARCH_LAB_SCIENCE', 'Amount', 4),
       ('RESEARCH_LAB_SCIENCE', 'YieldType', 'YIELD_SCIENCE');

INSERT INTO Features (FeatureType, Name)
VALUES ('FEATURE_CAMPUS_EXTENSION_DUMMY', 'LOC_FEATURE_CAMPUS_EXTENSION_DUMMY_NAME');

INSERT INTO District_RequiredFeatures (DistrictType, FeatureType)
VALUES ('DISTRICT_LIBRARY', 'FEATURE_CAMPUS_EXTENSION_DUMMY'),
       ('DISTRICT_UNIVERSITY', 'FEATURE_CAMPUS_EXTENSION_DUMMY'),
       ('DISTRICT_MADRASA', 'FEATURE_CAMPUS_EXTENSION_DUMMY'),
       ('DISTRICT_RESEARCH_LAB', 'FEATURE_CAMPUS_EXTENSION_DUMMY');