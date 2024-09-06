# Custom HUD Script for FiveM (ESX)

## Description
This script provides a custom Heads-Up Display (HUD) for FiveM servers running the ESX framework. The HUD displays critical player information, including health, armor, hunger, thirst, stamina, and finances (cash, bank balance, and black money). It also includes custom icons for each attribute and a dynamic color system for status values. The HUD integrates seamlessly with the ESX framework to retrieve player data and updates in real time.

## Features
- **Player Stats**: Health, Armor, Hunger, Thirst, Stamina, and Armor Count displayed with custom icons.
- **Player Finance Information**: Shows the player's Cash, Bank, and Black Money amounts.
- **Server Branding**: The HUD displays the server abbreviation (configurable via `config.lua`) with a dynamic color-cycling effect.
- **NUI Integration**: Uses ESX and NUI to send real-time updates to the HTML interface.
- **Dynamic Color Indicators**: Icons for hunger, thirst, and stamina dynamically change color based on their value (green, yellow, orange, red).
- **Optimized Performance**: Frequent updates are handled asynchronously to avoid performance issues.

## Compatibility
- **Framework**: This script is fully compatible with the **ESX** framework.
- **FiveM**: Built for FiveM servers.
- **NUI**: Utilizes NUI to display HUD elements in an HTML-based interface.
- **ESX Status System**: The script interacts with the `esx_status` resource to fetch hunger and thirst data.

## Configuration
The script includes a configuration file (`config.lua`) to allow server-specific customization.

## Dyanmic Color Changes
The icons representing hunger, thirst, and stamina will change colors based on the value:
- Green: Above 75%
- Yellow: 51%-75%
- Orange: 26%-50%
- Red: 0%-25%

## Includes
This also includes a armor script that will give you more armor (this can be configured in the config.lua for the armor script). As of right now you get 100 per armor, and its maxed value is 200.

- **Server Abbreviation**: You can set your server's abbreviation by modifying `Config.ServerAbbreviation` in `config.lua`. This value will be displayed on the HUD along with the player’s ID.

```lua
Config = {}
Config.ServerAbbreviation = "PLUGRP" -- Change this to your server's abbreviation