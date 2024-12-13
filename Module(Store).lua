-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-12-13 09:04:19
-- Luau version 6, Types version 3
-- Time taken: 0.001356 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Rodux = require(ReplicatedStorage.Rodux)
return Rodux.Store.new(Rodux.combineReducers({
	cash = require(ReplicatedStorage.App.cashReducer);
	garageCategories = require(ReplicatedStorage.Garage.categoriesReducer);
	garageItems = require(ReplicatedStorage.Garage.itemsReducer);
	garageSort = require(ReplicatedStorage.Garage.sortReducer);
	garageCategory = require(ReplicatedStorage.Garage.categoryReducer);
	garageReceipt = require(ReplicatedStorage.Garage.receiptReducer);
	garageVehiclePacket = require(ReplicatedStorage.Garage.vehiclePacketReducer);
	garagePage = require(ReplicatedStorage.Garage.pageReducer);
	garageOwned = require(ReplicatedStorage.Garage.ownedReducer);
	garageFavorited = require(ReplicatedStorage.Garage.favoritedReducer);
	garageEquipped = require(ReplicatedStorage.Garage.equippedReducer);
	garageSaves = require(ReplicatedStorage.Garage.savesReducer);
	garagePremium = require(ReplicatedStorage.Garage.premiumReducer);
	gamepassOwned = require(ReplicatedStorage.Garage.gamepassOwnedReducer);
	garageInVehicle = require(ReplicatedStorage.Garage.inVehicleReducer);
	garageInPhysical = require(ReplicatedStorage.Garage.inPhysicalReducer);
	inventoryPlayers = require(ReplicatedStorage.Trade.inventoryPlayersReducer);
	minimapLabels = require(ReplicatedStorage.App.minimapLabelReducer);
	minimapWaypoints = require(ReplicatedStorage.App.minimapWaypointsReducer);
	casinoKeypadVisible = require(ReplicatedStorage.Casino.keypadVisibleReducer);
	casinoKeypadCallback = require(ReplicatedStorage.Casino.keypadCallbackReducer);
	traderMe = require(ReplicatedStorage.Trade.traderMeReducer);
	traderThem = require(ReplicatedStorage.Trade.traderThemReducer);
	tradeInventory = require(ReplicatedStorage.Trade.tradeInventoryReducer);
	tradeChatMessages = require(ReplicatedStorage.Trade.tradeChatMessagesReducer);
	tradeInitiations = require(ReplicatedStorage.Trade.tradeInitiationsReducer);
	tradeActive = require(ReplicatedStorage.Trade.tradeActiveReducer);
	tradeSort = require(ReplicatedStorage.Trade.tradeSortReducer);
	tradeInventoryOpen = require(ReplicatedStorage.Trade.tradeInventoryOpenReducer);
	tradeInfo = require(ReplicatedStorage.Trade.tradeInfoReducer);
	tradeResult = require(ReplicatedStorage.Trade.tradeResultReducer);
	rewardSpinnerConfig = require(ReplicatedStorage.RewardSpinner.rewardSpinnerConfigReducer);
	safesSelectedTypeEnum = require(ReplicatedStorage.Safes.safesSelectedTypeEnumReducer);
	safesInventoryItems = require(ReplicatedStorage.Safes.safesInventoryItemsReducer);
	safesInventoryOpen = require(ReplicatedStorage.Safes.safesInventoryOpenReducer);
	safesOpen = require(ReplicatedStorage.Safes.safesOpenReducer);
	tradeInventorySearchText = require(ReplicatedStorage.Trade.tradeInventorySearchTextReducer);
	lastDiedAt = require(ReplicatedStorage.App.lastDiedAtReducer);
	minimapSpawns = require(ReplicatedStorage.SpawnSelection.spawnSelectionSpawnsReducer);
	spawnSelectionOfferVisible = require(ReplicatedStorage.SpawnSelection.spawnSelectionOfferVisibleReducer);
	spawnSelectionReceivedAt = require(ReplicatedStorage.SpawnSelection.spawnSelectionReceivedAtReducer);
	likePromptConfig = require(ReplicatedStorage.LikePrompt.Reducer.likePromptConfigReducer);
	tooltipConfig = require(ReplicatedStorage.Tooltip.Reducer.tooltipConfigReducer);
	otherTradeServerListConfig = require(ReplicatedStorage.Trade.Reducer.otherTradeServerListConfigReducer);
}))
