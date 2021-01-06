# CE-namedSpawnables

### A CobaltEssentials extension to provide generic name translation and chat-based context for spawnables on BeamMP Servers

![Example of namedSpawnables](https://i.imgur.com/6qCnsEc.png)

## Installation:

#### 1. Place namedSpawnables.lua in
`.../Resources/Server/CobaltEssentials/extensions/`

#### 2. Add an entry to turn it on in:
`.../Resources/Server/CobaltEssentials/LoadExtensions.cfg`

 ```cfg
# Add your new extensions here as a key/value pair
# The first one is the name in the lua enviroment
# The second value is the file path to the main lua from CobaltEssentials/extensions

exampleExtension = "exampleExtension"
namedSpawnables = "namedSpawnables"
```

#### 3. Configure if you need to.

#### 4. Restart your server to apply changes.
---
## Configuration:

Within namedSpawnables.lua, you will see the list of stock `vehNames` pairs, where we match the generic name to the full name.
At the bottom of this list you can add your own pairs (ie. Mods), following the same key/value format:

`genericName = "fullName"`

So, one I use for the DSC Scarab mod is:

`dscscarab = "DSC Scarab"`

If you would like to turn off one of the three conditions upon which info will be printed in chat, simply comment out the contents of a relevant function.
Here's an example where I have turned off info relating to deletions:

```lua
...

local function onVehicleDeleted(player, vehID,  source)
	--[[for genericName,fullName in pairs(vehNames) do
		if tostring(genericName) == player.vehicles[tonumber(vehID)].name then
			SendChatMessage(-1, player.name .. " deleted their " .. fullName)
		end
	end]]
end

...
```
