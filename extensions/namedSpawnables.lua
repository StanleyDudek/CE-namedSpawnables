local M = {}

--called whenever the extension is loaded
local function onInit()

end

local vehNames =
{
	--stock vehicles
	coupe = "Ibishu 200BX",
	etk800 = "ETK 800 Series",
	barstow = "Gavril Barstow",
	bluebuck = "Gavril Bluebuck",
	super = "Civetta Bolide",
	hatch = "Ibishu Covet",
	vivace = "Cherrier FCV",
	fullsize = "Gavril Grand Marshal",
	etki = "ETK I-Series",
	etkc = "ETK K-Series",
	legran = "Bruckell LeGran",
	miramar = "Ibishu Miramar",
	moonhawk = "Bruckell Moonhawk",
	midsize = "Mk2 Ibishu Pessima",
	pessima = "Mk1 Ibishu Pessima",
	autobello = "Autobello Picollina",
	pigeon = "Ibishu Pigeon",
	sbr = "Hirochi SBR4",
	burnside = "Gavril Burnside Special",
	sunburst = "Hirochi Sunburst",
	pickup = "Gavril D-Series",
	citybus = "Wentward DT40L",
	van = "Gavril H-Series",
	hopper = "Ibishu Hopper",
	roamer = "Gavril Roamer",
	semi = "Gavril T-Series",
	boxutility = "Small Box Utility Trailer",
	dryvan = "Randolph Dry Van Trailer",
	flatbed = "Randolph Flatbed Trailer",
	boxutility_large = "Large Box Utility Trailer",
	tsfb = "Small Flatbed Trailer",
	tanker = "Randolph Tanker Trailer",
	caravan = "Travel Trailer",
	--stock props
	flail = "Giant Flail",
	ball = "Ball",
	bollard = "Bollard",
	christmas_tree = "Christmas Tree",
	blockwall = "Cinderblock Wall",
	barrier = "Concrete Barrier",
	wall = "Concrete Retaining Wall",
	cones = "Traffic Cone",
	flipramp = "Flip Ramp",
	gate = "Gate",
	haybale = "Square Hay Bale",
	inflated_mat = "Inflated Mat",
	kickplate = "Kick Plate",
	large_angletester = "Large Angle Tester",
	large_bridge = "Large Bridge",
	large_cannon = "Large Cannon",
	large_crusher = "Large Crusher",
	large_hamster_wheel = "Large Hamster Wheel",
	large_roller = "Large Roller",
	large_spinner = "Large Spinner",
	metal_box = "Metal Box",
	metal_ramp = "Metal Ramp",
	cannon = "Old Cannon",
	roadsigns = "Road Sign",
	rocks = "Rocks & Boulders",
	rollover = "Rollover Sled",
	sawhorse = "Saw Horse Barrier",
	shipping_container = "Shipping Container",
	barrels = "Steel Barrel",
	streetlight = "Street Light",
	suspensionbridge = "Suspension Bridge",
	large_tilt = "Tilt Board",
	tirestacks = "Tire Stack",
	tirewall = "Tire Wall",
	trafficbarrel = "Traffic Barrel",
	tube = "Traffic Tube",
	piano = "Upright Piano",
	weightpad = "Weight Pad",
	testroller = "Wheel Roller",
	woodcrate = "Wood Crate",
	woodplanks = "Wood Planks",
	--add additional definitions as a key value pair
	--genericName = "fullName"
}

--called whenever a player spawns a vehicle
local function onVehicleSpawn(player, vehID,  data)
	local matchCount = 0
	for genericName,fullName in pairs(vehNames) do
		if tostring(genericName) == data.name then
			matchCount = matchCount + 1
		end
	end
	if matchCount == 1 then
		for genericName,fullName in pairs(vehNames) do
			if tostring(genericName) == data.name then
				if data.name == "woodplanks" then
					SendChatMessage(-1, player.name .. " spawned some " .. fullName)
				elseif data.name == "rocks" then
					SendChatMessage(-1, player.name .. " spawned some " .. fullName)
				elseif string.match(string.sub(fullName,1,1), "[AEIOU]") then
					SendChatMessage(-1, player.name .. " spawned an " .. fullName)
				else
					SendChatMessage(-1, player.name .. " spawned a " .. fullName)
				end
			end
		end
	else
		SendChatMessage(-1, player.name .. " spawned an unrecognized vehicle: " .. data.name)
	end
end

--called whenever a player applies their vehicle edits
local function onVehicleEdited(player, vehID,  data)
	local matchCount = 0
	for genericName,fullName in pairs(vehNames) do
		if tostring(genericName) == data.name then
			matchCount = matchCount + 1
		end
	end
	if matchCount == 1 then
		for genericName,fullName in pairs(vehNames) do
			if tostring(genericName) == data.name then
				SendChatMessage(-1, player.name .. " edited their " .. fullName)
			end
		end
	else
		SendChatMessage(-1, player.name .. " edited their unrecognized vehicle: " .. data.name)
	end
end

--called whenever a vehicle is deleted
local function onVehicleDeleted(player, vehID,  source)
	if player.vehicles[tonumber(vehID)] ~= nil then
		local unrecognizedName = player.vehicles[tonumber(vehID)].name
		local matchCount = 0
		for genericName,fullName in pairs(vehNames) do
			if tostring(genericName) == unrecognizedName then
				matchCount = matchCount + 1
			end
		end
		if matchCount == 1 then
			for genericName,fullName in pairs(vehNames) do
				if tostring(genericName) == unrecognizedName then
					SendChatMessage(-1, player.name .. " deleted their " .. fullName)
				end
			end
		else
			SendChatMessage(-1, player.name .. " deleted their unrecognized vehicle: " .. unrecognizedName)
		end
	else
		SendChatMessage(-1, player.name .. " tried to spawn something, but was stopped!")
	end
end

M.onInit = onInit

M.onVehicleSpawn = onVehicleSpawn
M.onVehicleEdited = onVehicleEdited
M.onVehicleDeleted = onVehicleDeleted

return M
