# CE-namedSpawnables (Now with all stock makes _and_ configs!)

### A CobaltEssentials extension to provide generic name translation and chat-based context for spawnables on BeamMP Servers


![Example of namedSpawnables](https://i.imgur.com/RIm0OvV.png)

## Installation:

#### 1. Place namedSpawnables.lua in:
`.../Resources/Server/CobaltEssentials/extensions/`

---

#### 2. Add an entry to turn it on in:
`.../Resources/Server/CobaltEssentials/LoadExtensions.cfg`

 ```cfg
# Add your new extensions here as a key/value pair
# The first one is the name in the lua enviroment
# The second value is the file path to the main lua from CobaltEssentials/extensions

exampleExtension = "exampleExtension"
namedSpawnables = "namedSpawnables"
```

---

#### 3. Optionally, for information printed in the Messages UI app, add the namedSpawnables.zip in:
`.../Resources/Client/`

![Example of namedSpawnables in Messages UI app](https://i.imgur.com/heN4OlA.png)

---

#### 4. Optionally, configure if desired.

Within namedSpawnables.lua, see a Configure section near the top:

```lua
...
--Configure
local showOnVehicleSpawn = true
local showOnVehicleEdited = true
local showOnVehicleDeleted = true
...
```

To turn off any of these conditions on which information will print, set to false.

---

#### 5. Restart your server to apply changes.
