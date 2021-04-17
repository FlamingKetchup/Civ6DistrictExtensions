print(GameInfo.Districts)
print(GameInfo.Features)
print(GameInfo.Districts['DISTRICT_CAMPUS'].Index)
print(GameInfo.Districts['DISTRICT_LIBRARY'].Index)
print(GameInfo.Districts['DISTRICT_UNIVERSITY'].Index)
print(GameInfo.Districts['DISTRICT_MADRASA'].Index)
print(GameInfo.Features['FEATURE_LIBRARY_DUMMY'].Index)
print(GameInfo.Features['FEATURE_UNIVERSITY_DUMMY'].Index)
print(GameInfo.Features['FEATURE_RESEARCH_LAB_DUMMY'].Index)
function CampusOrExtensionConstructed(playerID, districtID, iX, iY)
  print("Running CampusOrExtensionConstructed")
  -- District IDs
  local iCampus = GameInfo.Districts['DISTRICT_CAMPUS'].Index
  local iLibrary = GameInfo.Districts['DISTRICT_LIBRARY'].Index
  local iUniversity = GameInfo.Districts['DISTRICT_UNIVERSITY'].Index
  local iMadrasa = GameInfo.Districts['DISTRICT_MADRASA'].Index
  -- Dummy Feature IDs
  local iDummy
  if districtID == iCampus then
    print("Campus placed")
    iDummy = GameInfo.Features['FEATURE_LIBRARY_DUMMY'].Index
  elseif districtID == iLibrary then
    print("Library placed")
    iDummy = GameInfo.Features['FEATURE_UNIVERSITY_DUMMY'].Index
  elseif districtID == iUniversity or districtID == iMadrasa then
    print("University or Madrasa placed")
    iDummy = GameInfo.Features['FEATURE_RESEARCH_LAB_DUMMY'].Index
  else
    return
  end
  print(iDummy)

  local adjacentPlots = {Map.GetPlot(iX-1, iY),
                         Map.GetPlot(iX+1, iY),
                         Map.GetPlot(iX, iY-1),
                         Map.GetPlot(iX, iY+1),
                         Map.GetPlot(iX+1, iY-1),
                         Map.GetPlot(iX+1, iY+1)}

  for k, plot in ipairs(adjacentPlots) do
    print(plot:GetX() .. ", " .. plot:GetY())
    print("FeatureType:" .. plot:GetFeatureType())
    if plot:GetFeatureType() == -1 or
       plot:GetFeatureType() == GameInfo.Features['FEATURE_LIBRARY_DUMMY'].Index or
       plot:GetFeatureType() == GameInfo.Features['FEATURE_UNIVERSITY_DUMMY'].Index or
       plot:GetFeatureType() == GameInfo.Features['FEATURE_RESEARCH_LAB_DUMMY'].Index then
      print("Adding dummy feature")
      TerrainBuilder.SetFeatureType(plot, iDummy)
    end
  end
end

print(CampusOrExtensionConstructed)
GameEvents.OnDistrictConstructed.Add(CampusOrExtensionConstructed)
